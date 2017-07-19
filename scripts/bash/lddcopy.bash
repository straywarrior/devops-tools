#! /bin/bash -e
#
# lddcopy.bash
# Copyright (C) 2017 StrayWarrior <i@straywarrior.com>
#
# Distributed under terms of the GPLv3 license.
#

[ $1 ] && target=$1
[ $2 ] && destination=$2

mkdir -p $destination

while read line ; do
    if [[ $line =~ ^.+=\>\ (.+)\ \(.+\)$ ]]; then
        libpath=${BASH_REMATCH[1]}
        echo "Copy ${libpath}"
        cp $libpath $destination/.
    fi
done < <(ldd $target)
