#!/bin/bash


updateText() {
	#logger -s "Update text File" > ./logs/permission_changes.log
	echo "Updating text file: $1"
	current_perm=$(stat -c "%A" $1)
	chmod 644 $1
	next_perm=$(stat -c "%A" $1)
	echo "Permission for file $1 is changed from $current_perm to $next_perm;" >> ./logs/permission_changes.log
	
}

updateConf(){
	echo "Updating conf file: $1"
	current_perm=$(stat -c "%A" $1)
	chmod 544 $1
	next_perm=$(stat -c "%A" $1)
	echo "Permission for file $1 is chaned from $current_perm to $next_perm;" >> ./logs/permission_changes.log
}

updateSh(){
	echo "Updating SH file: $1"
	current_perm=$(stat -c "%A" $1)
	chmod 744 $1
	next_perm=$(stat -c "%A" $1)
	echo "Permission for file $1 is changed from $current_perm to $next_perm;" >> ./logs/permission_changes.log
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



