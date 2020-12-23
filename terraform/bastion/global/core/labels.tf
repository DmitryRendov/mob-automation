module "label" {
  source      = "../../../modules/base/null-label/v2"
  environment = terraform.workspace
  role_name   = local.role_name
  team        = local.team
}

module "budget_label" {
  source      = "../../../modules/base/null-label/v2"
  environment = terraform.workspace
  role_name   = local.role_name
  team        = local.team
  attributes  = ["budget"]
}

