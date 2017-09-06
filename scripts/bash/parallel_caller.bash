#! /bin/bash
#
# parallel_caller.bash
# Copyright (C) 2017 StrayWarrior <i@straywarrior.com>

ns_stray_parallel_caller() {
    [ $1 ] && local func=$1
    [ $2 ] && local range_s=$2
    [ $3 ] && local range_e=$3
    [ $4 ] && local max_thread=$4 || local max_thread=1

    local stride=$(((range_e - range_s + max_thread - 1) / max_thread))
    local thread
    for thread in `seq 1 $max_thread`; do
        local seg_s=$((stride * (thread - 1) + range_s))
        local seg_e=$((stride * thread - 1 + range_s))
        echo "Start thread $thread, range $seg_s -> $seg_e"
        $func $seg_s $seg_e &
    done
}
