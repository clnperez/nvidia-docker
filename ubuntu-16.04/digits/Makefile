# Copyright (c) 2016, NVIDIA CORPORATION. All rights reserved.

BUILD_ARCH = .$(shell uname -m)
ifneq ($(BUILD_ARCH),.ppc64le)
    BUILD_ARCH =
endif

ifeq ($(BUILD_ARCH), .ppc64le)
    include ../../mk/digits_ppc64le.mk
else
    $(warning "No ubuntu-16.04 digits build target for the current archicture")
endif
