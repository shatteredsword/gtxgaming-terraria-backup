#!/usr/bin/env bash
#gtxgaming ftp login credentials
USER=username@example.com
PASS="-qYeP_9RL#^gKKcZ*sdzhG2bsAW8UPTu"
#gtxgaming ftp server URL
SERVER=ftp://terraria.example.com:8821
#your terraria map file
BACKUP=Mapname.wld.bak
#the path to your backup directory (DON'T PUT ANY OTHER FILES IN THIS DIRECTORY)
BACKUP_DIR="/mnt/megadrive/public/gdrive-upload/drive/game saves/Terraria/Worlds/backups"
cd BACKUP_DIR
lftp -u $USER,$PASS $SERVER <<EOF
# the next 2 lines put you in ftpes mode
set ftp:ssl-force true
set ftp:ssl-protect-data true
# gtxgaming really needs to fix their certs
set ssl:verify-certificate no
cd 000.000.00.00_7777/Saved
mget Mapname.wld.bak
exit
EOF
#mv Mapname.wld.bak 
TODAY=$(printf '%(%Y-%m-%d)T\n' -1)
FILENAME="${TODAY}-${BACKUP}"
mv "$BACKUP" $FILENAME
# only keep the newest 7 backups
ls -t | tail -n +8 | xargs rm -f --
