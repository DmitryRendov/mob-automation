export TF_VAR_VAULT_NAME ?= Headspace DevOps
OP_FIRSTTIME_LOGIN_COMMAND=op signin team-headspace.1password.com
OP_LOGIN_COMMAND=op signin team_headspace

guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Environment variable $* not set"; \
		exit 1; \
	fi

is_op_configured:
	@if ! jq -e 'select(.accounts[].shorthand == "team_headspace")' ~/.op/config &> /dev/null; then \
		$(MAKE) guard-EMAIL; \
		$(OP_FIRSTTIME_LOGIN_COMMAND) $(EMAIL) >/dev/null; \
	fi

check: ensure_1pass_login ;

ensure_lastpass_login:
	@[[ -n $${LASTPASS_LOGIN} ]] || { echo \$$LASTPASS_LOGIN must be set; exit 1; }
	@lpass status 2>&1 > /dev/null || lpass login $${LASTPASS_LOGIN} ;

## Generate a SSH key to send to AWS as a EC2 keypair
ssh-keygen-%: ensure_1pass_login
	@OP_SESSION_team_headspace=$(OP_SESSION_team_headspace) lib/generate_ssh_key.sh "$(TF_VAR_VAULT_NAME)" $*
	@jq --arg pub "$$(cat $*.pub)" '.locals.keypair_content=$$pub' global-variables.tf.json > global-variables-new.tf.json
	@mv global-variables-new.tf.json global-variables.tf.json
	@mv $* ~/.ssh

## Fetch a private key from 1Pass and put in ~./ssh
fetch-ssh-key-from-1pass-%: ensure_1pass_login
	@cp ~/.ssh/hs_ops_latest.pem ~/.ssh/hs_ops_old.pem || true
	@cp ~/.ssh/hs_ops_latest.pem.pub ~/.ssh/hs_ops_old.pem.pub || true
	# Note: the - Private/Public Key postfix must match what's in generate_ssh_key.sh
	@op get document --session="$(OP_SESSION_team_headspace)" $(shell op list items --session="$(OP_SESSION_team_headspace)" --vault="$(TF_VAR_VAULT_NAME)" | jq -re '.[] | select(.overview.title == "$* - Private Key") | .uuid') > ~/.ssh/hs_ops_latest.pem
	# Note: any changes to the path hs_ops_latest.pem below should match the key path in hs-ansible-scripts/.ssh_config
	@chmod 0600 ~/.ssh/hs_ops_latest.pem
	@op get document --session="$(OP_SESSION_team_headspace)" $(shell op list items --session="$(OP_SESSION_team_headspace)" --vault="$(TF_VAR_VAULT_NAME)" | jq -re '.[] | select(.overview.title == "$* - Public Key") | .uuid') > ~/.ssh/hs_ops_latest.pem.pub
	@chmod 0600 ~/.ssh/hs_ops_latest.pem.pub

## Fetch a passphrase for a key from 1Pass and print
fetch-passphrase-for-ssh-key-from-1pass-%: ensure_1pass_login
	@op get item --session="$(OP_SESSION_team_headspace)" $(shell op list items --session="$(OP_SESSION_team_headspace)" --vault="$(TF_VAR_VAULT_NAME)" | jq -re '.[] | select(.overview.title == "$* - Password") | .uuid') | jq -er '.details.fields | .[0].value'

ensure_1pass_cli_installed:
	@command -v op > /dev/null || { echo Need to install 1password-cli to proceed; exit 1; }

ensure_1pass_login: ensure_1pass_cli_installed is_op_configured
	@$(eval export OP_SESSION_team_headspace=$(shell $(OP_LOGIN_COMMAND) --output=raw))

1pass_test: ensure_1pass_login
	@OP_SESSION_team_headspace=$(OP_SESSION_team_headspace) op list vaults |jq -r .[].name
