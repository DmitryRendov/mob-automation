<!-- BEGINNING OF TERRAFORM-DOCS HOOK -->

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|

## Outputs
| Name | Description |
|------|-------------|
| `bastion_assumerole_policy_json` |  |

Managed Resources
-----------------
* `aws_iam_group.data_restricted`
* `aws_iam_group.developers`
* `aws_iam_group.headspace_user`
* `aws_iam_group.ops`
* `aws_iam_group_membership.data_restricted`
* `aws_iam_group_membership.developers`
* `aws_iam_group_membership.ops`
* `aws_iam_group_policy_attachment.data_restricted_assumerole_data_restricted`
* `aws_iam_group_policy_attachment.developers_assumerole_developers`
* `aws_iam_group_policy_attachment.headspace_user_force_mfa`
* `aws_iam_group_policy_attachment.ops_assumerole_all`
* `aws_iam_policy.assumerole_all`
* `aws_iam_policy.assumerole_cicd`
* `aws_iam_policy.assumerole_data_restricted`
* `aws_iam_policy.assumerole_developers`
* `aws_iam_policy.assumerole_sync`
* `aws_iam_policy.billing_read_only`
* `aws_iam_policy.data_team_extra`
* `aws_iam_policy.deny_s3_archives`
* `aws_iam_policy.developer_permissions`
* `aws_iam_policy.ecs_admin`
* `aws_iam_policy.ep_terraform_state_write_access`
* `aws_iam_policy.force_mfa`
* `aws_iam_policy.livestream_elemental_access`
* `aws_iam_policy.master_data_analyst`
* `aws_iam_policy.mindful_moments_access`
* `aws_iam_policy.restrict_destructive_actions`
* `aws_iam_role.atlantis_worker`
* `aws_iam_role.super_user`
* `aws_iam_role_policy_attachment.admin_access`
* `aws_iam_role_policy_attachment.super_user`
* `aws_iam_user.cicd`
* `aws_iam_user_policy_attachment.cicd`
* `aws_s3_bucket_policy.billingreports`

Data Resources
--------------
* `data.aws_iam_policy_document.assume_role`
* `data.aws_iam_policy_document.assumerole_all`
* `data.aws_iam_policy_document.assumerole_data_restricted`
* `data.aws_iam_policy_document.assumerole_developers`
* `data.aws_iam_policy_document.assumerole_sync`
* `data.aws_iam_policy_document.bastion_assumerole_policy`
* `data.aws_iam_policy_document.billing_read_only`
* `data.aws_iam_policy_document.billingreports`
* `data.aws_iam_policy_document.cicd`
* `data.aws_iam_policy_document.data_analyst`
* `data.aws_iam_policy_document.data_team_extra`
* `data.aws_iam_policy_document.deny_s3_archives`
* `data.aws_iam_policy_document.developer_permissions`
* `data.aws_iam_policy_document.ecs_admins`
* `data.aws_iam_policy_document.ep_terraform_state_write_access`
* `data.aws_iam_policy_document.force_mfa`
* `data.aws_iam_policy_document.livestream_elemental_access`
* `data.aws_iam_policy_document.mindful_moments_access`
* `data.aws_iam_policy_document.restrict_destructive_actions`
* `data.terraform_remote_state.audit`
* `data.terraform_remote_state.credstash`
* `data.terraform_remote_state.dev_data_analytics`
* `data.terraform_remote_state.etl_datascience`
* `data.terraform_remote_state.ops_atlantis`
* `data.terraform_remote_state.prod_content`
* `data.terraform_remote_state.prod_data_analytics`
* `data.terraform_remote_state.prod_livestream`
* `data.terraform_remote_state.prod_mindful_moments`
* `data.terraform_remote_state.staging_jumpbox`
* `data.terraform_remote_state.staging_livestream`
* `data.terraform_remote_state.staging_mindful_moments`

Child Modules
-------------
* `aleksei_lesnov` from `../../../modules/user-roles/v4`
* `alex_linares` from `../../../modules/user-roles/v4`
* `alex_wells` from `../../../modules/user-roles/v4`
* `alexander_gorokhov` from `../../../modules/user-roles/v4`
* `aliaksei_bedonik` from `../../../modules/user-roles/v4`
* `allen_tong` from `../../../modules/user-roles/v4`
* `amber_muni` from `../../../modules/user-roles/v4`
* `anna_molchanova` from `../../../modules/user-roles/v4`
* `annemarie_finn` from `../../../modules/user-roles/v4`
* `artem_elyseev` from `../../../modules/user-roles/v4`
* `billingreports` from `../../../modules/site/s3-bucket/v3`
* `bose_athota` from `../../../modules/user-roles/v4`
* `charles_kim` from `../../../modules/user-roles/v4`
* `christian_soulages` from `../../../modules/user-roles/v4`
* `courtney_osborne` from `../../../modules/user-roles/v4`
* `daniel_song` from `../../../modules/user-roles/v4`
* `data_terraform_policies` from `../../../modules/site/tf-state-policy/v2`
* `david_laroue` from `../../../modules/user-roles/v4`
* `denis_bozhik` from `../../../modules/user-roles/v4`
* `dmitry_rendov` from `../../../modules/user-roles/v4`
* `eddie_park` from `../../../modules/user-roles/v4`
* `esfandiar_behrouz` from `../../../modules/user-roles/v4`
* `florent_bachelier` from `../../../modules/user-roles/v4`
* `gabe_levasseur` from `../../../modules/user-roles/v4`
* `george_torres` from `../../../modules/user-roles/v4`
* `hs_account_defaults` from `../../../modules/base/account-defaults/v9`
* `iryna_dastanka` from `../../../modules/user-roles/v4`
* `jason_savoie` from `../../../modules/user-roles/v4`
* `jeannie_nguyen` from `../../../modules/user-roles/v4`
* `jen_nguyen` from `../../../modules/user-roles/v4`
* `joseph_i` from `../../../modules/user-roles/v4`
* `julio_ceballos` from `../../../modules/user-roles/v4`
* `kevin_fang` from `../../../modules/user-roles/v4`
* `kunal_parakh` from `../../../modules/user-roles/v4`
* `label` from `../../../modules/base/null-label/v2`
* `lee_richardson` from `../../../modules/user-roles/v4`
* `lucas_hawes` from `../../../modules/user-roles/v4`
* `maksim_zaretski` from `../../../modules/user-roles/v4`
* `maryna_buryna` from `../../../modules/user-roles/v4`
* `michael_hsu` from `../../../modules/user-roles/v4`
* `michael_wrather` from `../../../modules/user-roles/v4`
* `natallia_mikulskaya` from `../../../modules/user-roles/v4`
* `paddy_hannon` from `../../../modules/user-roles/v4`
* `pavel_anosav` from `../../../modules/user-roles/v4`
* `rachel_stevenson` from `../../../modules/user-roles/v4`
* `ruvan_jayasinghe` from `../../../modules/user-roles/v4`
* `sagar_bhuta` from `../../../modules/user-roles/v4`
* `sarah_sultan` from `../../../modules/user-roles/v4`
* `sebastian_nystorm` from `../../../modules/user-roles/v4`
* `sergey_kalashnikov` from `../../../modules/user-roles/v4`
* `sharif_nassar` from `../../../modules/user-roles/v4`
* `sherwin_mina` from `../../../modules/user-roles/v4`
* `sumit_dubey` from `../../../modules/user-roles/v4`
* `swapna_savant` from `../../../modules/user-roles/v4`
* `trevor_peace` from `../../../modules/user-roles/v4`
* `victor_storozhenko` from `../../../modules/user-roles/v4`
* `vincent_oe` from `../../../modules/user-roles/v4`
* `wally_perez` from `../../../modules/user-roles/v4`
<!-- END OF TERRAFORM-DOCS HOOK -->
