locals {
  name  = "${trimspace(format("%s %s", title(var.name), title(var.environment)))}"
  email = "${var.email != "" ? var.email : format("drendov+%s%s@gmail.com", replace(lower(var.name), " ", "-"), length(var.environment) > 0 ? format("-%s", var.environment) : "")}"
}

resource "aws_organizations_account" "account" {
  name      = local.name
  email     = local.email
  role_name = "super-user"

  lifecycle {
    #prevent_destroy = true
    ignore_changes  = [role_name]
  }
}

output "account_id" {
  value = aws_organizations_account.account.id
}
