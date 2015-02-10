#!/usr/bin/env bash

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

if ! test -f "./pq-file-io.pid"
then
	printf "File-IO is not running.\n"
	exit 0
fi

pid=$( cat ./pq-file-io.pid )

if test -z "$pid"
then
	printf "File-IO is not running.\n"
	exit 0
fi


if kill -0 $pid 2> /dev/null
then
	printf "File-IO is running.\n"
	printf "pid=[$pid]\n"
else
	printf "File-IO is not running.\n"
	rm -f ./pq-file-io.pid
fi
