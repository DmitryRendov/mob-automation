resource "aws_iam_role" "super_user" {
  name               = "super-user"
  assume_role_policy = data.terraform_remote_state.bastion_core.outputs.bastion_assumerole_policy_json
  description        = "Grants AdministratorAccess to the user assuming the role"
  tags               = module.label.tags
}

resource "aws_iam_role_policy_attachment" "super_user" {
  role       = aws_iam_role.super_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
