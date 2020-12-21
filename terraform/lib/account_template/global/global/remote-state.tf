data "terraform_remote_state" "audit" {
  backend = "s3"

  config {
    key          = "audit/global/global"
    bucket       = var.tf_remote_state_s3_storage_bucket
    region       = var.tf_remote_state_s3_storage_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}
