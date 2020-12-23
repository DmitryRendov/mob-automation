locals {
  role_name = "core"
  team      = "ops"

  email   = join("@", ["drendov", "gmail.com"])
  budgets = [
    {
      name = "audit"
      account = var.aws_account_map["audit"]
      limit = 5
    },
    {
      name = "bastion"
      account = var.aws_account_map["bastion"]
      limit = 5
    },
    {
      name = "staging"
      account = var.aws_account_map["staging"]
      limit = 5
    },
    {
      name = "production"
      account = var.aws_account_map["production"]
      limit = 5
    }
  ]

}
