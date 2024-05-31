**Overview:**

This repository contains Terraform modules designed to facilitate the deployment of an application behind an AWS Application Load Balancer (ALB) within a custom Virtual Private Cloud (VPC), alongside essential IAM roles and network configurations. Modularizing Terraform code not only enhances maintainability by organizing infrastructure components into reusable modules but also promotes scalability and clarity in infrastructure management.

**Project Structure:**

<img width="690" alt="Screenshot 2024-05-31 at 11 18 24 AM" src="https://github.com/Karan-Singh-01/terraform-aws/assets/157451190/a26940c7-4e62-43e9-9dca-a78edf42009d">

**Module Overview:**

- **Application Module:** Deploys EC2 instances behind an ALB with a basic "Hello World!" web page.
- **IAM Module:** Defines IAM roles and policies required for EC2 instances.
- **Network Module:** Sets up a VPC with public and private subnets across multiple availability zones.
- **Security Module:** Configures security groups for the ALB and EC2 instances.

**Requirements:**

- Terraform >= v1.8.0
- AWS credentials configured with appropriate permissions.

**Usage:**
- Clone this repository.
- Modify the terraform.tfvars in the root of the repository and set the required variables. Refer to the variables.tf files in each module for a list of variables.
- Run ```terraform init``` to initialize Terraform.
- Run ```terraform plan``` to preview the changes that will be made.
- Run ```terraform apply``` to apply the changes.
