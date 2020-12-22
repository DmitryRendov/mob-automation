data "aws_iam_policy_document" "bastion_assumerole_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root"]
    }
  }
}

output "bastion_assumerole_policy_json" {
  value = data.aws_iam_policy_document.bastion_assumerole_policy.json
}
