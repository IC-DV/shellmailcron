#!/bin/bash
if
find / -name full.sh -exec {} \; > maillog  &&
mailx root@localhost < maillog &&
rm maillog

then
exit 0
else 
echo "file not found"
fi
