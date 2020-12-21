resource "aws_iam_user" "cicd" {
  name = "cicd"
}

resource "aws_iam_user_policy_attachment" "cicd" {
  user       = aws_iam_user.cicd.name
  policy_arn = aws_iam_policy.assumerole_cicd.arn
}
