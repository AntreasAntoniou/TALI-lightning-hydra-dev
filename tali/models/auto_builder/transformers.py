from __future__ import print_function

import logging as log
from typing import Optional

import torch
import torch.nn as nn
import torch.nn.functional as F
from clip.model import ModifiedResNet, AttentionPool2d
from einops import rearrange, repeat
from gate.model_blocks.auto_builder_modules.auto_builder_conv_blocks import (
    SqueezeExciteConv1dBNLeakyReLU,
)

from transformers import (
    CLIPTextConfig,
    CLIPTextModel,
    CLIPVisionConfig,
    CLIPVisionModel,
)

from tali.config_repository import (
    AutoAveragerConfig,
    AutoCLIPResNetConfig,
    AutoCLIPTextTransformerConfig,
    AutoCLIPVisionTransformerConfig,
    AutoConv1DTransformersConfig,
    AutoVideoTransformersConfig,
)
from tali.models.auto_builder.base import (
    AvgPoolFlexibleDimension,
    BaseLinearOutputModel,
)
from tali.models.auto_builder.densenet import DenseNetEmbedding


class FCCNetwork(nn.Module):
    def __init__(
        self,
        num_hidden_features,
        embedding_output_features,
        num_hidden_layers,
        activation_fn=F.leaky_relu,
    ):
        super(FCCNetwork, self).__init__()
        self.layer_dict = nn.ModuleDict()
        self.is_layer_built = False
        self.num_hidden_features = num_hidden_features
        self.embedding_output_features = embedding_output_features
        self.num_hidden_layers = num_hidden_layers
        self.activation_fn = activation_fn

    def build(self, input_shape):
        out = torch.zeros(input_shape)

        for i in range(self.num_hidden_layers):
            self.layer_dict[f"fcc_layer_{i}"] = nn.Linear(
                in_features=out.shape[1],
                out_features=self.num_hidden_features,
                bias=True,
            )
            out = self.activation_fn(self.layer_dict[f"fcc_layer_{i}"].forward(out))

        self.layer_dict["fcc_layer_output"] = nn.Linear(
            in_features=out.shape[1],
            out_features=self.embedding_output_features,
            bias=True,
        )

        out = self.layer_dict["fcc_layer_output"].forward(out)

        self.is_layer_built = True

        log.debug(
            f"Build {self.__class__.__name__} with input shape {input_shape} with "
            f"output shape {out.shape}"
        )

    def forward(self, x):
        if not self.is_layer_built:
            self.build(input_shape=x.shape)
            self.type_as(x)

        out = x

        self.type_as(out)

        for i in range(self.num_hidden_layers):
            out = self.activation_fn(self.layer_dict[f"fcc_layer_{i}"].forward(out))

        out = self.layer_dict["fcc_layer_output"].forward(out)

        return out


class ChooseSpecificTimeStepFromVector(nn.Module):
    def __init__(self, time_step_to_choose):
        super(ChooseSpecificTimeStepFromVector, self).__init__()
        self.time_step_to_choose = time_step_to_choose

    def forward(self, x):

        return x, x[:, self.time_step_to_choose, :]


class Conv1DTransformer(nn.Module):
    def __init__(
        self,
        grid_patch_size: int,
        densenet_num_filters: int,
        densenet_num_stages: int,
        densenet_num_blocks: int,
        densenet_dilated: bool,
        densenet_adaptive_pool_output_features: int,
        transformer_num_filters: int,
        transformer_num_layers: int,
        transformer_num_heads: int,
        transformer_dim_feedforward: int,
        stem_conv_bias: False,
    ):
        super(Conv1DTransformer, self).__init__()
        self.grid_patch_size = grid_patch_size
        self.densenet_num_filters = densenet_num_filters
        self.densenet_num_stages = densenet_num_stages
        self.densenet_num_blocks = densenet_num_blocks
        self.densenet_dilated = densenet_dilated
        self.densenet_adaptive_pool_output_features = (
            densenet_adaptive_pool_output_features
        )
        self.transformer_num_filters = transformer_num_filters
        self.transformer_num_layers = transformer_num_layers
        self.transformer_num_heads = transformer_num_heads
        self.transformer_dim_feedforward = transformer_dim_feedforward
        self.stem_conv_bias = stem_conv_bias
        self.positional_embeddings = nn.Parameter(
            data=torch.randn((int(self.grid_patch_size), self.transformer_num_filters)),
            requires_grad=True,
        )
        self.is_built = False

    def build(self, input_shape):
        dummy_x = torch.zeros(input_shape)

        out = dummy_x

        self.layer_dict = nn.ModuleDict()

        self.layer_dict["conv1d_densenet"] = DenseNetEmbedding(
            num_filters=self.densenet_num_filters,
            num_stages=self.densenet_num_stages,
            num_blocks=self.densenet_num_blocks,
            dilated=self.densenet_dilated,
            processing_block_type=SqueezeExciteConv1dBNLeakyReLU,
        )

        out = self.layer_dict["conv1d_densenet"].forward(out)

        log.debug(f"conv1d_densenet output shape {out.shape}")

        self.layer_dict["conv_feature_pooling"] = nn.Conv1d(
            in_channels=out.shape[1],
            out_channels=self.transformer_num_filters,
            kernel_size=1,
        )

        out = self.layer_dict["conv_feature_pooling"].forward(out)
        log.debug(f"conv_feature_pooling output shape {out.shape}")

        self.layer_dict["conv_spatial_pool"] = nn.AdaptiveAvgPool1d(
            output_size=self.grid_patch_size
        )

        out = self.layer_dict["conv_spatial_pool"].forward(out)
        log.debug(f"conv_spatial_pool output shape {out.shape}")

        out = rearrange(out, "b f h -> (b h) f")

        self.layer_dict["stem_layer_normalization"] = nn.LayerNorm(out.shape[1])

        out = self.layer_dict["stem_layer_normalization"].forward(out)
        log.debug(f"stem_layer_normalization output shape {out.shape}")

        out = rearrange(out, "(b s) (f) -> b s f", b=dummy_x.shape[0])
        log.debug(f"rearrange output shape {out.shape}")

        self.positional_embeddings = self.positional_embeddings.type_as(out)

        positional_embeddings = repeat(
            self.positional_embeddings, "p f -> b p f", b=dummy_x.shape[0]
        )

        out = out + positional_embeddings
        log.debug(f"out + positional_embeddings output shape {out.shape}")

        self.layer_dict["transformer_encoder_layer"] = nn.TransformerEncoderLayer(
            d_model=self.transformer_num_filters,
            dim_feedforward=self.transformer_dim_feedforward,
            nhead=self.transformer_num_heads,
            activation=F.gelu,
            dropout=0.0,
            batch_first=True,
            norm_first=True,
        )
        self.layer_dict["transformer_encoder"] = nn.TransformerEncoder(
            encoder_layer=self.layer_dict["transformer_encoder_layer"],
            num_layers=self.transformer_num_layers,
        )

        out = self.layer_dict["transformer_encoder"].forward(out)
        log.debug(f"transformer_encoder output shape {out.shape}")

        self.is_built = True
        log.debug(
            f"Build {self.__class__.__name__} with input shape {input_shape} with "
            f"output shape {out.shape}"
        )

    def forward(self, x):
        x = x.type(torch.float32)

        if not self.is_built:
            self.build(input_shape=x.shape)

        out = x

        out = self.layer_dict["conv1d_densenet"].forward(out)

        out = self.layer_dict["conv_feature_pooling"].forward(out)

        out = self.layer_dict["conv_spatial_pool"].forward(out)

        out = rearrange(out, "b f h -> (b h) f")

        out = self.layer_dict["stem_layer_normalization"].forward(out)

        out = rearrange(out, "(b s) (f) -> b s f", b=x.shape[0])

        self.positional_embeddings = self.positional_embeddings.type_as(out)

        positional_embeddings = repeat(
            self.positional_embeddings, "p f -> b p f", b=x.shape[0]
        )

        out = out + positional_embeddings

        out = self.layer_dict["transformer_encoder"].forward(out)

        return out


class VideoTransformer(nn.Module):
    def __init__(
        self,
        transformer_num_filters: int,
        transformer_num_layers: int,
        transformer_num_heads: int,
        transformer_dim_feedforward: int,
        image_embedding: nn.Identity(),
    ):
        super(VideoTransformer, self).__init__()
        self.transformer_num_filters = transformer_num_filters
        self.transformer_num_layers = transformer_num_layers
        self.transformer_num_heads = transformer_num_heads
        self.transformer_dim_feedforward = transformer_dim_feedforward

        self.image_embedding = image_embedding
        self.layer_dict = nn.ModuleDict()
        self.layer_params = nn.ParameterDict()
        self.is_built = False

    def build(self, input_shape):
        dummy_x = torch.zeros(input_shape)

        out = dummy_x.view(-1, dummy_x.shape[-3], dummy_x.shape[-2], dummy_x.shape[-1])

        _, out = self.image_embedding(out)

        out = out.view(dummy_x.shape[0] * dummy_x.shape[1], -1)

        self.linear_projection = nn.Linear(
            out.shape[-1], self.transformer_num_filters, bias=True
        )

        out = self.linear_projection.forward(out)

        out = out.view(dummy_x.shape[0], dummy_x.shape[1], -1)

        self.positional_embeddings = nn.Parameter(
            torch.empty(size=(out.shape[1], out.shape[2]))
        ).type_as(out)

        nn.init.normal(self.positional_embeddings)

        out = out + repeat(self.positional_embeddings, "p f -> b p f", b=out.shape[0])

        self.layer_dict["transformer_encoder_layer"] = nn.TransformerEncoderLayer(
            d_model=self.transformer_num_filters,
            dim_feedforward=self.transformer_dim_feedforward,
            nhead=self.transformer_num_heads,
            batch_first=True,
        )
        self.layer_dict["transformer_encoder"] = nn.TransformerEncoder(
            encoder_layer=self.layer_dict["transformer_encoder_layer"],
            num_layers=self.transformer_num_layers,
        )

        out = self.layer_dict["transformer_encoder"].forward(out)

        self.is_built = True

        log.debug(
            f"Build {self.__class__.__name__} with input shape {input_shape} with "
            f"output shape {out.shape}"
        )

    def forward(self, x):

        if not self.is_built:
            self.build(input_shape=x.shape)

        out = x.view(-1, x.shape[-3], x.shape[-2], x.shape[-1])

        _, out = self.image_embedding(out)

        out = out.view(x.shape[0] * x.shape[1], -1)

        out = self.linear_projection.forward(out)

        out = out.view(x.shape[0], x.shape[1], -1)

        self.positional_embeddings = self.positional_embeddings.type_as(out)

        out = out + repeat(self.positional_embeddings, "p f -> b p f", b=out.shape[0])

        out = self.layer_dict["transformer_encoder"].forward(out)

        return out

    def connect_image_embedding(self, image_embedding):
        self.image_embedding = image_embedding


class Averager(nn.Module):
    def __init__(self, image_embedding: nn.Identity()):
        super(Averager, self).__init__()

        self.image_embedding = image_embedding
        self.is_built = False

    def build(self, input_shape):
        dummy_x = torch.zeros(input_shape)

        out = dummy_x.view(-1, dummy_x.shape[-3], dummy_x.shape[-2], dummy_x.shape[-1])

        if self.image_embedding is not None:
            _, out = self.image_embedding(out)

        out = out.view(dummy_x.shape[0], dummy_x.shape[1], -1)

        self.is_built = True

        log.debug(
            f"Build {self.__class__.__name__} with input shape {input_shape} with "
            f"output shape {out.shape}"
        )

    def forward(self, x):

        if not self.is_built:
            self.build(input_shape=x.shape)

        out = x.view(-1, x.shape[-3], x.shape[-2], x.shape[-1])

        if self.image_embedding is not None:
            _, out = self.image_embedding(out)

        out = out.view(x.shape[0], x.shape[1], -1)

        return out

    def connect_image_embedding(self, image_embedding):
        self.image_embedding = image_embedding


class AutoConv1DTransformers(BaseLinearOutputModel):
    def __init__(self, config: AutoConv1DTransformersConfig):
        feature_embedding_modules = [
            nn.InstanceNorm1d,
            Conv1DTransformer,
            AvgPoolFlexibleDimension,
        ]
        feature_embeddings_args = [
            dict(num_features=2, affine=True, track_running_stats=True),
            dict(
                grid_patch_size=config.grid_patch_size,
                densenet_num_filters=config.densenet_num_filters,
                densenet_num_stages=config.densenet_num_stages,
                densenet_num_blocks=config.densenet_num_blocks,
                densenet_adaptive_pool_output_features=config.densenet_adaptive_pool_output_features,
                densenet_dilated=config.densenet_dilated,
                transformer_num_filters=config.transformer_num_filters,
                transformer_num_layers=config.transformer_num_layers,
                transformer_num_heads=config.transformer_num_heads,
                transformer_dim_feedforward=config.transformer_dim_feedforward,
                stem_conv_bias=True,
            ),
            dict(dim=1),
        ]
        super(AutoConv1DTransformers, self).__init__(
            embedding_output_features=config.embedding_output_features,
            feature_embedding_module_list=feature_embedding_modules,
            feature_embedding_args=feature_embeddings_args,
        )


class AutoVideoTransformers(BaseLinearOutputModel):
    def __init__(
        self,
        config: AutoVideoTransformersConfig,
        image_embedding: Optional[nn.Module] = None,
    ):
        self.config = config
        feature_embedding_modules = [
            VideoTransformer,
            AvgPoolFlexibleDimension,
        ]

        feature_embeddings_args = [
            dict(
                image_embedding=image_embedding,
                transformer_num_filters=config.transformer_num_filters,
                transformer_num_layers=config.transformer_num_layers,
                transformer_num_heads=config.transformer_num_heads,
                transformer_dim_feedforward=config.transformer_dim_feedforward,
            ),
            dict(dim=1),
        ]
        super(AutoVideoTransformers, self).__init__(
            embedding_output_features=config.embedding_output_features,
            feature_embedding_module_list=feature_embedding_modules,
            feature_embedding_args=feature_embeddings_args,
        )

    def connect_image_embedding(self, image_embedding: nn.Module):
        self.__init__(config=self.config, image_embedding=image_embedding)


class AutoAverager(BaseLinearOutputModel):
    def __init__(
        self,
        config: AutoAveragerConfig,
        image_embedding: Optional[nn.Module] = None,
    ):
        self.config = config
        feature_embedding_modules = [
            Averager,
            AvgPoolFlexibleDimension,
        ]

        feature_embeddings_args = [
            dict(image_embedding=image_embedding),
            dict(dim=config.dim),
        ]
        super(AutoAverager, self).__init__(
            embedding_output_features=config.embedding_output_features,
            feature_embedding_module_list=feature_embedding_modules,
            feature_embedding_args=feature_embeddings_args,
        )

    def connect_image_embedding(self, image_embedding: nn.Module):
        self.__init__(config=self.config, image_embedding=image_embedding)


class AutoCLIPVisionTransformer(BaseLinearOutputModel):
    def __init__(self, config: AutoCLIPVisionTransformerConfig):
        feature_embedding_modules = [
            nn.InstanceNorm2d,
            CLIPVisionModel,
        ]

        feature_embeddings_args = [
            dict(num_features=3, affine=True, track_running_stats=True),
            dict(
                config=CLIPVisionConfig(
                    hidden_size=config.transformer_num_filters,
                    intermediate_size=config.transformer_dim_feedforward,
                    num_hidden_layers=config.transformer_num_layers,
                    num_attention_heads=config.transformer_num_heads,
                    image_size=config.image_resolution,
                    patch_size=config.grid_patch_size,
                    hidden_act="quick_gelu",
                    layer_norm_eps=0.00001,
                    dropout=0.0,
                    attention_dropout=0.0,
                    initializer_range=0.02,
                    initializer_factor=1.0,
                )
            ),
        ]
        super(AutoCLIPVisionTransformer, self).__init__(
            embedding_output_features=config.embedding_output_features,
            feature_embedding_module_list=feature_embedding_modules,
            feature_embedding_args=feature_embeddings_args,
        )


class ModifiedResNetNonSquareImages(ModifiedResNet):
    """
    A ResNet class that is similar to torchvision's but contains the following changes:
    - There are now 3 "stem" convolutions as opposed to 1, with an average pool instead of a max pool.
    - Performs anti-aliasing strided convolutions, where an avgpool is prepended to convolutions with stride > 1
    - The final pooling layer is a QKV attention instead of an average pool
    """

    def __init__(self, layers, output_dim, heads, input_resolution=224, width=64):
        super(ModifiedResNetNonSquareImages, self).__init__(
            layers, output_dim, heads, input_resolution[0], width
        )

        embed_dim = width * 32  # the ResNet feature dimension
        self.attnpool = AttentionPool2d(
            height=input_resolution[0] // 32,
            width=input_resolution[1] // 32,
            embed_dim=embed_dim,
            num_heads=heads,
            output_dim=output_dim,
        )


class AutoCLIPResNet(BaseLinearOutputModel):
    def __init__(self, config: AutoCLIPResNetConfig):
        vision_heads = config.vision_width * 32 // 64

        feature_embedding_modules = [
            nn.InstanceNorm2d,
            ModifiedResNetNonSquareImages,
        ]

        feature_embeddings_args = [
            dict(num_features=3, affine=True, track_running_stats=True),
            dict(
                layers=config.vision_layers,
                output_dim=config.embedding_output_features,
                heads=vision_heads,
                input_resolution=config.image_resolution,
                width=config.vision_width,
            ),
        ]
        super(AutoCLIPResNet, self).__init__(
            embedding_output_features=config.embedding_output_features,
            feature_embedding_module_list=feature_embedding_modules,
            feature_embedding_args=feature_embeddings_args,
        )


class AutoCLIPTextTransformer(BaseLinearOutputModel):
    def __init__(self, config: AutoCLIPTextTransformerConfig):
        text_config = CLIPTextConfig(
            vocab_size=config.vocab_size,
            hidden_size=config.transformer_num_filters,
            intermediate_size=config.transformer_dim_feedforward,
            num_hidden_layers=config.transformer_num_layers,
            num_attention_heads=config.transformer_num_heads,
            max_position_embeddings=config.context_length,
            hidden_act="quick_gelu",
            layer_norm_eps=0.00001,
            dropout=0.0,
            attention_dropout=0.0,
            initializer_range=0.02,
            initializer_factor=1.0,
            pad_token_id=1,
            bos_token_id=0,
            eos_token_id=2,
        )
        feature_embedding_modules = [CLIPTextModel]

        feature_embeddings_args = [dict(config=text_config)]

        super(AutoCLIPTextTransformer, self).__init__(
            embedding_output_features=config.embedding_output_features,
            feature_embedding_module_list=feature_embedding_modules,
            feature_embedding_args=feature_embeddings_args,
            input_type="long",
        )
