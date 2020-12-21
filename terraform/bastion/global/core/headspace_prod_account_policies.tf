module "data_terraform_policies" {
  source       = "../../../modules/site/tf-state-policy/v2"
  account_name = "data"

  providers = {
    aws = aws.headspace_prod
  }
}

resource "aws_iam_policy" "master_data_analyst" {
  name        = "master_data_analyst"
  description = "Policy for data_analysts in master account"
  provider    = aws.headspace_prod

  policy = data.aws_iam_policy_document.data_analyst.json
}

data "aws_iam_policy_document" "data_analyst" {
  statement {
    actions = [
      "s3:ListBucket",
      "s3:ListAllMyBuckets",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]

    effect = "Allow"
  }

  statement {
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject",
      "s3:PutObjectACL",
      "s3:PutObjectTagging",
      "s3:GetObjectACL",
      "s3:GetObjectTagging",
    ]

    resources = [
      "arn:aws:s3:::hs-data-archive",
      "arn:aws:s3:::hs-data-archive/*",
      "arn:aws:s3:::hs-dev-etl",
      "arn:aws:s3:::hs-dev-etl/*",
      "arn:aws:s3:::hs-internal",
      "arn:aws:s3:::hs-internal/*",
      "arn:aws:s3:::hs-hft-google",
      "arn:aws:s3:::hs-hft-google/*",
      "arn:aws:s3:::hs-prod-data-exchange",
      "arn:aws:s3:::hs-prod-data-exchange/*",
      "arn:aws:s3:::hs-prod-snowplow",
      "arn:aws:s3:::hs-prod-snowplow/*",
      "arn:aws:s3:::hs-external",
      "arn:aws:s3:::hs-external/*",
      "arn:aws:s3:::hs-etl-algolift",
      "arn:aws:s3:::hs-etl-algolift/*",
      "arn:aws:s3:::hs-etl-athena",
      "arn:aws:s3:::hs-etl-athena/*",
      "arn:aws:s3:::dev-analytics-pipeline-raw",
      "arn:aws:s3:::dev-analytics-pipeline-raw/*",
      "arn:aws:s3:::prod-analytics-pipeline-raw",
      "arn:aws:s3:::prod-analytics-pipeline-raw/*",
    ]

    effect = "Allow"
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::hs-terraform-state/",
      "arn:aws:s3:::hs-terraform-state/*",
    ]
  }
}

data "aws_iam_policy_document" "data_team_extra" {
  statement {
    effect = "Allow"

    actions = [
      "cloudwatch:Get*",
      "cloudwatch:List*",
      "ec2:CreateNetworkInterface",
      "ec2:DeleteNetworkInterface",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeInternetGateways",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeVpcs",
      "ec2:ModifyNetworkInterfaceAttribute",
      "iam:AttachRolePolicy",
      "iam:CreateRole",
      "iam:GetRole",
      "iam:PassRole",
      "kms:DescribeKey",
      "kms:ListAliases",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:FilterLogEvents",
      "logs:GetLogEvents",
      "redshift:Describe*",
      "redshift:ModifyClusterIamRoles",
      "redshift:RebootCluster",
      "redshift:RestoreTableFromClusterSnapshot",
    ]

    resources = [
      "*",
    ]
  }

  # Note: had to put this here to limit the number of policies on data team to 10
  statement {
    effect = "Deny"

    actions = [
      "s3:GetObject*",
    ]

    resources = [
      "arn:aws:s3:::headspace-archives/*",
    ]
  }
}

resource "aws_iam_policy" "data_team_extra" {
  provider = aws.headspace_prod
  name     = "data-team-extra"
  policy   = data.aws_iam_policy_document.data_team_extra.json
}

data "aws_iam_policy_document" "deny_s3_archives" {
  statement {
    effect = "Deny"

    actions = [
      "s3:GetObject*",
    ]

    resources = [
      "arn:aws:s3:::headspace-archives/*",
    ]
  }
}

resource "aws_iam_policy" "deny_s3_archives" {
  provider = aws.headspace_prod
  name     = "deny_s3_archives"
  policy   = data.aws_iam_policy_document.deny_s3_archives.json
}

# This can be deleted once we move resources to the staging and ops account
data "aws_iam_policy_document" "developer_permissions" {
  statement {
    effect = "Allow"

    actions = [
      "lambda:InvokeFunction",
    ]

    not_resources = [
      "arn:aws:lambda:*:*:function:prod*",
      "arn:aws:lambda:*:*:function:ops*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${data.terraform_remote_state.staging_jumpbox.outputs.bucket_name}/public-keys/*.pub",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${data.terraform_remote_state.prod_content.outputs.s3_content_bucket_name}/private/encoded/hls/",
      "arn:aws:s3:::${data.terraform_remote_state.prod_content.outputs.s3_content_bucket_name}/private/encoded/hls/*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::hs-terraform-state/",
      "arn:aws:s3:::hs-terraform-state/*",
    ]
  }

  statement {
    effect = "Allow"

    actions = ["ssm:StartSession"]

    resources = ["arn:aws:ec2:*:*:instance/*"]

    condition {
      test     = "StringLike"
      variable = "ssm:resourceTag/environment"
      values   = ["staging"]
    }
  }

  statement {
    effect = "Allow"

    actions = [
      "dynamodb:Scan",
      "dynamodb:Query",
      "dynamodb:GetItem",
    ]

    resources = [data.terraform_remote_state.credstash.outputs.table_arn]
  }

  statement {
    effect = "Allow"

    actions = [
      "kms:Decrypt",
    ]

    resources = [data.terraform_remote_state.credstash.outputs.kms_key_arn]

    condition {
      test     = "StringEquals"
      variable = "kms:EncryptionContext:user"
      values   = ["$${aws:PrincipalTag/credstash_user_context}"]
    }
  }

  statement {
    actions   = ["ssm:*"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "ssm:ResourceTag/team"
      values   = ["$${aws:PrincipalTag/team}"]
    }

    effect = "Allow"
  }

  statement {
    actions   = ["ssm:*"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "ssm:ResourceTag/username"
      values   = ["$${aws:PrincipalTag/username}"]
    }

    effect = "Allow"
  }

  statement {
    effect = "Allow"

    actions = [
      "sqs:SendMessage",
      "sqs:SendMessageBatch",
      "sqs:PurgeQueue",
    ]

    not_resources = [
      "arn:aws:sqs:*:*:prod*",
      "arn:aws:sqs:*:*:ops*",
    ]
  }

  statement {
    actions = [
      "mediaconvert:Describe*",
      "mediaconvert:Get*",
      "mediaconvert:List*",
      "medialive:Describe*",
      "medialive:List*",
      "mediapackage:Describe*",
      "mediapackage:List*",
    ]

    resources = [
      "*",
    ]

    effect = "Allow"
  }
}

resource "aws_iam_policy" "developer_permissions" {
  provider = aws.headspace_prod
  name     = "master_developer_permissions"
  policy   = data.aws_iam_policy_document.developer_permissions.json
}

data "aws_iam_policy_document" "ep_terraform_state_write_access" {
  provider = aws.headspace_prod

  statement {
    effect = "Allow"

    actions = [
      "s3:List*",
      "s3:Get*",
    ]

    resources = [
      "arn:aws:s3:::hs-emerging-products-terraform-state",
      "arn:aws:s3:::hs-emerging-products-terraform-state/*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:Put*",
    ]

    resources = [
      "arn:aws:s3:::hs-emerging-products-terraform-state",
      "arn:aws:s3:::hs-emerging-products-terraform-state/*",
    ]
  }
}

resource "aws_iam_policy" "ep_terraform_state_write_access" {
  provider    = aws.headspace_prod
  name        = "ep-terraform-write-state-access"
  description = "Write access to ep terraform state"
  policy      = data.aws_iam_policy_document.ep_terraform_state_write_access.json
}

data "aws_iam_policy_document" "restrict_destructive_actions" {
  provider = aws.headspace_prod

  statement {
    effect = "Deny"

    actions = [
      "ecs:DeleteCluster",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "restrict_destructive_actions" {
  provider = aws.headspace_prod
  policy   = data.aws_iam_policy_document.restrict_destructive_actions.json
  name     = "${var.environment}-restrict-destructive-actions"
}

data "aws_iam_policy_document" "ecs_admins" {
  statement {
    actions = [
      "ecs:*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions   = ["ecs:DeleteCluster"]
    resources = ["*"]
    effect    = "Deny"
  }

  statement {
    actions   = ["application-autoscaling:*"]
    resources = ["*"]
    effect    = "Allow"
  }
}

resource "aws_iam_policy" "ecs_admin" {
  name        = "ecs_admin"
  description = "Allow ECS administrative tasks"
  policy      = data.aws_iam_policy_document.ecs_admins.json
  provider    = aws.headspace_prod
}

resource "aws_iam_policy" "mindful_moments_access" {
  name        = "MindfulMomentsS3BucketStaticAsssetAccess"
  provider    = aws.headspace_prod
  description = "Allow community team to manage mindful moment static image assets"
  policy      = data.aws_iam_policy_document.mindful_moments_access.json
}

data "aws_iam_policy_document" "mindful_moments_access" {
  provider = aws.headspace_prod

  statement {
    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:PutObject",
      "s3:Delete*",
    ]

    resources = [
      data.terraform_remote_state.prod_mindful_moments.outputs.mindful_moments_static_asset_bucket_arn,
      "${data.terraform_remote_state.prod_mindful_moments.outputs.mindful_moments_static_asset_bucket_arn}/*",
      data.terraform_remote_state.staging_mindful_moments.outputs.mindful_moments_static_asset_bucket_arn,
      "${data.terraform_remote_state.staging_mindful_moments.outputs.mindful_moments_static_asset_bucket_arn}/*",
    ]
  }
}

data "aws_iam_policy_document" "livestream_elemental_access" {
  provider = aws.headspace_prod
  statement {
    sid    = "Elemental"
    effect = "Allow"
    actions = [
      "medialive:*",
      "mediapackage:*",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "LivestreamCloudfront"
    effect = "Allow"
    actions = [
      "cloudfront:GetDistributionConfig",
      "cloudfront:UpdateDistribution",
    ]
    resources = [
      data.terraform_remote_state.prod_livestream.outputs.cloudfront_distribution_arn,
      data.terraform_remote_state.staging_livestream.outputs.cloudfront_distribution_arn,
    ]
  }
}

resource "aws_iam_policy" "livestream_elemental_access" {
  name        = "LivestreamElementalAccess"
  provider    = aws.headspace_prod
  description = "Allow the community team to manage livestream Elemental assets"
  policy      = data.aws_iam_policy_document.livestream_elemental_access.json
}
