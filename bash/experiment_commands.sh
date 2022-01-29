fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=False \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=4 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=48 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=4 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=48 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=1 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=12 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=4 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=48 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=4 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=48 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=False

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=False \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_resnet50 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=2 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=24 \
model=centi_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=base \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

fuser -k /dev/nvidia*; \
python $CODE_DIR/run.py \
hydra.verbose=True \
trainer=default \
resume=True \
batch_size=64 \
wandb_project_name=TALI-gcp-sweep-1 \
trainer.gpus=8 \
trainer.auto_scale_batch_size=False \
datamodule.config.rescan_paths=True \
datamodule.prefetch_factor=3 \
datamodule.num_workers=96 \
model=base_modus_prime_vi-transformer16 \
datamodule.config.training_set_size_identifier=milli \
datamodule.config.modality_config.image=True \
datamodule.config.modality_config.text=True \
datamodule.config.modality_config.audio=True \
datamodule.config.modality_config.video=True

