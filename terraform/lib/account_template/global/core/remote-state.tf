data "terraform_remote_state" "bastion_core" {
  backend = "s3"

  config = {
    key          = "bastion/global/core"
    bucket       = var.terraform_remote_state_bucket
    region       = var.terraform_remote_state_region
    profile      = "sts"
    role_arn     = "arn:aws:iam::${var.aws_account_map["bastion"]}:role/${var.terraform_exec_role}"
    session_name = "terraform"
  }
}
