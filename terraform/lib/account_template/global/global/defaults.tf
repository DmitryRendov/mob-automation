module "hs_account_defaults" {
  source           = "../../../modules/base/account-defaults/v7"
  aws_account_id   = var.aws_account_id
  audit_account_id = var.aws_account_map.audit

  account_name              = var.account_name
  config_recorder_s3_bucket = data.terraform_remote_state.audit.aws_config_bucket_name
  cloudtrail_s3_bucket      = data.terraform_remote_state.audit.cloudtrail_bucket_name
}
