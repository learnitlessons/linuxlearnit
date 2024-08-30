#!/bin/bash

# Create a directory for our sample files
mkdir -p linux_admin_samples
cd linux_admin_samples

# Sample 1: System Information
cat << EOF > system_info.txt
Linux System Information
========================
Hostname: myserver
OS: Ubuntu 20.04 LTS
Kernel: 5.4.0-42-generic
CPU: Intel(R) Xeon(R) CPU E5-2680 v3 @ 2.50GHz
Memory: 16GB RAM
Disk: 500GB SSD
Network: eth0 10.0.0.1/24

Important system files:
/etc/passwd - User account information
/etc/fstab - Filesystem table
/var/log/syslog - System logs
/proc/cpuinfo - CPU information
EOF

# Sample 2: User Management
cat << EOF > user_management.txt
User Management in Linux
========================
Adding a new user:
sudo useradd -m johndoe
sudo passwd johndoe

Modifying user properties:
sudo usermod -aG sudo johndoe

Deleting a user:
sudo userdel -r johndoe

Important user-related files:
/etc/passwd - User account information
/etc/shadow - Encrypted passwords
/etc/group - Group information

Remember to use strong passwords and follow the principle of least privilege!
EOF

# Sample 3: Package Management
cat << EOF > package_management.txt
Package Management in Ubuntu
============================
Updating package lists:
sudo apt update

Upgrading installed packages:
sudo apt upgrade

Installing a new package:
sudo apt install nginx

Removing a package:
sudo apt remove nginx

Searching for a package:
apt search nginx

Listing installed packages:
dpkg --list

Always keep your system up-to-date to ensure security and stability!
EOF

# Sample 4: Network Configuration
cat << EOF > network_config.txt
Network Configuration in Linux
==============================
Viewing network interfaces:
ip addr show

Configuring a static IP:
sudo nano /etc/netplan/01-netcfg.yaml

Example configuration:
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      addresses:
        - 192.168.1.100/24
      gateway4: 192.168.1.1
      nameservers:
          addresses: [8.8.8.8, 8.8.4.4]

Applying network changes:
sudo netplan apply

Checking DNS resolution:
nslookup example.com

Troubleshooting:
ping google.com
traceroute google.com
EOF

# Sample 5: Process Management
cat << EOF > process_management.txt
Process Management in Linux
===========================
Viewing running processes:
ps aux

Monitoring system resources:
top

Killing a process:
kill <PID>
killall <process_name>

Setting process priority:
nice -n 10 <command>
renice -n 10 -p <PID>

Background and foreground:
command &  # Run in background
fg  # Bring to foreground
bg  # Resume in background

Always be careful when managing processes, especially system processes!
EOF

echo "Sample files have been generated in the linux_admin_samples directory."
