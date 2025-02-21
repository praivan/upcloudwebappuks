# UpCloud Modern Web Application Infrastructure running on UKS

## Overview

This repository contains Terraform configurations for deploying a production-grade web application infrastructure on UpCloud. The architecture leverages UpCloud's managed services to minimize operational overhead while maintaining high availability and security.

## Core Components

### Network Architecture
- **Private Network Layout**
  - UKS Subnet: `10.10.1.0/24`
  - Database Subnet: `10.10.2.0/24`
  - Logging Subnet: `10.10.3.0/24`
  - Caching Subnet: `10.10.4.0/24`
  - Load Balancer Subnet: `10.10.0.0/24`

- **Network Security**
  - All components run in isolated private networks
  - NAT Gateway for outbound internet connectivity
  - Internal routing handled by UpCloud Router
  - DHCP enabled across all subnets

### Compute Layer (UKS - UpCloud Kubernetes Service)
- Production-grade Kubernetes cluster
- 24 worker nodes running on `CLOUDNATIVE-1xCPU-4GB` plan
- 3 control plane nodes (managed by UpCloud)
- Private node groups for enhanced security
- Control plane access restricted to specific IP ranges

### Database Layer
- **Managed PostgreSQL**
  - Plan: `2x16xCPU-64GB-1500GB`
  - High availability with 2 replicas
  - Private network access only
  - Automated backups
  - Timezone: Europe/Helsinki

### Logging & Analytics Layer
- **Managed OpenSearch**
  - Private network access
  - Native integration with Kubernetes logging

### Caching Layer
- **Managed Valkey**
  - In-memory caching
  - SSL/TLS encryption enabled

### Load Balancers
- **Public Load Balancer**
  - Handles incoming traffic
  - SSL/TLS termination
  - Direct integration with UKS

- **Internal Load Balancer**
  - Inter-service communication
  - Private network routing
  - Service discovery

## Prerequisites

- Terraform >= 1.0.0
- UpCloud Account with API access
- UpCloud API credentials

## Getting Started

1. **Clone the repository**
```bash
git clone <repository-url>
cd ukswebapp
```

2. **Configure credentials**
Create a `terraform.tfvars` file:
```hcl
upcloud_username = "your-api-username"
upcloud_password = "your-api-password"
region = "fi-hel2"  # Or your preferred region
```

3. **Initialize Terraform**
```bash
terraform init
```

4. **Review the deployment plan**
```bash
terraform plan
```

5. **Apply the configuration**
```bash
terraform apply
```

## Module Structure

```
.
├── main.tf                 # Main configuration file
├── variables.tf           # Input variables
├── outputs.tf            # Output definitions
├── modules/
│   ├── network/          # Network configuration
│   ├── uks/             # Kubernetes cluster configuration
│   ├── managed_postgres/ # Database configuration
│   ├── opensearch/      # Logging configuration
│   ├── valkey/         # Caching configuration
│   └── load_balancer/   # Load balancer configuration
```

## Configuration Details

### Network Module
```hcl
module "network" {
  source               = "./modules/network"
  region               = var.region
  private_network_name = var.private_network_name
  network_address      = var.network_address
  network_family       = var.network_family
  network_dhcp         = var.network_dhcp
}
```

### UKS Module
```hcl
module "uks" {
  source     = "./modules/uks"
  zone       = var.region
  node_count = 24
}
```

### Managed PostgreSQL Module
```hcl
module "managed_postgres" {
  source        = "./modules/managed_postgres"
  region        = var.region
}
```

## Security Features

- All services run in private networks
- NAT Gateway for controlled outbound access
- Network isolation between components
- Private node groups in Kubernetes
- SSL/TLS encryption for services
- Access control through private networks

## Monitoring and Management

- OpenSearch for centralized logging
- Kubernetes native monitoring
- Load balancer metrics
- Database performance monitoring

## Cost Optimization

The infrastructure is designed with cost optimization in mind:
- Right-sized compute resources
- Managed services to reduce operational overhead
- Efficient network design
- Auto-scaling capabilities in Kubernetes

## Limitations and Considerations

- Region-specific features may vary
- Service plan changes require careful consideration
- Network CIDR ranges are fixed after creation
- Some services require manual intervention for major version upgrades

## Troubleshooting

Common issues and solutions:
1. Network Connectivity
   - Check NAT Gateway status
   - Verify network routes
   - Confirm DHCP settings

2. Kubernetes Issues
   - Verify node health
   - Check control plane access
   - Review network policies

3. Database Connectivity
   - Verify network access
   - Check security settings
   - Review connection strings


## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues and feature requests, please file an issue in the repository.

---

*Note: This infrastructure is designed for production use. Please review and adjust security settings and resource sizes according to your specific needs.*