PWD := $(shell pwd)

ARCH := arm64
ARCH_TYPE := arm64
CROSS_COMPILE := aarch64-linux-android-
KERNEL_DIR := ${ANDROID_PRODUCT_OUT}/obj/kernel/
GPU_TYPE ?= XAQ2

DEBUG = 0
ABI = aapcs-linux
ENABLE_ARM_L2_CACHE = 1
NO_DMA_COHERENT = 1
CONFIG_DOVE_GPU = 0
ANDROID = 1
ENABLE_GPU_CLOCK_BY_DRIVER = 1
USE_ARCH_REG = 0
BUILD_OPTION_USE_GPU_FREQ=0
FPGA_BUILD=1

BUILD_OPTIONS  = DEBUG=${DEBUG}
BUILD_OPTIONS += ABI=${ABI}
BUILD_OPTIONS += ENABLE_ARM_L2_CACHE=${ENABLE_ARM_L2_CACHE}
BUILD_OPTIONS += NO_DMA_COHERENT=${NO_DMA_COHERENT}
BUILD_OPTIONS += CONFIG_DOVE_GPU=${CONFIG_DOVE_GPU}
BUILD_OPTIONS += ANDROID=${ANDROID}
BUILD_OPTIONS += ENABLE_GPU_CLOCK_BY_DRIVER=${ENABLE_GPU_CLOCK_BY_DRIVER}
BUILD_OPTIONS += USE_ARCH_REG=${USE_ARCH_REG}
BUILD_OPTIONS += USE_GPU_FREQ=${BUILD_OPTION_USE_GPU_FREQ}
BUILD_OPTIONS += FPGA_BUILD=${FPGA_BUILD}

GCX00_COMPILE_ENV := ${BUILD_OPTIONS} ARCH=${ARCH} ARCH_TYPE=${ARCH_TYPE} CROSS_COMPILE=${CROSS_COMPILE}\
    AQROOT=${PWD} AQARCH=${PWD}/arch/${GPU_TYPE} KERNEL_DIR=${KERNEL_DIR}

all:
	+$(MAKE) ${GCX00_COMPILE_ENV} -f Kbuild

clean:
	+$(MAKE) ${GCX00_COMPILE_ENV} -f Kbuild clean

