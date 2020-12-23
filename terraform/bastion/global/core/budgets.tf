resource "aws_budgets_budget" "budget" {
  count             = length(local.budgets)
  name              = "${module.budget_label.id}-${lookup(local.budgets[count.index], "name")}"
  budget_type       = "COST"
  limit_amount      = lookup(local.budgets[count.index], "limit")
  limit_unit        = "USD"
  time_unit         = "MONTHLY"

  time_period_start = "${substr(timestamp(), 0, 8)}01_00:00"

  cost_filters = {
    LinkedAccount = lookup(local.budgets[count.index], "account")
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = [local.email]
  }

  lifecycle {
    ignore_changes = [time_period_start]
  }
}
