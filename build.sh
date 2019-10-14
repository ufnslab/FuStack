#!/bin/bash

set -x 
script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

CLEAN=

if [ "$1" = "clean" ]; then
		CLEAN=clean
		shift
fi

CUR_DIR=$scriptpath

export FUSTACK_DIR=$CUR_DIR/FuStack
export BUILD_WITH_DPDK=true
export RTE_SDK=$1

BUILD_DIR=$1
DPDK_CONFIG=$2
DPDK_VERSION=
LINUX_DIR=/new_disk/br2_build/project/public/include
#/usr/src/linux-headers-4.9.0-6-common/include

make -f Makefile $CLEAN RTE_TARGET=$DPDK_CONFIG RTE_KERNELDIR=$LINUX_DIR

unset BUILD_WITH_DPDK
unset FUSTACK_DIR
unset RTE_SDK
