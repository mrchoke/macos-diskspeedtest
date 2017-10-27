#!/bin/bash

cat <<EOT

##############################
macOS Disk Speed Test
##############################

EOT

tstfile=`mktemp`
echo -n "Write Speed: "
dd if=/dev/zero bs=2048k of=$tstfile count=1024 2>&1 | awk  -F'[^0-9]*' 'END{print $4 / 1048576 ,"MB/sec"}'

echo -n "Read Speed: "
dd if=$tstfile bs=2048k of=/dev/null count=1024 2>&1 | awk  -F'[^0-9]*' 'END{print $4 / 1048576 ,"MB/sec"}'

rm -rf $tstfile
