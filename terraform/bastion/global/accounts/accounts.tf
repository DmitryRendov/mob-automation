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
  source = "./module"
  name   = "audit"
}

module "bastion" {
  source = "./module"
  name   = "bastion"
}

output "account_ids" {
  value = {
    "audit"   = module.audit.account_id
    "bastion" = module.bastion.account_id
  }
}
