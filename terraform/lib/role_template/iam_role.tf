module "my_iam_role" {
  source      = "../../../modules/site/iam-instance-profile/v6"
  role_name   = local.role_name
  environment = terraform.workspace
}
