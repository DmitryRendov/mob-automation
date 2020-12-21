module "aleksei_lesnov" {
  source = "../../../modules/user-roles/v4"
  name   = "aleksei.lesnov"

  data_prod_policy_arns = [
    "arn:aws:iam::aws:policy/PowerUserAccess",
    "arn:aws:iam::aws:policy/IAMReadOnlyAccess",
    data.terraform_remote_state.prod_data_analytics.outputs.iam_passrole_policy_arn,
  ]

  data_dev_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
    data.terraform_remote_state.dev_data_analytics.outputs.iam_passrole_policy_arn,
  ]

  headspace_prod_policy_arns = concat(
    [module.data_terraform_policies.state_access_policy_arn],
    local.data_team_policies["headspace_prod_policy_arns"],
    local.developer_policies["headspace_prod_policy_arns"],
  )

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "anna_molchanova" {
  source = "../../../modules/user-roles/v4"
  name   = "anna.molchanova"

  data_prod_policy_arns = [
    "arn:aws:iam::aws:policy/PowerUserAccess",
    "arn:aws:iam::aws:policy/IAMReadOnlyAccess",
    data.terraform_remote_state.prod_data_analytics.outputs.iam_passrole_policy_arn,
  ]

  data_dev_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
    data.terraform_remote_state.dev_data_analytics.outputs.iam_passrole_policy_arn,
  ]

  headspace_prod_policy_arns = concat(
    list(module.data_terraform_policies.state_access_policy_arn),
    local.data_team_policies["headspace_prod_policy_arns"],
    local.developer_policies["headspace_prod_policy_arns"],
  )

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "alexander_gorokhov" {
  source = "../../../modules/user-roles/v4"
  name   = "alexander.gorokhov"

  data_prod_policy_arns = [
    "arn:aws:iam::aws:policy/PowerUserAccess",
    "arn:aws:iam::aws:policy/IAMReadOnlyAccess",
    data.terraform_remote_state.prod_data_analytics.outputs.iam_passrole_policy_arn,
  ]

  data_dev_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
    data.terraform_remote_state.dev_data_analytics.outputs.iam_passrole_policy_arn,
  ]

  headspace_prod_policy_arns = concat(
    list(module.data_terraform_policies.state_access_policy_arn),
    local.data_team_policies["headspace_prod_policy_arns"],
    local.developer_policies["headspace_prod_policy_arns"],
  )

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "aliaksei_bedonik" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "aliaksei.bedonik"
  headspace_prod_policy_arns = local.developer_policies["headspace_prod_policy_arns"]

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "artem_elyseev" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "artem.elyseev"
  headspace_prod_policy_arns = local.developer_policies["headspace_prod_policy_arns"]

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "denis_bozhik" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "denis.bozhik"
  headspace_prod_policy_arns = local.developer_policies["headspace_prod_policy_arns"]

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "dmitry_rendov" {
  source = "../../../modules/user-roles/v4"
  name   = "dmitry.rendov"

  data_prod_policy_arns = [
    "arn:aws:iam::aws:policy/PowerUserAccess",
    "arn:aws:iam::aws:policy/IAMReadOnlyAccess",
    data.terraform_remote_state.prod_data_analytics.outputs.iam_passrole_policy_arn,
  ]

  data_dev_policy_arns = [
    "arn:aws:iam::aws:policy/PowerUserAccess",
    data.terraform_remote_state.dev_data_analytics.outputs.iam_passrole_policy_arn,
  ]

  headspace_prod_policy_arns = concat(
    list(module.data_terraform_policies.state_access_policy_arn),
    local.data_team_policies["headspace_prod_policy_arns"],
    local.developer_policies["headspace_prod_policy_arns"],
  )
  logging_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "iryna_dastanka" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "iryna.dastanka"
  headspace_prod_policy_arns = local.developer_policies["headspace_prod_policy_arns"]

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "maksim_zaretski" {
  source = "../../../modules/user-roles/v4"
  name   = "maksim.zaretski"

  headspace_prod_policy_arns = local.developer_policies["headspace_prod_policy_arns"]

  bastion_policy_arns = [aws_iam_policy.billing_read_only.arn]

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "maryna_buryna" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "maryna.buryna"
  headspace_prod_policy_arns = local.developer_policies["headspace_prod_policy_arns"]

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "natallia_mikulskaya" {
  source = "../../../modules/user-roles/v4"
  name   = "natallia.mikulskaya"

  headspace_prod_policy_arns = local.developer_policies["headspace_prod_policy_arns"]

  bastion_policy_arns = [aws_iam_policy.billing_read_only.arn]

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "pavel_anosav" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "pavel.anosav"
  headspace_prod_policy_arns = local.developer_policies["headspace_prod_policy_arns"]

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "sergey_kalashnikov" {
  source = "../../../modules/user-roles/v4"
  name   = "sergey.kalashnikov"

  data_prod_policy_arns = [
    "arn:aws:iam::aws:policy/PowerUserAccess",
    "arn:aws:iam::aws:policy/IAMReadOnlyAccess",
    data.terraform_remote_state.prod_data_analytics.outputs.iam_passrole_policy_arn,
  ]

  data_dev_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
    data.terraform_remote_state.dev_data_analytics.outputs.iam_passrole_policy_arn,
  ]

  headspace_prod_policy_arns = concat(
    list(module.data_terraform_policies.state_access_policy_arn),
    local.data_team_policies["headspace_prod_policy_arns"],
    local.developer_policies["headspace_prod_policy_arns"],
  )

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }
}

module "victor_storozhenko" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "victor.storozhenko"
  headspace_prod_policy_arns = local.developer_policies["headspace_prod_policy_arns"]
  bastion_policy_arns        = [aws_iam_policy.billing_read_only.arn]

  providers = {
    aws.alpha                     = aws.alpha
    aws.audit                     = aws.audit
    aws.cloudfront_signing        = aws.cloudfront_signing
    aws.data_dev                  = aws.data_dev
    aws.data_prod                 = aws.data_prod
    aws.databricks_prod           = aws.databricks_prod
    aws.databricks_staging        = aws.databricks_staging
    aws.emerging_products_dev     = aws.emerging_products_dev
    aws.emerging_products_prod    = aws.emerging_products_prod
    aws.emerging_products_staging = aws.emerging_products_staging
    aws.headspace_integration     = aws.headspace_integration
    aws.headspace_prod            = aws.headspace_prod
    aws.headspace_skill           = aws.headspace_skill
    aws.it                        = aws.it
    aws.logging                   = aws.logging
    aws.ops                       = aws.ops
  }

  teams = ["b2b"]
}
