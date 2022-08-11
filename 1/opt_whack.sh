#!/bin/bash

set -e

# Please write a bash script which does the following:
# Starting in the /opt directory, locate all directories
# which contain a file called .prune-enable
# In those directories, delete any files named crash.dump
# In those directories, for any file having the suffix ".log",
#   if the file is larger than one megabyte, replace the file
#   with a file containing only the last 20,000 lines.

BEGIN="/opt"
PRUNE=".prune-enable"
CRASHFILE="crash.dump"
SIZELIMIT=1024 #1 MB in kilobytes
LINELIMIT=20000

function prune_files()
{
    for file in "$@"; do
        # expect something.log to be a file, but confirm anyway
        if [ ! -f ${file} ]; then
            continue
        fi
        # find filesize in kilobytes
        filesize=$(du -k "${file}" | awk '{print $1}')
        lines=$(wc -l "${file}" | awk '{print $1}')
        echo -n "$(readlink -f ${file})=${filesize}:${lines}"
        # check file size threshold
        if [ ${filesize} -gt ${SIZELIMIT} ]; then
            # check file lines threshold
            if [ ${lines} -gt ${LINELIMIT} ]; then
                echo -n " ...truncating"
                tail -n ${LINELIMIT} ${file} > ${file}.tmp
                mv ${file}.tmp ${file}
            fi
        fi
        echo
    done
}

# find directories which contain .prune-enable
prune_dirs=$(find "${BEGIN}" -type f -name .prune-enable 2>/dev/null | sed -r 's|/[^/]+$||')

# loop over those directories
for directory in ${prune_dirs}; do
    pushd ${directory} >/dev/null
    if [ -f crash.dump ]; then
        rm -v "$(readlink -f ${CRASHFILE})"
    fi
    prune_files *.log
    popd >/dev/null
done
