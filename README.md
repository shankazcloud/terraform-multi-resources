# Terraform EC2 Setup with Remote State (S3 + DynamoDB)

This project creates an EC2 instance using Terraform with:
- Remote state in an S3 bucket
- State locking using DynamoDB
- Configurable via `terraform.tfvars`

## 🧱 Prerequisites

- Terraform installed
- AWS CLI configured (`aws configure`)
- An existing EC2 Key Pair in your AWS region

## ⚙️ Backend Setup (One-Time)

Before using this project, create:

### S3 Bucket

```bash
aws s3api create-bucket --bucket tf-demo-bucket-shankaz --region ap-south-1 \
  --create-bucket-configuration LocationConstraint=ap-south-1

aws s3api put-bucket-versioning \
  --bucket my-terraform-state-bucket \
  --versioning-configuration Status=Enabled
```

### DynamoDB Table

```bash
aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST
```

## 🚀 Usage

```bash
terraform init
terraform plan
terraform apply
```

Edit `terraform.tfvars` to customize instance details.

## 🔐 Security Best Practices

- Restrict access to the S3 bucket
- Enable encryption on the S3 bucket and DynamoDB table
- Use IAM roles with least privilege

## 🧹 Cleanup

```bash
terraform destroy
```

## 🧰 Notes

- State file is stored in `s3://tf-demo-bucket-shankaz/env/dev/ec2.tfstate`
- Locking is handled by `terraform-locks` table in DynamoDB
