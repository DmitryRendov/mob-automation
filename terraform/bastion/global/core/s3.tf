module "billingreports" {
  source      = "../../../modules/site/s3-bucket/v3"
  environment = terraform.workspace
  role_name   = local.role_name
  team        = local.team
  attributes  = ["billingreports"]
}

resource "aws_s3_bucket_policy" "billingreports" {
  bucket     = module.billingreports.s3_aws_bucket_name
  policy     = data.aws_iam_policy_document.billingreports.json
  depends_on = [module.billingreports]
}

data "aws_iam_policy_document" "billingreports" {
  policy_id = "Policy1335892530063"
  version   = "2008-10-17"

  statement {
    sid       = "Stmt1335892150622"
    effect    = "Allow"
    resources = [module.billingreports.s3_aws_bucket_arn]

    actions = [
      "s3:GetBucketPolicy",
      "s3:GetBucketAcl",
    ]

    principals {
      type        = "Service"
      identifiers = ["billingreports.amazonaws.com"]
    }
  }

  statement {
    sid       = "Stmt1335892526596"
    effect    = "Allow"
    resources = ["${module.billingreports.s3_aws_bucket_arn}/*"]
    actions   = ["s3:PutObject"]

    principals {
      type        = "Service"
      identifiers = ["billingreports.amazonaws.com"]
    }
  }
}
