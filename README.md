# Application Deployment Guide

## Prerequisites
- AWS account with appropriate permissions
- Docker installed locally
- Terraform installed locally
- GitHub account
- AWS CLI configured with credentials

## Setup Instructions

1. **Clone the Repository**
```bash
   
   git clone <repository-url>
   cd <repository-directory>
```

2. **Configure AWS Credentials**
   - Create an AWS IAM user with necessary permissions
   - Store AWS credentials in GitHub Secrets:
     - `AWS_ACCESS_KEY_ID`
     - `AWS_SECRET_ACCESS_KEY`
     - `AWS_REGION`
     - `APP_NAME`

3. **Configure Terraform Variables**
   - Copy `variables.tf` to modify default values if needed
   - Review and adjust:
     - `aws_region`
     - `app_name`
     - `app_port`
     - `vpc_cidr`
     - `public_subnet_cidr`
     - `private_subnet_cidr`

## Deployment Steps

1. **Apply Terraform Configuration**
```bash
   terraform init
   terraform plan
   terraform apply
```

2. **Build and Push Docker Image**
   - Ensure you have a `Dockerfile` in the root directory
   - The GitHub Actions workflow will automatically build and push the image on push to `main`

## Testing the Service

1. **Get the ECS Service Details**
```bash
   aws ecs describe-services \
     --cluster ${APP_NAME}-cluster \
     --services ${APP_NAME}-service
```

2. **Access the Application**
   - The service runs in a private subnet
   - To test, you may need to:
     - Set up a bastion host
     - Configure a load balancer
     - Use AWS Systems Manager Session Manager

3. **Verify Application Health**
   - Check CloudWatch logs:
```bash
   aws logs tail /ecs/${APP_NAME}
```

## Cleanup

To avoid incurring costs:
```bash
   terraform destroy
```

## Troubleshooting

- Check GitHub Actions logs for deployment issues
- Verify IAM permissions
- Check ECS task logs in CloudWatch
- Ensure Docker image is correctly built and pushed to ECR

