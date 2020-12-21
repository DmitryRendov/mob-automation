# -*- Makefile -*-

# Things that must be declared before including this .makefile:
#
# Vars:
#    $(TF)
# Targets:
#    check

export TF_IN_AUTOMATION ?= true
export TF_VAR_terraform_exec_role ?= $(TERRAFORM_EXEC_ROLE)

LOCK_JSON = .terraform/plugins/$(GO_ARCH)/lock.json

## Check for updates to modules
get-update: check
	$(TF) get -update

## Download and install modules for the configuration
update get: check
	$(TF) get

## Generate and show an execution plan
plan-nosave: check get select-default
	$(TF) plan $(ARGS)

## Generate and show an execution plan, and save locally
plan-save plan: check get select-default
	rm -f saved-plan
	$(TF) plan -out=saved-plan $(ARGS)
	@printf '=%.0s' {1..80}; printf '\n\n'
	@echo "Apply this saved plan: make apply-saved-plan\n"
	@printf '=%.0s' {1..80}; printf '\n\n'

## Note the space-semicolon to show this target has no rules, it exists only to whitelist workspaces for execution.
WORKSPACES = default alpha integration dev master
$(addprefix check-workspace-name-is-allowed-, $(WORKSPACES)): ;

## Select a Terraform workspace
select-%: credentials-checks
	@$(TF) workspace select $*

## Create a new workspace
new-workspace-%: check check-workspace-name-is-allowed-% atlantis-%
	@$(TF) workspace select $* || $(TF) workspace new $*

## List Workspaces
workspace-list list: credentials-checks
	@$(TF) workspace list

## Generate and show an execution plan, and save locally
plan-%-save plan-%: check get check-workspace-name-is-allowed-% select-%
	rm -f saved-$*-plan
	$(TF) plan -out=saved-$*-plan $(ARGS)
	@printf '=%.0s' {1..80}; printf '\n\n'
	@echo "Apply this saved plan: make apply-saved-plan-$*\n"
	@printf '=%.0s' {1..80}; printf '\n\n'

## Generate and show a detailed execution plan, and save locally
plan-deep: check get
	rm -f saved-plan
	$(TF) plan -out=saved-plan -module-depth=-1 $(ARGS)

## Generate and show a plan for DESTRUCTION, and save locally
plan-destroy: check get
	rm -f saved-plan
	$(TF) plan -destroy -out=saved-plan $(ARGS)

## Builds or changes infrastructure
apply: check get select-default
	$(TF) apply -auto-approve=false $(ARGS)

## Builds or changes infrastructure based on saved plan
apply-%: check get check-workspace-name-is-allowed-% select-%
	$(TF) apply -auto-approve=false $(ARGS)

## Builds or changes infrastructure based on saved plan
apply-saved-plan: check get select-default
	$(TF) apply -auto-approve=true $(ARGS) saved-plan
	rm -f saved-plan

## Builds or changes infrastructure based on saved plan
apply-saved-plan-%: check get check-workspace-name-is-allowed-% select-%
	$(TF) apply -auto-approve=true $(ARGS) saved-$*-plan
	rm -f saved-$*-plan

## Destroy Robinson family, DESTROY!!
destroy: check get select-default
	rm -f saved-plan
	$(TF) plan -destroy -out=saved-plan $(ARGS)
	@echo -n "Hit ^C now to cancel, or press return TO DESTROY. ARE YOU SURE?" ; read something
	$(TF) apply saved-plan
	rm -f saved-plan

## Destroy Robinson family, DESTROY!!
destroy-%: check get check-workspace-name-is-allowed-% select-%
	rm -f saved-$*-plan
	$(TF) plan -destroy -out=saved-$*-plan $(ARGS)
	@echo -n "Hit ^C now to cancel, or press return TO DESTROY. ARE YOU SURE?" ; read something
	$(TF) apply saved-$*-plan
	rm -f saved-$*-plan

## Destroy TF workspace and delete state
destroy-workspace-%: destroy-%
	$(MAKE) select-default
	$(TF) workspace delete $*

## Generate graph.png of TF depednencies
graph: check select-default
	$(TF) graph | dot -T png > graph.png
	echo created $(PWD)/graph.png

## Reconcile the TF state
refresh: check get select-default
	$(TF) refresh

## Reconcile the TF state
refresh-%: check get check-workspace-name-is-allowed-% select-%
	$(TF) refresh

## Show current TF state
show: check select-default
	$(TF) show

## Show current TF state
show-%: check select-%
	$(TF) show

## Generate a backend.tf.json file for storing remote state
backend.tf.json:
	@[[ -f $(TF_ROOT)/lib/create-backend-config ]] && $(TF_ROOT)/lib/create-backend-config $(shell basename $(PWD))

## Enables terraform remote config for S3
enable-remote-state: backend.tf.json .terraform/terraform.tfstate

## Enables terraform remote config for S3
.terraform/terraform.tfstate: backend.tf.json $(LOCK_JSON)

credentials-checks:
	@[[ $${TERRAFORM_EXEC_ROLE} ]]      || { echo TERRAFORM_EXEC_ROLE is not set; exit 1; }
	@[[ -z $${AWS_DEFAULT_REGION} ]]    || { echo AWS_DEFAULT_REGION environment variable need to be NOT SET - It overrides values in variables.tf, which can be bad.; exit 1; }
	@[[ -z $${AWS_ACCESS_KEY_ID} ]]     || { echo AWS_ACCESS_KEY_ID environment variable needs to be NOT SET.; exit 1; }
	@[[ -z $${AWS_SECRET_ACCESS_KEY} ]] || { echo AWS_SECRET_ACCESS_KEY environment variable needs to be NOT SET.; exit 1; }

## Initialize backends and download Terraform provider plugins
$(LOCK_JSON) init: global-variables.tf.json | credentials-checks
	$(TF) init -backend-config="role_arn=arn:aws:iam::501055688096:role/$(TERRAFORM_EXEC_ROLE)" $(INIT_ARGS)

# Check that our terraform script is functioning
script-checks:
	@$(TF) check >/dev/null || { echo terraform helper script missing ; exit 1 ; }

# Check that we have the appropriate python3 libs
python3-checks:
	@pip3 show GitPython >/dev/null || { echo 'GitPython for python3 must be installed. Run "make setup" in the root of this repo.'; exit 1; }
	@pip3 show PyYAML >/dev/null || { echo 'PyYAML for python3 must be installed. Run "make setup" in the root of this repo.'; exit 1; }

terraform-version-check:
	@tfenv install
# ordered list of dependencies to check
## Check that the whole TF config is ready to go
check: terraform-version-check credentials-checks script-checks python3-checks enable-remote-state
