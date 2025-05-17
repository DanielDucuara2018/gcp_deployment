variable "project_id" {
  description = "gcp project id"
  type        = string
}

variable "region" {
  description = "Infrastructure region"
  type        = string
  default     = "europe-west4"
}

variable "zone" {
  description = "Infrastructure zone"
  type        = string
  default     = "europe-west4-a"
}

variable "ssh_user" {
  description = "The SSH username to access the VM (e.g., ubuntu)"
  type        = string
}

variable "public_key_path" {
  description = "Path to the local SSH public key"
  type        = string
}

variable "credential_file" {
  description = "Credential json file name"
  type        = string
}

variable "subnet_ip_cidr_range" {
  description = "The cidr of the vpc"
  default     = "10.0.1.0/24"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the EC2 instances"
  default     = "e2-medium"
  type        = string
}

variable "ami_id" {
  description = "The id of ubuntu Linux 2204 AMI"
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
  type        = string
}
