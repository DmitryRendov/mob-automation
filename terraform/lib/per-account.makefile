include ../lib/common.makefile

## Create a new role from the environment_template
new-environment-%:
	@mkdir $*
	@rsync -a ../lib/environment_template/ $*
	@cd $* && jq --indent 2 --sort-keys <environment.tf.json.template ".variable.environment.default |= \"$*\"" > environment.tf.json
	@rm $*/environment.tf.json.template
