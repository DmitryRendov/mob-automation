module "alex_linares" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "alex.linares"
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
}

module "alex_wells" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "alex.wells"
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

module "allen_tong" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "allen.tong"
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

}

module "amber_muni" {
  source = "../../../modules/user-roles/v4"
  name   = "amber.muni"

  headspace_prod_policy_arns = local.data_analyst_policies["headspace_prod_policy_arns"]
  data_dev_policy_arns       = local.data_team_policies["data_dev_policy_arns"]
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

  teams = ["dataeng"]
}

module "annemarie_finn" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "anne-marie.finn"
  headspace_prod_policy_arns = local.data_analyst_policies["headspace_prod_policy_arns"]
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
}

module "bose_athota" {
  source = "../../../modules/user-roles/v4"
  name   = "bose.athota"

  bastion_policy_arns            = [aws_iam_policy.billing_read_only.arn]
  data_dev_policy_arns           = local.data_team_policies["data_dev_policy_arns"]
  data_prod_policy_arns          = local.data_team_policies["data_prod_policy_arns"]
  databricks_prod_policy_arns    = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  databricks_staging_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  headspace_prod_policy_arns     = local.data_team_policies["headspace_prod_policy_arns"]

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

  teams = ["dataeng"]
}

module "charles_kim" {
  source = "../../../modules/user-roles/v4"
  name   = "charles.kim"

  bastion_policy_arns            = [aws_iam_policy.billing_read_only.arn]
  data_dev_policy_arns           = local.data_team_policies["data_dev_policy_arns"]
  data_prod_policy_arns          = local.data_team_policies["data_prod_policy_arns"]
  databricks_prod_policy_arns    = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  databricks_staging_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  headspace_prod_policy_arns     = local.data_team_policies["headspace_prod_policy_arns"]

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

  teams = ["dataeng"]
}

module "christian_soulages" {
  source = "../../../modules/user-roles/v4"
  name   = "christian.soulages"

  headspace_prod_policy_arns     = local.developer_policies["headspace_prod_policy_arns"]
  bastion_policy_arns            = [aws_iam_policy.billing_read_only.arn]
  databricks_staging_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  databricks_prod_policy_arns    = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  logging_policy_arns            = ["arn:aws:iam::aws:policy/PowerUserAccess"]

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

module "courtney_osborne" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "courtney.osborne"
  headspace_prod_policy_arns = []
  alpha_policy_arns          = []
  integration_policy_arns    = []
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
}

module "daniel_song" {
  source = "../../../modules/user-roles/v4"
  name   = "daniel.song"

  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    local.community_team_policies["headspace_prod_policy_arns"],
  )

  bastion_policy_arns = [
    aws_iam_policy.billing_read_only.arn,
    aws_iam_policy.assumerole_sync.arn,
  ]

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

  teams = ["community"]
}

module "david_laroue" {
  source = "../../../modules/user-roles/v4"
  name   = "david.laroue"

  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    list("arn:aws:iam::aws:policy/AmazonECS_FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser")
  )

  logging_policy_arns                   = ["arn:aws:iam::aws:policy/PowerUserAccess"]
  bastion_policy_arns                   = [aws_iam_policy.billing_read_only.arn]
  emerging_products_dev_policy_arns     = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  emerging_products_prod_policy_arns    = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  emerging_products_staging_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]

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

module "eddie_park" {
  source = "../../../modules/user-roles/v4"
  name   = "eddie.park"

  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    local.developer_policies["headspace_ecs_admin_arns"],
  )

  bastion_policy_arns = [aws_iam_policy.billing_read_only.arn]
  logging_policy_arns = ["arn:aws:iam::aws:policy/PowerUserAccess"]

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

module "esfandiar_behrouz" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "esfandiar.behrouz"
  headspace_prod_policy_arns = local.security_team_policies["headspace_prod_policy_arns"]
  integration_policy_arns    = []
  alpha_policy_arns          = []
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
}

module "florent_bachelier" {
  source = "../../../modules/user-roles/v4"
  name   = "florent.bachelier"

  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    list("arn:aws:iam::aws:policy/AWSDataPipeline_FullAccess"),
  )

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

module "gabe_levasseur" {
  source = "../../../modules/user-roles/v4"
  name   = "gabe.levasseur"

  alpha_policy_arns                     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  audit_policy_arns                     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  bastion_policy_arns                   = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  cloudfront_signing_policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  data_prod_policy_arns                 = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  data_dev_policy_arns                  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  databricks_staging_policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  databricks_prod_policy_arns           = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_dev_policy_arns     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_staging_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_prod_policy_arns    = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  headspace_skill_policy_arns           = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  logging_policy_arns                   = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  headspace_prod_policy_arns            = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  ops_policy_arns                       = ["arn:aws:iam::aws:policy/AdministratorAccess"]

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

module "george_torres" {
  source = "../../../modules/user-roles/v4"
  name   = "george.torres"

  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    local.developer_policies["headspace_ecs_admin_arns"],
  )

  bastion_policy_arns = [aws_iam_policy.billing_read_only.arn]
  logging_policy_arns = ["arn:aws:iam::aws:policy/PowerUserAccess"]

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

module "jason_savoie" {
  source = "../../../modules/user-roles/v4"
  name   = "jason.savoie"

  alpha_policy_arns                     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  audit_policy_arns                     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  cloudfront_signing_policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  data_prod_policy_arns                 = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  data_dev_policy_arns                  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  databricks_staging_policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  databricks_prod_policy_arns           = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_dev_policy_arns     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_staging_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_prod_policy_arns    = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  headspace_skill_policy_arns           = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  logging_policy_arns                   = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  headspace_prod_policy_arns            = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  ops_policy_arns                       = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  bastion_policy_arns                   = [aws_iam_policy.billing_read_only.arn]

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

module "jeannie_nguyen" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "jeannie.nguyen"
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
}

module "jen_nguyen" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "jen.nguyen"
  headspace_prod_policy_arns = local.data_analyst_policies["headspace_prod_policy_arns"]
  data_dev_policy_arns       = local.data_team_policies["data_dev_policy_arns"]
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

  teams = ["data-science"]
}

module "joseph_i" {
  source = "../../../modules/user-roles/v4"
  name   = "joseph.i"

  bastion_policy_arns            = [aws_iam_policy.billing_read_only.arn]
  data_dev_policy_arns           = local.data_team_policies["data_dev_policy_arns"]
  data_prod_policy_arns          = local.data_team_policies["data_prod_policy_arns"]
  databricks_prod_policy_arns    = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  databricks_staging_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  headspace_prod_policy_arns = concat(
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

  teams = ["dataeng"]
}

module "julio_ceballos" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "julio.ceballos"
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
}

module "kevin_fang" {
  source = "../../../modules/user-roles/v4"
  name   = "kevin.fang"

  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    local.developer_policies["headspace_ecs_admin_arns"],
  )

  data_dev_policy_arns = local.data_team_policies["data_dev_policy_arns"]

  bastion_policy_arns = [aws_iam_policy.billing_read_only.arn]
  logging_policy_arns = ["arn:aws:iam::aws:policy/PowerUserAccess"]

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

module "kunal_parakh" {
  source = "../../../modules/user-roles/v4"
  name   = "kunal.parakh"

  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    local.developer_policies["headspace_ecs_admin_arns"],
  )

  bastion_policy_arns = [aws_iam_policy.billing_read_only.arn]
  logging_policy_arns = ["arn:aws:iam::aws:policy/PowerUserAccess"]

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

module "lee_richardson" {
  source = "../../../modules/user-roles/v4"
  name   = "lee.richardson"

  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    local.community_team_policies["headspace_prod_policy_arns"],
  )

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

  teams = ["health"]
}

module "lucas_hawes" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "lucas.hawes"
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
}

module "michael_hsu" {
  source = "../../../modules/user-roles/v4"
  name   = "michael.hsu"

  alpha_policy_arns                     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  audit_policy_arns                     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  bastion_policy_arns                   = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  cloudfront_signing_policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  data_prod_policy_arns                 = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  data_dev_policy_arns                  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  databricks_staging_policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  databricks_prod_policy_arns           = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_dev_policy_arns     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_staging_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_prod_policy_arns    = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  headspace_skill_policy_arns           = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  logging_policy_arns                   = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  headspace_prod_policy_arns            = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  ops_policy_arns                       = ["arn:aws:iam::aws:policy/AdministratorAccess"]

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

module "michael_wrather" {
  source = "../../../modules/user-roles/v4"
  name   = "michael.wrather"

  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    local.developer_policies["headspace_ecs_admin_arns"],
  )

  bastion_policy_arns = [
    aws_iam_policy.billing_read_only.arn,
    aws_iam_policy.assumerole_sync.arn,
  ]

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

module "paddy_hannon" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "paddy.hannon"
  bastion_policy_arns        = [aws_iam_policy.billing_read_only.arn]
  headspace_prod_policy_arns = local.security_team_policies["headspace_prod_policy_arns"]
  integration_policy_arns    = []

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


module "rachel_stevenson" {
  source = "../../../modules/user-roles/v4"
  name   = "rachel.stevenson"

  headspace_prod_policy_arns = local.data_analyst_policies["headspace_prod_policy_arns"]
  data_dev_policy_arns       = local.data_team_policies["data_dev_policy_arns"]
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

  teams = ["data-science"]
}

module "ruvan_jayasinghe" {
  source = "../../../modules/user-roles/v4"
  name   = "ruvan.jayasinghe"

  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    local.community_team_policies["headspace_prod_policy_arns"],
  )

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

  teams = ["community"]
}

module "sagar_bhuta" {
  source = "../../../modules/user-roles/v4"
  name   = "sagar.bhuta"

  bastion_policy_arns            = [aws_iam_policy.billing_read_only.arn]
  data_dev_policy_arns           = local.data_team_policies["data_dev_policy_arns"]
  data_prod_policy_arns          = local.data_team_policies["data_prod_policy_arns"]
  databricks_prod_policy_arns    = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  databricks_staging_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  headspace_prod_policy_arns     = local.data_team_policies["headspace_prod_policy_arns"]

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

  teams = ["dataeng"]
}

module "sarah_sultan" {
  source = "../../../modules/user-roles/v4"
  name   = "sarah.sultan"

  headspace_prod_policy_arns = local.data_analyst_policies["headspace_prod_policy_arns"]
  data_dev_policy_arns       = local.data_team_policies["data_dev_policy_arns"]
  data_prod_policy_arns      = local.data_team_policies["data_prod_policy_arns"]
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
}

module "sebastian_nystorm" {
  source = "../../../modules/user-roles/v4"
  name   = "sebastian.nystorm"

  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    local.community_team_policies["headspace_prod_policy_arns"],
  )

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

  teams = ["community"]
}

module "sharif_nassar" {
  source = "../../../modules/user-roles/v4"
  name   = "sharif.nassar"

  alpha_policy_arns                     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  audit_policy_arns                     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  bastion_policy_arns                   = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  cloudfront_signing_policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  databricks_staging_policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  databricks_prod_policy_arns           = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  data_prod_policy_arns                 = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  data_dev_policy_arns                  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_dev_policy_arns     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_staging_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  emerging_products_prod_policy_arns    = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  headspace_skill_policy_arns           = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  logging_policy_arns                   = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  headspace_prod_policy_arns            = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  ops_policy_arns                       = ["arn:aws:iam::aws:policy/AdministratorAccess"]

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

module "sherwin_mina" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "sherwin.mina"
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
}

module "sumit_dubey" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "sumit.dubey"
  headspace_prod_policy_arns = local.developer_policies["headspace_prod_policy_arns"]
  bastion_policy_arns        = [aws_iam_policy.billing_read_only.arn]
  logging_policy_arns        = ["arn:aws:iam::aws:policy/PowerUserAccess"]

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

module "trevor_peace" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "trevor.peace"
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

module "vincent_oe" {
  source = "../../../modules/user-roles/v4"
  name   = "vincent.oe"
  headspace_prod_policy_arns = concat(
    local.developer_policies["headspace_prod_policy_arns"],
    local.community_team_policies["headspace_prod_policy_arns"],
  )
  bastion_policy_arns = [aws_iam_policy.billing_read_only.arn]

  emerging_products_dev_policy_arns     = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  emerging_products_prod_policy_arns    = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  emerging_products_staging_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]

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

  teams = ["health"]
}

module "wally_perez" {
  source                         = "../../../modules/user-roles/v4"
  name                           = "wally.perez"
  bastion_policy_arns            = [aws_iam_policy.billing_read_only.arn]
  databricks_prod_policy_arns    = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  databricks_staging_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  headspace_prod_policy_arns     = local.data_team_policies["headspace_prod_policy_arns"]

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

  teams = ["dataeng"]
}

module "swapna_savant" {
  source                     = "../../../modules/user-roles/v4"
  name                       = "swapna.savant"
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
