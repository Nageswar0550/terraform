#### This is terraform module which creates VPC with the below resources in AWS

### Resources list:
* VPC
* Internet Gateway
* Public Subnets - 2 Subnets (One is in us-east-1 and other in us-east-2)
* Private Subnets - 2 Subnets (One is in us-east-1 and other in us-east-2)
* Database Subnets - 2 Subnets (One is in us-east-1 and other in us-east-2)
* Public Route Table
* Private Route Table
* Database Route Table
* Public Route Table Association - to both Public subnets and Public Route Table
* Private Route Table Association - to both Private subnets and Private Route Table
* Database Route Table Association - to both Database subnets and Database Route Table
* NAT Instance (for avoiding charges)
* Public Route with Gateway as Internet Gateway
* Private Route with Gateway as NAT Instance Network interface
* Database Route with Gatewat as NAT Instance Network interface

### Variables declared:
* VPC CIDR (Required) - User must define CIDR
* Environment (Required) - User must provide environment name (Dev, Prod, QA)
* Project Name (Required) - User must provide project name
* Public subnet CIDR (Required) - User must provide 2 CIDR's otherwise it will throw an error
* Private subnet CIDR (Required) - User must provide 2 CIDR's otherwise it will throw an error
* Database subnet CIDR (Required) - User must provide 2 CIDR's otherwise it will throw an error
* Tags (Optional)

### Data sources:
* Availability zones (we deployed in 2 AZ's for HA)
* NAT Instance AMI

### Outputs:
* VPC ID
* AZ's (Only 2)
* Private subnet ID's
* Public subnet ID's
* Database subnet ID's