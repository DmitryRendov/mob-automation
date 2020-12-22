resource "aws_iam_role" "super_user" {
  name               = "super-user"
  assume_role_policy = data.aws_iam_policy_document.bastion_assumerole_policy.json
  description        = "Grants AdministratorAccess to the user assuming the role"
}

resource "aws_iam_role_policy_attachment" "super_user" {
  role       = aws_iam_role.super_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
