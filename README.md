<div style="text-align:center"><img  width="250" src="./assets/logo.png" /></div>

## What is Doact? 🚀
---
**Doact** is a [Terraform](https://www.terraform.io/) module to automate the deployment and hosting process of your own runners on [Digital Ocean](https://m.do.co/c/3bc2250b7076) cloud to run jobs in your [GitHub Actions](https://github.com/features/actions) workflows. It makes it easy to automate all your software workflows, now with world-class CI/CD. Build, test, and deploy your code right from GitHub. 
##  Why Doact? 🧐
---
Doact sets up a self-hosted runner on the cloud. Self-hosted runners offer more control of hardware, operating system, and software tools than GitHub-hosted runners provide. With self-hosted runners, you can choose to create a custom hardware configuration with more processing power or memory to run larger jobs, install software available on your local network, and choose an operating system not offered by GitHub-hosted runners.
You can read more about self-hosted runner [here](https://help.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners).

> **Note**: Currently doact supports machines with Linux X64 architecture.

## Prerequisites ✅
---
**Terraform** 

Ensure you have [Terraform](https://www.terraform.io/) installed. A handy tool to manage your Terraform version is [tfenv](https://github.com/kamatama41/tfenv).

On macOS it is simple to install `tfenv` using brew.

```bash
$ brew install tfenv
```

Next install a Terraform version.

```bash
$ tfenv install <version>
```

**DigitalOcean Personal Access Token**

This module uses DigitalOcean (DO) provider is used to interact with the resources supported by DigitalOcean. The provider needs to be configured with the proper credentials before it can be used. Check [Terraform DigitalOcean Provider](https://www.terraform.io/docs/providers/do/index.html) for more detailed usage and examples.
To generate a personal access token, follow this [tutorial](https://www.digitalocean.com/docs/apis-clis/api/create-personal-access-token/).

**Github personal access token**

The module requires Github personal access token for the admin access to the repository and to configure the runner. You can create a personal access token by following this [tutorial](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line).

**SSH Public Key**

 Your SSH Pulic key is required to give you full access to the Droplet on which your runner is hosted. [Droplets](https://www.digitalocean.com/products/droplets/) are virtual machines that run on top of virtualized hardware. 
 You can generate your own SSH Public Key by following this [tutorial](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key).
 
 ## Usage ⚙️
---

Paste your SSH Public Key inside the file [user_id_rsa.pub](ssh-keys/user_id_rsa.pub)

Run the following commands to use the module:

To initialize Terraform:
```bash
$ terraform init  
```
To inspect the resources that will be created:

```bash
$ terraform plan
```
To deploy the runner  :
```bash
$ terraform apply
```


To delete the runner :
```bash
$ terraform destroy
```
> **Note**: The above command will use the default values defined inside [variables.tf](./variables.tf) file. You can change the values if required.

**Terraform Inputs**

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| do\_token | Your DigitalOcean API token. | string | n/a | yes |
| github\_access\_token | Personal access token for the admin access to the repository | string | n/a | yes |
| github\_repo\_name | Name of the target repository. | string | n/a | yes |
| github\_username | Github Username. | string | n/a | yes |
| node\_size | Selected size for your provisioned Droplets. | string | `"1gb"` | no |
| region | Selected data center. | string | `"blr1"` | no |
| runner\_node\_count | Number of runner Droplets to provision. | string | `"1"` | no |
| ubuntu | Default Ubuntu LTS image. | string | `"ubuntu-18-04-x64"` | no |

**Terraform Outputs**

| Name | Description |
|------|-------------|
| runner-id |  DO instace ID for the created Runner |
| runner-ip | IP address to access the Runner |
| runner-name | Name of the Runner |

# Contributing 🍻
I welcome pull requests, bug fixes and issue reports. Before proposing a change, please discuss your change by raising an issue.

# Maintainer 😎
[Kumar Saurabh](https://in.linkedin.com/in/itsksaurabh)