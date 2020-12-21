locals {
  role_name = "core"
  team      = "ops"

  community_team_policies = {
    headspace_prod_policy_arns = [
      aws_iam_policy.mindful_moments_access.arn,
      aws_iam_policy.livestream_elemental_access.arn,
    ]
  }

  data_analyst_policies = {
    headspace_prod_policy_arns = [
      "arn:aws:iam::aws:policy/AWSSupportAccess",
      "arn:aws:iam::aws:policy/ReadOnlyAccess",
      aws_iam_policy.deny_s3_archives.arn,
      aws_iam_policy.master_data_analyst.arn,
      "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess",
      "arn:aws:iam::aws:policy/AWSGlueConsoleSageMakerNotebookFullAccess",
      data.terraform_remote_state.etl_datascience.outputs.datascience_s3_bucket_policy_arn,
    ]
  }

  data_team_policies = {
    headspace_prod_policy_arns = [
      "arn:aws:iam::aws:policy/AmazonAthenaFullAccess",
      "arn:aws:iam::aws:policy/AmazonKinesisFirehoseFullAccess",
      "arn:aws:iam::aws:policy/AmazonRedshiftReadOnlyAccess",
      "arn:aws:iam::aws:policy/AWSCodeDeployReadOnlyAccess",
      "arn:aws:iam::aws:policy/AWSDataPipeline_FullAccess",
      "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess",
      "arn:aws:iam::aws:policy/AWSSupportAccess",
      "arn:aws:iam::aws:policy/ReadOnlyAccess",
      aws_iam_policy.master_data_analyst.arn,
      aws_iam_policy.data_team_extra.arn,
    ]
    data_prod_policy_arns = [
      "arn:aws:iam::aws:policy/ReadOnlyAccess",
      data.terraform_remote_state.prod_data_analytics.outputs.iam_passrole_policy_arn,
    ]
    data_dev_policy_arns = [
      "arn:aws:iam::aws:policy/ReadOnlyAccess",
      data.terraform_remote_state.dev_data_analytics.outputs.iam_passrole_policy_arn,
    ]
  }

  developer_policies = {
    headspace_prod_policy_arns = [
      "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
      "arn:aws:iam::aws:policy/AWSSupportAccess",
      "arn:aws:iam::aws:policy/ReadOnlyAccess",
      aws_iam_policy.deny_s3_archives.arn,
      aws_iam_policy.developer_permissions.arn,
      aws_iam_policy.restrict_destructive_actions.arn,
    ]
    headspace_ecs_admin_arns = [aws_iam_policy.ecs_admin.arn]
  }

  security_team_policies = {
    headspace_prod_policy_arns = [
      "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
      "arn:aws:iam::aws:policy/AWSSupportAccess",
      "arn:aws:iam::aws:policy/ReadOnlyAccess",
      aws_iam_policy.deny_s3_archives.arn,
    ]
  }
}
