# 🚀 Terraform EC2 + Custom AMI Creation (AWS)

This project demonstrates how to provision an EC2 instance using Terraform, install required software automatically using `user_data`, and create a custom AMI from that instance.

Region used: **ap-south-1 (Mumbai)**

---

## 📌 Project Overview

This Terraform project performs the following:

- ✅ Launches an EC2 instance (t2.micro)
- ✅ Installs Java and Git using user_data
- ✅ Creates a custom AMI from the running instance
- ✅ Outputs the Instance ID and AMI ID
- ✅ Verifies the AMI in AWS Console

---

## 🛠️ Technologies Used

- Terraform
- AWS EC2
- AWS AMI
- Ubuntu
- PowerShell
- Infrastructure as Code (IaC)

---

## 📁 Project Structure
terraform_ec2_AMI/
│
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md


<img width="1919" height="886" alt="Screenshot 2026-02-24 150634" src="https://github.com/user-attachments/assets/95f2cae8-6132-4f7a-ab0d-fc987c33f0f9" />

<img width="1919" height="1042" alt="Screenshot 2026-02-24 150528" src="https://github.com/user-attachments/assets/84cd3cf7-7a8e-4548-a372-974981d07b24" />

<img width="984" height="544" alt="Screenshot 2026-02-24 150718" src="https://github.com/user-attachments/assets/ccfe6122-89c0-47d1-8511-1eec2a3fd392" />

