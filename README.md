# GCP Deployment with Terraform

Terraform configuration to provision a basic GCP infrastructure with a VM instance running Docker and Python 3.12.

## What's Provisioned

- **VPC Network**: Custom network with subnet (10.0.1.0/24)
- **VM Instance**: Ubuntu 22.04 VM (n2d-standard-2) with external IP
- **Cloud NAT**: For secure outbound internet access
- **Firewall**: SSH access on port 22
- **Startup Script**: Installs Docker, Git, and Python 3.12

## Prerequisites

- GCP account with billing enabled
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed
- [Terraform](https://www.terraform.io/downloads.html) installed
- GCP service account key (place in `resources/gcp-key.json`)

## Quick Start

1. **Generate SSH keys** (if you don't have them):

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

2. **Configure variables** in `terraform.tfvars`:

   ```hcl
   project_id       = "your-gcp-project-id"
   region           = "europe-west4"
   zone             = "europe-west4-a"
   ssh_user         = "ubuntu"
   public_key_path  = "~/.ssh/id_rsa.pub"
   credential_file  = "resources/gcp-key.json"
   ```

3. **Deploy infrastructure**:

   ```bash
   terraform init       # Initialize Terraform and download providers
   terraform fmt        # Format configuration files
   terraform validate   # Validate configuration syntax
   terraform plan       # Preview changes before applying
   terraform apply      # Create infrastructure
   ```

4. **Connect to VM**:

   ```bash
   ssh -i ~/.ssh/id_rsa ubuntu@<instance_ip>
   ```

5. **Destroy infrastructure** (when done):
   ```bash
   terraform destroy
   ```

## Project Structure

```
gcp_deployment/
├── provider.tf          # GCP provider configuration
├── variables.tf         # Input variables
├── vpc.tf              # VPC, subnet, NAT configuration
├── firewall.tf         # Firewall rules
├── vms.tf              # VM instance configuration
├── output.tf           # Output values (instance IP)
├── terraform.tfvars    # Variable values (not in git)
└── resources/
    ├── gcp-key.json    # Service account key (not in git)
    └── init.sh         # VM startup script
```

## Outputs

After deployment, Terraform outputs the VM's external IP address:

```bash
terraform output instance_ip
```
