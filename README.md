# EKS Infrastructure with Terraform and IRSA

This project provisions a production-like Kubernetes infrastructure on AWS using Terraform, including secure workload access to AWS services through IAM Roles for Service Accounts (IRSA).

## Overview

The main goal of this repository is to demonstrate practical cloud infrastructure provisioning with a strong focus on:

- Infrastructure as Code with Terraform
- Kubernetes on AWS using EKS
- Secure IAM integration for Kubernetes workloads
- High availability across multiple Availability Zones
- Production-oriented networking and ingress design

## What this project demonstrates

- Provisioning an Amazon EKS cluster with Terraform
- Building a VPC with public and private subnets across multiple AZs
- Using NAT Gateways for outbound internet access from private workloads
- Configuring IAM Roles for Service Accounts (IRSA)
- Installing the AWS Load Balancer Controller with Helm
- Managing remote Terraform state in S3
- Structuring infrastructure using modular Terraform design

## Architecture Highlights

### Network Layer
- VPC spanning multiple Availability Zones in `us-east-1`
- Public subnets for external load balancers
- Private subnets for worker nodes
- Kubernetes subnet tagging for ELB and internal ELB discovery
- NAT Gateways for secure outbound internet access from private subnets

### EKS Control Plane
- EKS cluster with both public and private API endpoint access
- OIDC provider configured for IRSA
- Integration between Kubernetes service accounts and AWS IAM roles

### Compute Layer
- Managed Node Group deployed in private subnets
- IAM permissions configured for:
  - EKS worker node communication
  - VPC CNI networking
  - Pulling container images from ECR

### Ingress and Load Balancing
- AWS Load Balancer Controller deployed with Helm
- Dedicated Kubernetes service account annotated with IAM role
- Fine-grained IAM permissions for ALB and NLB provisioning

### State and Workflow
- Remote Terraform state stored in S3
- Kubernetes and Helm authentication using `aws eks get-token`
- Pre-commit automation for formatting, validation, and Terraform documentation generation

## Technologies

- AWS
- Amazon EKS
- Terraform
- Kubernetes
- Helm
- IAM
- OIDC
- S3

## Security Notes

This project includes IRSA to provide secure access from Kubernetes workloads to AWS services without static credentials.

For lab purposes, the EKS API endpoint and security access may be more permissive than recommended for production. In a real-world production environment, public access should be restricted to trusted IP ranges such as VPNs or bastion hosts.

## How to run

```bash
terraform init
terraform plan
terraform apply
