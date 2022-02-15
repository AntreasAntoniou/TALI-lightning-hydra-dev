#export MOUNT_DIR="/mnt/disk/tali"
export MOUNT_DIR="/mnt/disk/scratch_ssd/antreas/"

export EXPERIMENTS_DIR="$HOME/experiments"
export EXPERIMENT_DIR="$HOME/experiments"
export PATH_CACHE_DIR="$HOME/path_cache"
export DATASET_DIR="$MOUNT_DIR/dataset"

if [ ! -d "$PATH_CACHE_DIR" ]; then
  mkdir -p $PATH_CACHE_DIR
  chmod -Rv 777 $PATH_CACHE_DIR
fi

if [ ! -d "$MOUNT_DIR" ]; then
  mkdir -p $MOUNT_DIR
  chmod -Rv 777 $MOUNT_DIR
fi

#mount -o discard,defaults /dev/sdb $MOUNT_DIR
mount -o ro,noload /dev/sdb $MOUNT_DIR


rm -rf $EXPERIMENTS_DIR

if [ ! -d "$EXPERIMENTS_DIR" ]; then
  mkdir -p $EXPERIMENTS_DIR
  chmod -Rv 777 $EXPERIMENTS_DIR
fi
########################################################################################


if [ ! -d "$DATASET_DIR" ]; then
  mkdir -p $DATASET_DIR
  chmod -Rv 777 $DATASET_DIR
fi

#if [ ! -d "$NEW_MOUNT_DIR" ]; then
#  mkdir -p $NEW_MOUNT_DIR
#  chmod -Rv 777 $NEW_MOUNT_DIR
#fi
#
#mount -o discard,defaults /dev/sdc $NEW_MOUNT_DIR