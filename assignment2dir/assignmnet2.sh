#!/bin/bash

echo "Starting configuration..."

# Set network configuration
echo "Configuring network..."
# Your network configuration commands here

# Install and configure apache2
echo "Installing and configuring apache2..."
sudo apt-get update
sudo apt-get install -y apache2

# Install and configure squid
echo "Installing and configuring squid..."
sudo apt-get install -y squid

# Configure firewall with ufw
echo "Configuring firewall..."
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 3128/tcp
sudo ufw enable

# Create users and configure SSH
echo "Creating user accounts..."
for user in dennis aubrey captain snibbles brownie scooter sandy perrier cindy tiger yoda; do
  sudo useradd -m -s /bin/bash "$user"
  sudo mkdir -p /home/"$user"/.ssh
  # Add user-specific SSH keys
  # Example public key addition:
  echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG4rT3vTt99Ox5kndS4HmgTrKBT8SKzhK4rhGkEVGlCI student@generic-vm" | sudo tee -a /home/"$user"/.ssh/authorized_keys
  sudo chown -R "$user":"$user" /home/"$user"/.ssh
done

echo "Configuration complete."
