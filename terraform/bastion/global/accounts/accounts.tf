#module "alpha" {
#  source = "./module"
#  name   = "alpha"
#}

#module "audit" {
#  source = "./module"
#  name   = "audit"
#}

module "bastion" {
  source = "./module"
  name   = "bastion"
}

output "account_ids" {
  value = {
#    "alpha"   = module.alpha.account_id
#    "audit"   = module.audit.account_id
    "bastion" = module.bastion.account_id
  }
}
