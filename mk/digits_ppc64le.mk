# Copyright (c) 2016, NVIDIA CORPORATION. All rights reserved.

NV_DOCKER ?= docker

DIGITS_VERSIONS := 5.0

DIGITS_LATEST := $(word 1, $(DIGITS_VERSIONS))

# Building Docker images in parallel will duplicate identical layers.
.NOTPARALLEL:
.PHONY: all latest $(DIGITS_VERSIONS)

all: $(DIGITS_VERSIONS) latest

#################### NVIDIA DIGITS ####################

latest: $(DIGITS_LATEST)
	$(NV_DOCKER) tag digits:$< digits

5.0: $(CURDIR)/5.0/Dockerfile.ppc64le
	make -C $(CURDIR)/../caffe 0.14
	$(NV_DOCKER) build -f $(CURDIR)/5.0/Dockerfile.ppc64le -t digits:$@ $(CURDIR)/$@
