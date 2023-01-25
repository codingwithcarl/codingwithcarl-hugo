---
title: "EC2 with Terraform"
date: 2023-01-25T14:09:32-05:00
draft: false
---

*Simple Terraform template to create an AWS EC2 Instance.*

[View Codebase »](https://github.com/codingwithcarl/ec2-terraform)

<!-- ABOUT -->
## About

This template will create a single EC2 instance with Terraform. The repository documents what the files do and what commands to run in order to successfully provision the EC2 instance.

<!-- USAGE EXAMPLES -->
## Usage

1. Insert AWS credentials to dev.conf and dev.tfvars
2. Add the S3 Bucket where the .tfstate will be stored in dev.conf
3. Pick your ami ID and copy it into main.tf
4. Copy your key name into main.tf
5. Add your security group(s) into main.tf (optional)
6. Run the following commands

Initialize Terraform with our config:

```bash
terraform init --backend-config=config/dev.conf
```

Output the plan:

```bash
terraform plan --var-file=config/dev.tfvars
```

Terraform will check the current state and attempt to match the desired state. 

Save the plan to a file:

```bash
terraform plan -out myplan --var-file=config/dev.tfvars
```

Apply the changes:

```bash
terraform apply myplan
```