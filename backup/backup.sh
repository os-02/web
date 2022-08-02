#!/bin/bash
set -e
#进入脚本所在路径
cd `dirname $0`
#获取脚本所在路径
ROOT_PATH=$(pwd)
LOG_PATH=/dev/null
RUN_TIME=$(date '+%Y%m%d%H%M%S')

FOLDER=../app
SPEC_FOLDERS=(../auth ../gateway)
BACKUP_DST=$ROOT_PATH

log(){
	    echo "$(date --rfc-3339 seconds) $1" | tee -a $LOG_PATH
}

function backupInFolder(){
	cd $FOLDER
	for item in *
	do
		if [ -d "$item" ]; then
			log "backing up folder app/$item"
			mkdir -p $BACKUP_DST/$item
			packup $item $BACKUP_DST/$item
		fi
    done
	cd $ROOT_PATH
}

function backupFolder(){
	cd $1/../
	local folder_name=$(basename $1)
	mkdir -p $BACKUP_DST/$folder_name
	packup $folder_name $BACKUP_DST/$folder_name
	cd $ROOT_PATH
}

#$1 被备份的文件夹
#$2 备份的压缩包存放的路径
function packup(){
	tar acf $2/$1.$RUN_TIME.tar.zstd $1
}

function backupSpecFolder(){
	for path in ${SPEC_FOLDERS[@]}
	do
		log "backing up spec_folder $path"
	    backupFolder $path
	done
}

backupInFolder
backupSpecFolder
