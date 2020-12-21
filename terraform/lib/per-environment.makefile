# our terraform helper script is up a couple directories
TF_ROOT := $(shell git rev-parse --show-toplevel)
TF := $(TF_ROOT)/terraform/tf

include $(TF_ROOT)/terraform/lib/common.makefile

## Generate a new ssh keypair for adding to EC2. USE A PASSPHRASE!
new-ec2-keypair-%:
	ssh-keygen -t rsa -b 4096 -f ~/.ssh/$* -C "ec2 keypair for $*"

.PHONY: all

all: help

## Print variable contents from the command line, eg: 'make print-SHELL'
print-%: ; @echo $*=$($*)

## Generate and show an execution plan for a role, but do not save eg: make plan-nosave-consul
plan-nosave-%:
	cd $* && make && make plan-nosave

## plan-deep for a role, eg: make plan-deep-consul
plan-deep-%:
	cd $* && make && make plan-deep

## plan-destroy for a role
plan-destroy-%:
	cd $* && make && make plan-destroy

## Generate and show a detailed execution plan for a role, and save locally
plan-% plan-save-%:
	cd $* && make && make plan

## apply-saved-plan for a role
apply-saved-plan-%:
	cd $* && make && make apply-saved-plan

## apply for a role
apply-%:
	cd $* && make && make apply

## destroy for a role
destroy-%:
	cd $* && make && make destroy

## Create a new role from the role_template
new-role-%:
	@mkdir $*
	@rsync -a $(TF_ROOT)/lib/role_template/ $*
	@cd $* && make backend.tf.json
	@perl -pi -e 's/ROLE_NAME/$*/g;' $*/locals.tf
	@pwd | grep data && rm -f $*/iam_role.tf || true
