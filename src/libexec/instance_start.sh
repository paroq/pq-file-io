#!/usr/bin/env bash

echo "Starting pq-file-io..."

if test -z "$CHASSIS_VAR_DIR"
then
	printf "please specify the chassis var directory in the env variable CHASSIS_VAR_DIRECTORY"
	exit 1
fi

if test -z "$PART_DIR"
then
	printf "please specify the part directory in the env variable PART_DIR"
	exit 1
fi

command="start"
chassis_var_dir=$CHASSIS_VAR_DIR
part_dir=$PART_DIR
instance_name=$INSTANCE_NAME

#echo "chasssis_var_dir=[$chassis_var_dir]"
#echo "part_dir=[$part_dir]"
#echo "instance_name=[$instance_name]"
#echo "pwd=[$PWD]"
#echo "command=[$command]"
#echo "PATH=[$PATH]"
#echo "LD_LIBRARY_PATH=[$LD_LIBRARY_PATH]"

if test -f ./pq-file-io.pid
then
	pid=$( cat ./pq-file-io.pid )
	if kill -0 $pid 2>/dev/null
	then
		printf "File-IO is already running.\n"
		exit 0
	fi
fi

"$part_dir/libexec/file-io-daemon" 2>&1 1>../log/file-io-daemon.log &
echo $! > pq-file-io.pid
