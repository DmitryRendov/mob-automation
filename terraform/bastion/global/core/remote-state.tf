data "terraform_remote_state" "audit" {
  backend = "s3"

  config = {
    key          = "audit/global/global"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "etl_datascience" {
  backend = "s3"

  config = {
    key          = "headspace/etl/datascience"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "staging_jumpbox" {
  backend   = "s3"
  workspace = "staging"

  config = {
    key          = "headspace/roles/jumpbox"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "dev_data_analytics" {
  backend   = "s3"
  workspace = "dev"

  config = {
    key          = "data/roles/analytics-pipeline"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "prod_data_analytics" {
  backend   = "s3"
  workspace = "prod"

  config = {
    key          = "data/roles/analytics-pipeline"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}

# TODO: update when staging is moved to separate account
data "terraform_remote_state" "credstash" {
  backend   = "s3"
  workspace = "prod"

  config = {
    key          = "headspace/credstash"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "prod_content" {
  backend   = "s3"
  workspace = "prod"

  config = {
    key          = "headspace/roles/content"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "ops_atlantis" {
  backend   = "s3"
  workspace = "prod"

  config = {
    key          = "ops/roles/atlantis"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "prod_mindful_moments" {
  backend   = "s3"
  workspace = "prod"

  config = {
    key          = "headspace/roles/mindful-moments"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "staging_mindful_moments" {
  backend   = "s3"
  workspace = "staging"

  config = {
    key          = "headspace/roles/mindful-moments"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_staging"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "staging_livestream" {
  backend   = "s3"
  workspace = "staging"

  config = {
    key          = "headspace/roles/livestream"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_staging"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "prod_livestream" {
  backend   = "s3"
  workspace = "prod"

  config = {
    key          = "headspace/roles/livestream"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}
