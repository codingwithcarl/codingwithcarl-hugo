---
title: "Jenkins on AWS"
date: 2023-10-13T14:06:56-04:00
draft: false
---

*Terraform Repository to deploy a Jenkins server to AWS.*  

[View Codebase »](https://github.com/codingwithcarl/tf-jenkins-server)

<!-- ABOUT -->
## About

Provision Jenkins to AWS with this Terraform template. This will create several AWS resources: VPC, EC2s, Security Groups, Subnets, etc. 

The Jenkins Controller and a Jenkins Agent will be provisioned on two separate EC2 instances. 

### Built With

* [Terraform](https://www.terraform.io/)
* [Jenkins](https://www.jenkins.io/)

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

1. An AWS account and access to the [AWS Management Console](https://aws.amazon.com/console/)
2. An S3 bucket for  [Terraform state tracking](https://developer.hashicorp.com/terraform/language/state)
3. [AWS CLI](https://aws.amazon.com/cli/)
4. [Key Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) to ssh into the EC2 instances.
5. [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

<!-- USAGE EXAMPLES -->
## Usage

This is IaC to manage your CI/CD infrastructure. Once deployed, ensure to consult the [documentation](https://www.jenkins.io/doc/book/), configure Jenkins for your environment, and write a [Jenkinsfile](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/) under your project repository.

Ensure to sign into the AWS CLI.

```bash
aws login
```

Modify the data sources and resources to match your current environment. See my blog post for an explanation [here](https://codingwithcarl.com/posts/2023-10-13-jenkins/).

Initalize Terraform, validate the plan to provision the AWS resources, and apply.

```bash
terraform init
terraform plan
terraform apply
```
