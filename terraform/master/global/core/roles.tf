resource "aws_iam_role" "super_user" {
  name               = "super-user"
  assume_role_policy = data.aws_iam_policy_document.bastion_assumerole_policy.json
  description        = "Grants AdministratorAccess to the user assuming the role"
}

resource "aws_iam_role_policy_attachment" "super_user" {
  role       = aws_iam_role.super_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "AWS"
      identifiers = [data.terraform_remote_state.ops_atlantis.outputs.atlantis_task_role_arn]
    }
  }
}

resource "aws_iam_role" "atlantis_worker" {
  name = "ops-atlantis-worker"

  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = module.label.tags
}

resource "aws_iam_role_policy_attachment" "admin_access" {
  role       = aws_iam_role.atlantis_worker.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
