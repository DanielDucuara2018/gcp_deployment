#!/bin/bash
# Update and install Docker & Python

# Update package list
apt-get update -y

# Install required dependencies
apt-get install -y software-properties-common curl apt-transport-https ca-certificates gnupg lsb-release

# Add deadsnakes PPA for Python 3.12
add-apt-repository ppa:deadsnakes/ppa -y
apt-get update -y

# Install Docker, Git, Python 3.12, and pip
apt-get install -y docker.io docker-compose-plugin git python3.12 python3.12-venv python3.12-dev

# Install pip for Python 3.12
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12

# Start and enable docker service
systemctl enable docker
systemctl start docker

# Add current user to Docker group for non-root usage
usermod -aG docker $USER

## WireGuard setup

# Enable IP forwarding (required for WireGuard to route traffic)
sysctl -w net.ipv4.ip_forward=1
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

# Enable kernel modules for WireGuard
modprobe ip_tables

# Clone repo and run WireGuard compose
git clone https://github.com/DanielDucuara2018/gcp_deployment.git /opt/wireguard
cd /opt/wireguard && docker compose up -d