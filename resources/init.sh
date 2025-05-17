#!/bin/bash
# Update and install Docker & Python
#!/bin/bash

# Update package list
apt-get update -y

# Install required dependencies
apt-get install -y software-properties-common curl apt-transport-https ca-certificates gnupg lsb-release

# Add deadsnakes PPA for Python 3.12
add-apt-repository ppa:deadsnakes/ppa -y
apt-get update -y

# Install Docker, Git, Python 3.12, and pip
apt-get install -y docker.io git python3.12 python3.12-venv python3.12-dev

# Install pip for Python 3.12
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12

# Add current user to Docker group for non-root usage
usermod -aG docker $USER