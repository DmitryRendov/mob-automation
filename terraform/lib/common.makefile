# the most important line in any shell script (exit on uncaught errors)
SHELL := $(SHELL) -e

## Since we do not actually compile anything, the builtin rules just clutter debugging
MAKEFLAGS += --no-builtin-variables
MAKEFLAGS += --no-builtin-rules

# Set some vars for our architecture
# Terraform sets uses underscores to separate system type, but GitHub uses hyphens.
# Assume 64 bits, and only Linux/Darwin
uname_s := $(shell uname -s)
ifeq ($(uname_s),Darwin)
GO_ARCH=darwin_amd64
else
GO_ARCH=linux_amd64
endif

ifeq ($(uname_s),Darwin)
ARCH=darwin-amd64
else
ARCH=linux-amd64
endif

default:: help

.PHONY : help

# Magic help adapted: from https://gitlab.com/depressiveRobot/make-help/blob/master/help.mk (MIT License)
## This help screen
help:
	@printf "Available targets:\n\n"
	@awk -F: '/^[a-zA-Z\-_0-9%\\ ]+:/ { \
			helpMessage = match(lastLine, /^## (.*)/); \
			if (helpMessage) { \
					helpCommand = $$1; \
					helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
					printf "  \x1b[32;01m%-35s\x1b[0m %s\n", helpCommand, helpMessage; \
			} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort -u
	@printf "\n"
