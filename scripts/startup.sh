#!/bin/bash

# 1. Exit immediately if any command fails, and ensure we are running as root
set -e
if [ "$EUID" -ne 0 ]; then 
  echo "Please run this script as root or using sudo."
  exit 1
fi

# 2. Update package lists cleanly without interactive prompts
export DEBIAN_FRONTEND=noninteractive
apt-get update -y

# 3. Install Docker and Docker Compose
apt-get install -y docker.io docker-compose

# 4. Ensure Docker starts automatically on system boot
systemctl enable docker
systemctl start docker

# 5. Fix permissions and execute the startup script safely
# NOTE: Make sure your 'scripts' folder is copied to the machine before this runs!
if [ -f "scripts/startup.sh" ]; then
    chmod +x scripts/startup.sh
    ./scripts/startup.sh
else
    echo "Warning: scripts/startup.sh not found in the current directory!"
fi