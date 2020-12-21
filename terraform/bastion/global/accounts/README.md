### Information
**ROLE MUST BE RUN USING TERRAFORM EXEC ROLE SUPER USER**

Changing Account Name or Email via Terraform requires the account be deleted and recreated,
**DO NOT DO THIS**.

Make changes in Terraform and then login to the account with root credentials and change
the settings to match the desired state.

Running this if there are changes you that cause a repo to be deleted and recreated the plan will fail. To execute
the plan delete the prevent_destroy lifecycle rule in the module.


### TODO

* Move all accounts to have environments
* Update all email addresses to follow same form

<!-- BEGINNING OF TERRAFORM-DOCS HOOK -->

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|

## Outputs
| Name | Description |
|------|-------------|
| `account_ids` |  |

Child Modules
-------------
* `alpha` from `./module`
* `audit` from `./module`
* `bastion` from `./module`
* `cloudfront_signing` from `./module`
* `data_dev` from `./module`
* `data_prod` from `./module`
* `databricks_prod` from `./module`
* `databricks_staging` from `./module`
* `ep_integration` from `./module`
* `ep_prod` from `./module`
* `ep_staging` from `./module`
* `headspace_integration` from `./module`
* `headspace_prod` from `./module`
* `headspace_skills` from `./module`
* `headspace_staging` from `./module`
* `it` from `./module`
* `logging` from `./module`
* `ops` from `./module`
<!-- END OF TERRAFORM-DOCS HOOK -->
