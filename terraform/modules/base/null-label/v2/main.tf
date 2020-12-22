data "aws_caller_identity" "current" {
}

locals {
  enabled      = var.enabled ? true : false
  convert_case = var.convert_case ? true : false

  id          = local.enabled == true ? local.transformed_tags : ""
  role_name   = local.enabled == true ? local.convert_case == true ? lower(format("%v", var.role_name)) : format("%v", var.role_name) : ""
  environment = local.enabled == true ? local.convert_case == true ? lower(format("%v", var.environment)) : format("%v", var.environment) : ""
  repo        = "${data.external.git_root.result.repo}${replace(path.cwd, data.external.git_root.result.root, "")}"
  team        = local.enabled == true ? local.convert_case == true ? lower(format("%v", var.team)) : format("%v", var.team) : ""
  attributes  = local.enabled == true ? local.convert_case == true ? lower(format("%v", join(var.delimiter, compact(var.attributes)))) : format("%v", join(var.delimiter, compact(var.attributes))) : ""

  original_tags = join(
    var.delimiter,
    compact(concat([var.environment, var.role_name], var.attributes)),
  )
  transformed_tags = local.convert_case == true ? lower(local.original_tags) : local.original_tags

  # Shortened version of the Disambiguated ID
  role_name_brief   = substr(var.role_name, 0, min(length(var.role_name), 15))
  environment_brief = substr(var.environment, 0, min(length(var.environment), 4))
  original_tags_brief = join(
    var.delimiter,
    compact(concat([local.environment_brief, local.role_name_brief], var.attributes)),
  )
  transformed_tags_brief = local.convert_case == true ? lower(local.original_tags_brief) : local.original_tags_brief
  # e.g AWS IAM Role and Lambda function names are limited to 64 characters
  # In case if the ID is more than 64 - we trim role_name, env and even add a hash if needed to keep the name unique.
  id_brief = local.enabled == true ? length(local.transformed_tags_brief) > 64 ? "${substr(local.transformed_tags_brief, 0, min(length(local.transformed_tags_brief), 57))}-${substr(sha512(local.transformed_tags), 0, 5)}" : local.transformed_tags_brief : ""

  # To standardize our S3 bucket naming conventions
  s3_bucket_name = replace(
    format(
      "hs-%s-%s",
      local.id,
      substr(sha512(data.aws_caller_identity.current.account_id), 0, 12),
    ),
    "_",
    "-",
  )

  # Merge input tags with our tags.
  # Note: `Name` has a special meaning in AWS and we need to disambiguate it by using the computed `id`
  tags = merge(
    {
      "Name"        = local.id
      "role"        = local.role_name
      "environment" = local.environment
      "repo"        = local.repo
      "team"        = local.team
      "terraform"   = "Managed by Terraform"
    },
    var.tags,
  )
}

data "external" "git_root" {
  program = ["bash", "-c", "jq -n --arg root \"$(git rev-parse --show-toplevel)\" --arg repo \"$(basename $(git remote get-url origin) .git)\" '{\"root\":$root, \"repo\":$repo}'"]
}
