## VPC Allotment

|     |     |
| --- | --- |
|10.8.0.0/16| `alpha`|
|10.14.0.0/16| `audit` |

## Creating New Account

- Add account to bastion/global/accounts/accounts.tf

#### Account with multiple environments
```hcl
module "example_prod" {
  source = "./module"
  name = "example"
  environment = "prod"
}

module "example_staging" {
  source = "./module"
  name = "example"
  environment = "staging"
}
```

#### Account without multiple environments
```hcl
module "example" {
  source = "./module"
  name = "example"
}
```

- Run ```make apply```
- Note output value for the account id



## Login
- Login to AWS using root credentials and click on forgot password
- Reset password and add credentials to LastPass
- Enable MFA on root account and add MFA code to the LastPass Credentials

## Create Account in Terraform
- Add the new account to the account map in *global-variables.tf.json*
- Create a new provider in *global-variables.tf.json*
- Update /modules/user-roles/ to create a role for users in the new account

#### Note: for accounts with multiple environments only run make new-account-ACCOUNTNAME once without the environment
```bash
make new-account-ACCOUNTNAME
```

#### Create user roles in new account
```bash
make -C bastion/global/core apply
```

### AWS Config Rules
Find the latest version of the all-accounts-aws-config-rules module and run `make new-account-(name)'. Commit main.tf in the module and create a pull request. Run `make apply` in audit/roles/aws-config

#### Create foundational roles
- networking



## Delete an AWS account in Terraform

>NOTE: The following is mostly in hs-terraform repo. Pretty much "Add an AWS account" in reverse with some exceptions.

#### Remove remote access for users to account: bastion/core/. This will be done in two phases.
- First, create PR to delete account access from the users from bastion/global/core/*
- Next create PR to delete all providers for the account from bastion/global/core/*
> i.e.: remove all of these **`aws.test  =  "aws.test"`**

#### Verify/Destroy/Remove remote-state.tf references (of this account) that are used in any other roles.
> You might have to hunt for the account's resources use all over the place. Here are examples of emerging_products.

#### Destroy/Delete App Roles in account (i.e. account/roles/role_to_delete in any order)
```
cd account/roles/some_role
make destroy-<env>
```

#### Destroy/Delete Foundational roles (i.e. networking, core)
```
cd account/roles/networking
make destroy-<env>
```

#### Destroy/Delete Global roles (i.e. headspace_account/global/)
>Do all other roles under global, than ending with this order: route53, ssm, s3, global, 01-bootstrap.
```
cd account/global/route53
make destroy-<env>
```

#### After removing the account from global-variables.tf.json, run terraform against any roles that use the aws_account_map for all accounts.
```
cd other_account/roles/some_role
make apply-<env>
```

#### Verify terraform state files no longer exist in hs-terraform-state for the account/environments.

#### Second-to-last thing -- delete the account from bastion/global/accounts last.

#### The last thing you should do, delete account through AWS Console **Within**  the  account you want to delete. (More Info: [How to delete an AWS Account](https://aws.amazon.com/premiumsupport/knowledge-center/close-aws-account/))
>NOTE: All resources will be fully deleted after 90 days. So you really don't have to go and delete all other resources except user roles (and if you want to save money earlier, EC2/S3/etc)
