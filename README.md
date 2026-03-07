# Terraform-Remote-Backend

This repository contains Terraform configuration files to deploy an AWS EC2 instance while maintaining the infrastructure state in a remote, locked backend.

📋 Components
1. Remote Backend (backend.tf)
This file instructs Terraform to stop storing the state file on your local machine and move it to AWS.

Bucket: bhavya-remote-backend (Stores the state file).

Key: bhavya/terraform.tfstate (The path within the bucket).

DynamoDB Table: terraform-lock (Used for state locking).

2. Infrastructure Resources (main.tf)
This file defines the actual AWS resources:

Provider: Configured for us-east-1.

EC2 Instance: A t3.micro instance using the specified AMI.

S3 Bucket: The bucket created to host the remote state.

DynamoDB Table: A table with a primary key LockID required for Terraform locking operations.

🚀 Getting Started
Prerequisites
Terraform installed.

AWS CLI configured with appropriate permissions.

Deployment Steps
Initialize Terraform:
This will detect the backend configuration and prepare the S3/DynamoDB connection.

Bash
terraform init
Review the Plan:
Check what resources will be created.

Bash
terraform plan
Apply Changes:
Deploy the EC2 instance, S3 bucket, and DynamoDB table.

Bash
terraform apply

💡 Key Takeaways
State Persistence: Since the .tfstate is in S3, you can delete your local folder and still manage your infrastructure from any other machine.

Concurrency Control: The DynamoDB table creates a lock during terraform apply. If another user tries to run a command simultaneously, Terraform will block them until your process is finished.

Safety: Storing state in S3 allows for versioning (if enabled), providing a backup history of your infrastructure.

<img width="1408" height="768" alt="Gemini_Generated_Image_xqzjsbxqzjsbxqzj" src="https://github.com/user-attachments/assets/14b85f14-a675-4114-8c37-a8fdd1c4a112" />
