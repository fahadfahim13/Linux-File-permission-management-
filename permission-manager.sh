#!/bin/bash

set -x
set -o

# Removing previous log file and creating new
rm -rf ./logs/permission_changes.log
curdate=$(date "+%F-%H-%M-%S")
logfile="./logs/$curdate.log"
touch $logfile


dry_run=false

if [[ $2 == "--dr" ]]; then
	dry_run=true
fi

updateText() {
	
	echo "Updating text file: $1"
	current_perm=$(stat -c "%A" $1)
	if [[ dry_run == false ]]; then
		chmod 644 $1
		next_perm=$(stat -c "%A" $1)
	else
		next_perm="rw-r--r--"
	fi

	echo "$(date) Permission for file $1 is changed from $current_perm to $next_perm;" >> $logfile

}

updateConf(){
	echo "Updating conf file: $1"
	current_perm=$(stat -c "%A" $1)
	if [[ dry_run == false ]]; then
		chmod 544 $1
		next_perm=$(stat -c "%A" $1)
	else
		next_perm="r-xr--r--"
	fi

	echo "$(date) Permission for file $1 is chaned from $current_perm to $next_perm;" >> $logfile
}

updateSh(){
	echo "Updating SH file: $1"
	current_perm=$(stat -c "%A" $1)
	if [[ dry_run == false ]]; then
		chmod 744 $1
		next_perm=$(stat -c "%A" $1)
	else
		next_perm="rwxr--r--"
	fi
	
	echo "$(date) Permission for file $1 is changed from $current_perm to $next_perm;" >> $logfile
}


updateFile(){

	if [[ $1 == *.txt ]]; then
		updateText $1
	elif [[ $1 == *.conf ]]; then
		updateConf $1
	elif [[ $1 == *.sh ]]; then
		updateSh $1
	else
		echo "No permission needed for "$1
	fi
}

updatePermission(){
	find ./files -type f \( -name "*.txt" -o -name "*.sh" -o -name "*.conf" \) | 
	while read filename;
	do
		updateFile $filename
	done

}

updatePermission # Calling function



