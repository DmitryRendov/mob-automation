TF_ROOT := $(shell git rev-parse --show-toplevel)
TF := $(TF_ROOT)/terraform/tf

# name of the directory containing this Makefile,
# ( used to name the S3 storage key for this component's terraform remote config)
COMPONENT := $(lastword $(subst /, ,$(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))))
ENVIRONMENT=$$(jq -r '.variable.environment.default' environment.tf.json)

all: enable-remote-state enable-plugins update ## Configure this module for Terraforming

-include role-extra.makefile

include $(TF_ROOT)/terraform/lib/common.makefile
include $(TF_ROOT)/terraform/lib/common-build-targets.makefile
