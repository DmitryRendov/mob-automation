resource "aws_organizations_organization" "mob" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
  ]

  feature_set = "ALL"
}

output "org" {
  value = aws_organizations_organization.mob
}

module "audit" {
  source = "../../../modules/base/aws-organization-account/v1"
  name   = "audit"
}

module "bastion" {
  source = "../../../modules/base/aws-organization-account/v1"
  name   = "bastion"
  email  = "drendov@gmail.com"
}

module "production" {
  source = "../../../modules/base/aws-organization-account/v1"
  name   = "production"
}

module "staging" {
  source = "../../../modules/base/aws-organization-account/v1"
  name   = "staging"
}

output "account_ids" {
  value = {
    "audit"      = module.audit.account_id
    "bastion"    = module.bastion.account_id
    "production" = module.production.account_id
    "staging"    = module.staging.account_id
  }
}
