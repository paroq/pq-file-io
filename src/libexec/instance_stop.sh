#!/usr/bin/env bash

echo "stopping pq-file-io..."

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

command="stop"
chassis_var_dir=$CHASSIS_VAR_DIR
part_dir=$PART_DIR
pid=$( cat pq-file-io.pid 2>/dev/null )

if test -z "$pid"
then
	echo "pq-file-io is not running"
	exit 0
fi

echo "chassis_var_dir=[$chassis_var_dir]"
echo "part_dir=[$part_dir]"
kill -TERM $pid

