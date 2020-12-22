## User role

This module is used to create user roles across our various AWS accounts.
For each account, must pass in a list of policy ARNs to attach to the user role in that account.
Additionally, a list of teams can be provided, and access to various resources in each account may be gated by matching team parameters. For example, decoding of SSM Parameter Store secrets requires a matching `team` tag between the Parameter and the role attempting to decode it.

### v1

Initial role


<!-- BEGINNING OF TERRAFORM-DOCS HOOK -->

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| `alpha_policy_arns` |List of policy arns to attach to the user for the Alpha Account. Default: AdministratorAccess |set(string) | `[arn:aws:iam::aws:policy/AdministratorAccess]` | no |
| `audit_policy_arns` |List of policy arns to attach to the user for the Audit Account. |set(string) | `[]` | no |
| `bastion_policy_arns` |List of policy arns to attach to the user for the Bastion Account. |set(string) | `[]` | no |
| `data_dev_policy_arns` |List of policy arns to attach to the user for the Dev Data Account. |set(string) | `[]` | no |
| `data_prod_policy_arns` |List of policy arns to attach to the user for the Prod Data Account. |set(string) | `[]` | no |
| `databricks_prod_policy_arns` |List of policy arns to attach to the user for the Prod Databricks Account. |set(string) | `[]` | no |
| `databricks_staging_policy_arns` |List of policy arns to attach to the user for the Staging Databricks Account. |set(string) | `[]` | no |
| `headspace_prod_policy_arns` |List of policy arns to attach to the user for the Master Account.  Default: ReadOnlyAccess |set(string) | `[arn:aws:iam::aws:policy/ReadOnlyAccess]` | no |
| `headspace_skill_policy_arns` |List of policy arns to attach to the user for the Headspace Skill Account. |set(string) | `[]` | no |
| `integration_policy_arns` |List of policy arns to attach to the user for the Headspace Integration Account. |set(string) | `[arn:aws:iam::aws:policy/AdministratorAccess]` | no |
| `it_policy_arns` |List of policy arns to attach to the user for the Corp IT Account. |set(string) | `[]` | no |
| `logging_policy_arns` |List of policy arns to attach to the user for the Logging Account. |set(string) | `[]` | no |
| `name` | | | `<nil>` | no |
| `ops_policy_arns` |List of policy arns to attach to the user for the Ops Account. |set(string) | `[]` | no |
| `staging_policy_arns` |List of policy arns to attach to the user for the Headspace Staging Account. |set(string) | `[arn:aws:iam::aws:policy/AdministratorAccess]` | no |
| `support_policy_arns` |List of policy arns to attach to the user for AWS Support access.  Default: AWSSupportAccess |set(string) | `[arn:aws:iam::aws:policy/AWSSupportAccess]` | no |
| `tags` | |map(string) | `map[]` | no |
| `teams` |List of teams to tag the user with |set(string) | `[]` | no |

## Outputs
| Name | Description |
|------|-------------|
| `name` |  |

Managed Resources
-----------------
* `aws_iam_policy.assumerole`
* `aws_iam_policy.data_dev_team_policy`
* `aws_iam_policy.data_prod_team_policy`
* `aws_iam_policy.databricks_prod_team_policy`
* `aws_iam_policy.databricks_staging_team_policy`
* `aws_iam_policy.ssm_team_parameters`
* `aws_iam_role.alpha_user_role`
* `aws_iam_role.audit_user_role`
* `aws_iam_role.data_dev_user_role`
* `aws_iam_role.data_prod_user_role`
* `aws_iam_role.databricks_prod_user_role`
* `aws_iam_role.databricks_staging_user_role`
* `aws_iam_role.headspace_prod_user_role`
* `aws_iam_role.headspace_skill_user_role`
* `aws_iam_role.integration_user_role`
* `aws_iam_role.it_user_role`
* `aws_iam_role.logging_user_role`
* `aws_iam_role.ops_user_role`
* `aws_iam_role.staging_user_role`
* `aws_iam_role_policy_attachment.alpha_user_policy`
* `aws_iam_role_policy_attachment.audit_user_policy`
* `aws_iam_role_policy_attachment.data_dev_user_policy`
* `aws_iam_role_policy_attachment.data_dev_user_team_policy`
* `aws_iam_role_policy_attachment.data_prod_user_policy`
* `aws_iam_role_policy_attachment.data_prod_user_team_policy`
* `aws_iam_role_policy_attachment.databricks_prod_user_policy`
* `aws_iam_role_policy_attachment.databricks_prod_user_team_policy`
* `aws_iam_role_policy_attachment.databricks_staging_user_policy`
* `aws_iam_role_policy_attachment.databricks_staging_user_team_policy`
* `aws_iam_role_policy_attachment.headspace_prod_user_policy`
* `aws_iam_role_policy_attachment.headspace_prod_user_team_policy`
* `aws_iam_role_policy_attachment.headspace_skill_user_policy`
* `aws_iam_role_policy_attachment.integration_user_policy`
* `aws_iam_role_policy_attachment.it_user_policy`
* `aws_iam_role_policy_attachment.logging_user_policy`
* `aws_iam_role_policy_attachment.ops_user_policy`
* `aws_iam_role_policy_attachment.staging_user_policy`
* `aws_iam_user.user`
* `aws_iam_user_group_membership.headspace_user`
* `aws_iam_user_policy_attachment.assumerole`
* `aws_iam_user_policy_attachment.bastion_user_policy`
* `aws_iam_user_policy_attachment.support_user_policy`

Data Resources
--------------
* `data.aws_caller_identity.current`
* `data.aws_iam_group.headspace_user`
* `data.aws_iam_policy_document.assumerole_all`
* `data.aws_iam_policy_document.assumerole_policy`
* `data.aws_iam_policy_document.ssm_team_parameters`
* `data.aws_iam_policy_document.team_policy_document`
<!-- END OF TERRAFORM-DOCS HOOK -->
