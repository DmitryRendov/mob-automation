module "my_iam_role" {
  source      = "../../../modules/site/iam-instance-profile/v1"
  role_name   = local.role_name
  environment = terraform.workspace
}
