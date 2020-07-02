#!/usr/bin/env bash
LOCAL_DIR="/mnt/megadrive/public/gdrive-upload/drive/game saves/Terraria/Worlds/backups"
REMOTE_DIR="gdrive:drive/game saves/Terraria/Worlds/backups"
rclone sync --drive-acknowledge-abuse $LOCAL_DIR $REMOTE_DIR