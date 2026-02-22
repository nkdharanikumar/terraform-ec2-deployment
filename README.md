# 🚀 Terraform AWS EC2 Flask Deployment

This project demonstrates how to provision AWS infrastructure using
**Terraform (Infrastructure as Code)** and deploy a simple **Flask web
application** on an EC2 instance.

------------------------------------------------------------------------

## 📌 Project Overview

Using Terraform, this project automatically:

-   Creates a custom VPC
-   Creates a Public Subnet
-   Attaches an Internet Gateway
-   Configures a Route Table
-   Creates a Security Group (HTTP + SSH access)
-   Launches an EC2 instance
-   Uploads a Flask application
-   Installs dependencies
-   Runs the Flask app automatically

The web application becomes accessible via the EC2 Public IP.

------------------------------------------------------------------------

## 🏗️ Architecture

VPC\
└── Public Subnet\
└── EC2 Instance (Flask App)\
└── Internet Gateway

------------------------------------------------------------------------

## 🛠️ Technologies Used

-   Terraform
-   AWS EC2
-   AWS VPC
-   AWS Security Groups
-   Python 3
-   Flask

------------------------------------------------------------------------

## 📂 Project Structure

terraform-ec2-deployment/ │ ├── provider.tf ├── variables.tf ├──
main.tf ├── outputs.tf ├── app.py ├── .gitignore └── README.md

------------------------------------------------------------------------

## ⚙️ Prerequisites

Before running this project, ensure you have:

-   Terraform installed
-   AWS CLI configured (`aws configure`)
-   An AWS account
-   An SSH key pair generated

------------------------------------------------------------------------

## 🔐 Configuration (Important)

Create a file named:

terraform.tfvars

Add the following:

public_key_path = "PATH_TO_YOUR_PUBLIC_KEY"\
private_key_path = "PATH_TO_YOUR_PRIVATE_KEY"\
ami_id = "YOUR_UBUNTU_AMI_ID"

⚠️ Do NOT commit this file to GitHub.

------------------------------------------------------------------------

## 🚀 How To Run

Initialize Terraform:

terraform init

Validate configuration:

terraform validate

Preview changes:

terraform plan

Apply and create infrastructure:

terraform apply

After successful deployment, Terraform will output the EC2 Public IP.

Access the application:

http://`<PUBLIC_IP>`{=html}

------------------------------------------------------------------------

## 🧹 Cleanup

To destroy the infrastructure:

terraform destroy

------------------------------------------------------------------------

## 📚 What I Learned

-   Infrastructure as Code (IaC)
-   Terraform workflow (init → plan → apply → destroy)
-   AWS networking basics (VPC, Subnet, IGW, Route Tables)
-   Security Group configuration
-   Remote provisioning using Terraform provisioners
-   Automating application deployment

------------------------------------------------------------------------

## 🚀 Future Improvements

-   Use S3 backend for remote state storage
-   Add Load Balancer
-   Implement CI/CD using GitHub Actions
-   Use Nginx + Gunicorn for production deployment
-   Convert into modular Terraform structure

------------------------------------------------------------------------

## 🙌 Acknowledgment

This project was built as part of my DevOps learning journey.

------------------------------------------------------------------------

## 📬 Connect

If you found this helpful or have suggestions, feel free to connect on
LinkedIn!
