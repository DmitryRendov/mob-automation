#!/bin/bash

set -e

[[ $1 = "check" ]] && { echo "Terraform Wrapper - Version: 0.1" ; exit 0 ; }

root_dir=$(dirname $0)
export TERRAFORM_CONFIG="${TERRAFORM_CONFIG:-${root_dir}/lib/terraformrc}"

TERRAFORM="${TERRAFORM:-terraform}"

# Hashicorp, do not spy on me!
export CHECKPOINT_DISABLE=1

>&2 echo -e "Running $(type -path $TERRAFORM)\n$($TERRAFORM version)"

exec $TERRAFORM "$@"
