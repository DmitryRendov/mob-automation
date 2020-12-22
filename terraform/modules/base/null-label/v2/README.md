## Purpose
This module is used to enforce standard naming and tagging conventions on our AWS resources.  The current naming convention is ```<environment>-<role name>(-<attributes>)```.  Attributes can be added to differentiate different resources of the same type, for example if there are two DynamoDB tables in the same role an attribute of `user` could be added to one and `records` to the other.

It's recommended to use one terraform-null-label module for every unique resource of a given resource type. For example, if you have 10 instances, there should be 10 different labels. However, if you have multiple different kinds of resources (e.g. instances, security groups, file systems, and elastic ips), then they can all share the same label assuming they are logically related.

### Tags
These tags are created by default:

- Name: name of the resource
- role: the role it was created in (i.e. content, b2b, etc)
- environment: prod, staging, dev, etc
- terraform: indication the resource is managed with Terraform
- repo: the repo and filepath where the resource Terraform lives
- team: the team responsible for maintaining this resource

### Example Usage
> Multiple different kind of resources
```hcl
module "label" {
  source      = "../../../modules/base/null-label/v2"
  role_name   = "${local.role_name}"
  environment = "${local.env}"
}
```
> Multiple different resources of the SAME kind
```hcl
module "audio_label" {
  source      = "../../../modules/base/null-label/v2"
  role_name   = "${local.role_name}"
  environment = "${local.env}"
  attributes  = ["audio"]
}

module "video_label" {
  source      = "../../../modules/base/null-label/v2"
  role_name   = "${local.role_name}"
  environment = "${local.env}"
  attributes  = ["video"]
}
```

## History

### v2
- Add shortened id to output
- Add "team" and "delimiter" to output
- feat: upgrade modules to terraform 0.12 (OPS-3772)


<!-- BEGINNING OF TERRAFORM-DOCS HOOK -->

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| `attributes` |Additional attributes (e.g. `policy` or `role`) |list(string) | `[]` | no |
| `convert_case` |Convert fields to lower case | | `true` | no |
| `delimiter` |Delimiter to be used between `name`, `environment`, etc. |string | `-` | no |
| `enabled` |Set to false to prevent the module from creating any resources | | `true` | no |
| `environment` |Environment, e.g. 'prod', 'staging', 'dev', or 'test' | | `<nil>` | no |
| `role_name` |Solution name, e.g. 'app' or 'jenkins' | | `<nil>` | no |
| `tags` |Additional tags (e.g. `map('BusinessUnit`,`XYZ`) |map(string) | `map[]` | no |
| `team` |Team responsible for infrastructure | | `` | no |

## Outputs
| Name | Description |
|------|-------------|
| `attributes` | Normalized attributes |
| `delimiter` | Delimiter used for joining lists internally |
| `environment` | Normalized environment |
| `id` | Disambiguated ID |
| `id_brief` | Brief disambiguated ID, limited to 64 characters |
| `role_name` | Normalized role name |
| `s3_bucket_name` | Normalized S3 bucket names |
| `tags` | Normalized Tag map |
| `team` | Normalized team name |

Data Resources
--------------
* `data.aws_caller_identity.current`
* `data.external.git_root`
<!-- END OF TERRAFORM-DOCS HOOK -->
