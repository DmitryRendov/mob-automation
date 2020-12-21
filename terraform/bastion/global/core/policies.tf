resource "aws_iam_policy" "assumerole_data_restricted" {
  name        = "${var.environment}-assumerole-data-restricted"
  description = "Grants a user the ability to assume the super-user role and fetch session tokens for the alpha account only"
  policy      = data.aws_iam_policy_document.assumerole_data_restricted.json
}

data "aws_iam_policy_document" "assumerole_data_restricted" {
  statement {
    sid = "1"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::${var.aws_account_map["alpha"]}:role/super-user",
    ]

    condition {
      test     = "Null"
      variable = "aws:MultiFactorAuthAge"
      values   = ["false"]
    }

    condition {
      test     = "NumericLessThan"
      variable = "aws:MultiFactorAuthAge"
      values   = ["43200"]
    }
  }

  statement {
    sid = "2"

    actions = [
      "sts:GetSessionToken",
    ]

    resources = [
      "*",
    ]
  }
}

data "aws_iam_policy_document" "bastion_assumerole_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root"]
    }

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}

output "bastion_assumerole_policy_json" {
  value = data.aws_iam_policy_document.bastion_assumerole_policy.json
}

data "aws_iam_policy_document" "assumerole_all" {
  statement {
    sid = "1"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "*",
    ]

    condition {
      test     = "Null"
      variable = "aws:MultiFactorAuthAge"
      values   = ["false"]
    }

    condition {
      test     = "NumericLessThan"
      variable = "aws:MultiFactorAuthAge"
      values   = ["43200"]
    }
  }

  statement {
    sid = "2"

    actions = [
      "sts:GetSessionToken",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "assumerole_all" {
  name        = "${var.environment}-assumerole-all"
  description = "Grants a user the ability to assume all roles and fetch session tokens"
  policy      = data.aws_iam_policy_document.assumerole_all.json
}

## Note: This has been duplicated into terraform-modules/aws/user-roles
## This policy will need to remain until we can retire the groups we are
## currently using.  This will happen after we communicate to engineering
## the new method to access AWS
data "aws_iam_policy_document" "force_mfa" {
  statement {
    sid = "AllowAllUsersToListAccounts"

    actions = [
      "iam:GetAccountPasswordPolicy",
      "iam:GetAccountSummary",
      "iam:ListAccountAliases",
      "iam:ListUsers",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid = "AllowIndividualUserToSeeAndManageOnlyTheirOwnAccountInformation"

    actions = [
      "iam:ChangePassword",
      "iam:CreateAccessKey",
      "iam:CreateLoginProfile",
      "iam:DeleteAccessKey",
      "iam:DeleteLoginProfile",
      "iam:DeleteSSHPublicKey",
      "iam:DeleteSigningCertificate",
      "iam:GetAccessKeyLastUsed",
      "iam:GetLoginProfile",
      "iam:GetSSHPublicKey",
      "iam:ListAccessKeys",
      "iam:ListSSHPublicKeys",
      "iam:ListSigningCertificates",
      "iam:UpdateAccessKey",
      "iam:UpdateLoginProfile",
      "iam:UpdateSSHPublicKey",
      "iam:UpdateSigningCertificate",
      "iam:UploadSSHPublicKey",
      "iam:UploadSigningCertificate",
    ]

    resources = [
      "arn:aws:iam::${var.aws_account_id}:user/$${aws:username}",
    ]
  }

  statement {
    sid = "AllowIndividualUserToListOnlyTheirOwnMFA"

    actions = [
      "iam:ListVirtualMFADevices",
      "iam:ListMFADevices",
    ]

    resources = [
      "arn:aws:iam::${var.aws_account_id}:mfa/*",
      "arn:aws:iam::${var.aws_account_id}:user/$${aws:username}",
    ]
  }

  statement {
    sid    = "AllowIndividualUserToManageTheirOwnMFA"
    effect = "Allow"

    actions = [
      "iam:CreateVirtualMFADevice",
      "iam:DeleteVirtualMFADevice",
      "iam:EnableMFADevice",
      "iam:ResyncMFADevice",
    ]

    resources = [
      "arn:aws:iam::${var.aws_account_id}:mfa/$${aws:username}",
      "arn:aws:iam::${var.aws_account_id}:user/$${aws:username}",
    ]
  }

  statement {
    sid = "AllowIndividualUserToDeactivateOnlyTheirOwnMFAOnlyWhenUsingMFA"

    actions = [
      "iam:DeactivateMFADevice",
    ]

    resources = [
      "arn:aws:iam::${var.aws_account_id}:mfa/$${aws:username}",
      "arn:aws:iam::${var.aws_account_id}:user/$${aws:username}",
    ]

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }

  statement {
    sid    = "BlockMostAccessUnlessSignedInWithMFA"
    effect = "Deny"

    not_actions = [
      "iam:CreateVirtualMFADevice",
      "iam:DeleteVirtualMFADevice",
      "iam:EnableMFADevice",
      "iam:GetAccountSummary",
      "iam:ListAccessKeys",
      "iam:ListAccountAliases",
      "iam:ListMFADevices",
      "iam:ListSSHPublicKeys",
      "iam:ListServiceSpecificCredentials",
      "iam:ListUsers",
      "iam:ListVirtualMFADevices",
      "iam:ResyncMFADevice",
      "sts:GetSessionToken",
    ]

    resources = [
      "*",
    ]

    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["false"]
    }
  }
}

resource "aws_iam_policy" "force_mfa" {
  name        = "ForceMFA"
  description = "Forces a user to use a MFA for all actions except managing their own MFA"
  policy      = data.aws_iam_policy_document.force_mfa.json
}

data "aws_iam_policy_document" "cicd" {
  statement {
    sid = "1"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::*:role/cicd*",
    ]
  }

  statement {
    sid = "2"

    actions = [
      "sts:GetSessionToken",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "assumerole_cicd" {
  name        = "${var.environment}-assumerole-cicd"
  description = "Grants our CI/CD ability to assome role in our accounts"
  policy      = data.aws_iam_policy_document.cicd.json
}

data "aws_iam_policy_document" "assumerole_developers" {
  statement {
    sid = "1"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::${var.aws_account_map["alpha"]}:role/super-user",
      "arn:aws:iam::${var.aws_account_map["emerging_products_dev"]}:role/super-user",
      "arn:aws:iam::${var.aws_account_map["emerging_products_staging"]}:role/super-user",
      "arn:aws:iam::${var.aws_account_map["emerging_products_prod"]}:role/super-user",
      "arn:aws:iam::${var.aws_account_map["headspace_prod"]}:role/hs-emerging-products-terraform-state-editor",
    ]

    condition {
      test     = "Null"
      variable = "aws:MultiFactorAuthAge"
      values   = ["false"]
    }

    condition {
      test     = "NumericLessThan"
      variable = "aws:MultiFactorAuthAge"
      values   = ["43200"]
    }
  }

  statement {
    sid = "2"

    actions = [
      "sts:GetSessionToken",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "assumerole_developers" {
  name        = "${var.environment}-assumerole-developers"
  description = "Grants a user the ability to assume developers roles and fetch session tokens"
  policy      = data.aws_iam_policy_document.assumerole_developers.json
}

## Creating budgets and Cost & Usage reports is more a complicated matter
## In the future, we could allow people to create Usage Reports pre-or-postfixed with their name?
## Ref: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-permissions-ref.html
data "aws_iam_policy_document" "billing_read_only" {
  statement {
    actions = [
      "aws-portal:ViewBilling",
      "aws-portal:ViewUsage",
      "budgets:ViewBudget",
      "pricing:Get*",
      "pricing:Describe*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions   = ["aws-portal:ViewAccount"]
    resources = ["*"]
    effect    = "Deny"
  }
}

resource "aws_iam_policy" "billing_read_only" {
  name        = "${var.environment}-billing_read_only"
  description = "Allow read-only access to billing functions and cost reports"
  policy      = data.aws_iam_policy_document.billing_read_only.json
}

# Policy to allow assume role to content sync role
data "aws_iam_policy_document" "assumerole_sync" {
  statement {
    sid = "1"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::*:role/integration-sync-manual",
      "arn:aws:iam::*:role/staging-sync-manual",
      "arn:aws:iam::*:role/prod-sync-manual",
    ]

    condition {
      test     = "Null"
      variable = "aws:MultiFactorAuthAge"
      values   = ["false"]
    }

    condition {
      test     = "NumericLessThan"
      variable = "aws:MultiFactorAuthAge"
      values   = ["43200"]
    }
  }

  statement {
    sid = "2"

    actions = [
      "sts:GetSessionToken",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "assumerole_sync" {
  name        = "${var.environment}-assumerole-sync"
  description = "Grants a user the ability to assume the content sync roles and fetch session tokens"
  policy      = data.aws_iam_policy_document.assumerole_sync.json
}
