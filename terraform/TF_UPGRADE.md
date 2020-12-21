## Terraform Upgrade Playbook

So, Hashicorp released a new version of Terraform (bless their heart) and you would like to use it? With a little bit of good luck and guidance we will make this happen.

#### What's breaking?
The first step to upgrade is to identify any breaking changes in the new version of Terraform. We also need to understand how the breaking changes will impact our usage of Terraform:
* Which roles need to be updated?
* Do we need to make any changes to our modules?
* Are data resources or providers changed in any way?

Most likely you'll need to experiment with the new version of Terraform in roles/modules that are impacted. You can do this by adding a `.terraform-version` file with the new version to the role.
This will allow you to test the new Terraform version in isolation without impacting other roles.

#### We need docs
A potential casualty of upgrading Terraform is [terraform-config-inspect](http://github.com/HeadspaceMeditation/terraform-config-inspect). We have a forked version that has been modified, and often times, is out of date with the upstream. Some changes to Terraform
syntax can cause terraform-config-inspect to also break. To verify it still works do the following:

* Add a `.terraform-version` file with the new Terraform version to a role
* Run `tfenv install`
* Run `terraform-config-inspect`
* Check the output to see that it matches and the command exited without an error code

#### Plan it out now
Create Jiras for each step of the upgrade, for example you may need a Jira to upgrade terraform-config-inspect, upgrading providers, upgrading certain roles first, etc.


Figure out the timeline and how long you think the upgrade will take.

#### The key to a successful upgrade is Good Communication
Once you have identefied the the changes needed to do the upgrade, we need to communicate them to the rest of the Engineering organization.
At least one day before the upgrade work is going to begin, email the engineering org describing the benefits of the upgrade, how long it will take, and any potential impacts.
Also send the same message in the #ops slack channel.


#### Do the Upgrade
Now it is time to do what you came here for. The recommended approach is to follow these steps:

* Upgrade terraform-config-inspect and deploy the changes, if needed.
* Upgrade providers, if necessary.
* Upgrade the roles and modules that are impacted by the breaking changes first (include a new `.terraform-version` file in the roles).
* Upgrade images in hs-util-images to support the new version of Terraform (eg: atlantis, ops)
* Upgrade Terraform providers if necessary
* Upgrade [github-infra](https://github.com/HeadspaceMeditation/github-infra) to new version of Terraform
* Upgrade a handful of other roles that are not impacted by breaking changes.
* Upgrade the entire repo by changing `.terraform-version` in the root of the repo and removing all other files.
* Upgrade `github-infra` and other Terraform containing repos as well.
