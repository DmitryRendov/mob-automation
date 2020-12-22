<!-- BEGINNING OF TERRAFORM-DOCS HOOK -->

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| `email` |Primary contact email address for an account | | `` | no |
| `environment` |Optional, name of environment | | `` | no |
| `name` |Name of AWS Account | | `` | yes |

## Outputs
| Name | Description |
|------|-------------|
| `account_id` |  |

Managed Resources
-----------------
* `aws_organizations_account.account`
<!-- END OF TERRAFORM-DOCS HOOK -->
