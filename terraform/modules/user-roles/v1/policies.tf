data "aws_caller_identity" "current" {
}

data "aws_iam_policy_document" "assumerole_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

#    condition {
#      test     = "Bool"
#      variable = "aws:MultiFactorAuthPresent"
#      values   = ["true"]
#    }
  }
}

data "aws_iam_policy_document" "assumerole_all" {
  statement {
    sid = "1"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::*:role/${var.name}",
    ]

#    condition {
#      test     = "Null"
#      variable = "aws:MultiFactorAuthAge"
#      values   = ["false"]
#    }

#    condition {
#      test     = "NumericLessThan"
#      variable = "aws:MultiFactorAuthAge"
#      values   = ["43200"]
#    }
  }
}

