#!/usr/bin/env bash

echo "starting pq-file-io..."

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

echo "chasssis_var_dir=[$chassis_var_dir]"
echo "part_dir=[$part_dir]"
echo "instance_name=[$instance_name]"
echo "pwd=[$PWD]"
echo "command=[$command]"
echo "PATH=[$PATH]"
echo "LD_LIBRARY_PATH=[$LD_LIBRARY_PATH]"

"$part_dir/libexec/file-io-daemon" "&"
echo $! > pq-file-io.pid
