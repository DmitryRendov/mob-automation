resource "aws_iam_group" "headspace_user" {
  name = "headspace_user"
}

resource "aws_iam_group_policy_attachment" "headspace_user_force_mfa" {
  group      = aws_iam_group.headspace_user.name
  policy_arn = aws_iam_policy.force_mfa.arn
}

resource "aws_iam_group" "data_restricted" {
  name = "data-restricted"
}

resource "aws_iam_group_membership" "data_restricted" {
  name = "data-restricted-group-membership"

  users = [
    module.aleksei_lesnov.name,
    module.sergey_kalashnikov.name,
    module.anna_molchanova.name,
    module.alexander_gorokhov.name,
  ]

  group = aws_iam_group.data_restricted.name
}

resource "aws_iam_group_policy_attachment" "data_restricted_assumerole_data_restricted" {
  group      = aws_iam_group.data_restricted.name
  policy_arn = aws_iam_policy.assumerole_data_restricted.arn
}

resource "aws_iam_group" "ops" {
  name = "ops"
}

resource "aws_iam_group_membership" "ops" {
  name = "ops-group-membership"

  users = [
    module.gabe_levasseur.name,
    module.jason_savoie.name,
    module.michael_hsu.name,
    module.sharif_nassar.name,
  ]

  group = aws_iam_group.ops.name
}

resource "aws_iam_group_policy_attachment" "ops_assumerole_all" {
  group      = aws_iam_group.ops.name
  policy_arn = aws_iam_policy.assumerole_all.arn
}

resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_group_membership" "developers" {
  name = "developers-group-membership"

  users = [
    module.alex_linares.name,
    module.alex_wells.name,
    module.allen_tong.name,
    module.bose_athota.name,
    module.christian_soulages.name,
    module.daniel_song.name,
    module.david_laroue.name,
    module.eddie_park.name,
    module.florent_bachelier.name,
    module.george_torres.name,
    module.jeannie_nguyen.name,
    module.joseph_i.name,
    module.kevin_fang.name,
    module.kunal_parakh.name,
    module.lee_richardson.name,
    module.lucas_hawes.name,
    module.michael_wrather.name,
    module.ruvan_jayasinghe.name,
    module.sebastian_nystorm.name,
    module.sherwin_mina.name,
    module.trevor_peace.name,
    module.vincent_oe.name,
  ]

  group = aws_iam_group.developers.name
}

resource "aws_iam_group_policy_attachment" "developers_assumerole_developers" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.assumerole_developers.arn
}
