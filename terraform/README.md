# Terraform #

MOB Terraform

## Setup
```bash
make setup
```

## Running

We use make to wrap terraform commands and include extra functionality.

#### Example commands
```
make plan                                       #default workspace
make plan-prod                                  #prod workspace
make plan-prod TERRAFORM_EXEC_ROLE=joe.johnson  #prod workspace using the joe johnson role
make apply-prod ARGS='-target=module.default'   #apply in prod and target one module
```

#### Example set role before commands
```bash
aws-bastion.sh login
export TERRAFORM_EXEC_ROLE=joe.johnson
make plan-prod
make apply-prod
```

## Layout ##
### data
There are two data accounts (prod and dev) which will eventually contain all data related infrasturcture.

The data analytics pipeline is being built in this account.  There are legacy resources currently in our headspace_prod (soon to be renamed) account which should be migrated into the respective data accounts in the future.

### emerging_products
There are three emerging product accounts (prod, staging, and dev), however only two are in use (prod and staging) and the dev account will be retired.

These accounts were created to support the creation of ML suggestion resources.

In the near future these accounts will be deleted and resources will be migrated to the data accounts.

The terraform state for these accounts are stored in a separate S3 bucket from the rest of the accounts.

### headspace
This is where the headspace applications live and everything used to be in the master account.

Now we are splitting up our resources to be one account per environment (prod, staging, integration).

### alpha|audit|bastion|cloudfront_signing|headspace_skill|logging|ops ###
Configuration for each respective account, there is only one account per directory

### <account>/global
Configuration for resources which are global in AWS, shared across multiple roles and required for each new account.

Examples:

* Global IAM role used by CircleCI
* Shared Credstash DynamoDB table
* ACM Certificates (assuming we don't need separate certs per region)
* Cloudtrail and AWS Config Setup

### <account>/roles
A role is a distinct functionality which requires typically requires it's own separate IAM role.

Examples:
* content
* b2b
* ecs

### **global-variables.tf.json ###
Shared variables across all Terraform code

### **account-variables.tf.json ###
Shared variables across an account

### **tf** and **terraform.sh** ###

Terraform wrapper scripts (symlinked).

### **lib/** ###

Shared Makefiles, scripts, plugins, providers, configurations


## Modules ##

Modules are in `/modules`, roughly divided into two categories: `base` and `site`

`base` modules are modules that are used by other modules, or modules that are copied from the internet. These are modules that we could conceivably release as open source.
`site` modules are modules that have Headspace specific configuration, and are unlikely to be ever released to the public. They very likely are a composition of other modules.

### Module versioniong ###

Each module has one or more versions. When creating a new version, simply copy the code to the next version directory, and make a PR with changes. It is best to make one commit to add the new version with no code changes, and subsequent commits to make changes, so it is easier for code reviewers to see just the differences in a module.

Breaking changes that require a new version:

* New required variables
* Changes to default behavior that require the caller to make changes to the way they use the module, the resources it creates, or their understanding of the universe.

Non-breaking changes that do not require a new version:

* Adding outputs (usually)
* Use your best judgement
