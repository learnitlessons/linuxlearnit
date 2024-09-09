#!/bin/bash

# This script sets up the sudo group, creates user Jane,
# and configures specific sudo permissions for her.

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to check if the script is run as root
check_root() {
    if [ "$(id -u)" != "0" ]; then
        echo "This script must be run as root" 1>&2
        exit 1
    fi
}

# Function to create sudo group
create_sudo_group() {
    if ! getent group sudo > /dev/null; then
        groupadd sudo
        echo "Sudo group created."
    else
        echo "Sudo group already exists."
    fi
}

# Function to add sudo group to sudoers
add_sudo_to_sudoers() {
    if ! grep -q "^%sudo" /etc/sudoers; then
        echo "%sudo   ALL=(ALL:ALL) ALL" >> /etc/sudoers
        echo "Sudo group added to sudoers."
    else
        echo "Sudo group already in sudoers."
    fi
}

# Function to create user Jane and add to sudo group
create_user_jane() {
    if ! id -u jane > /dev/null 2>&1; then
        useradd -m -s /bin/bash jane
        echo "User Jane created."
        usermod -aG sudo jane
        echo "Jane added to sudo group."
        echo "Please set a password for Jane:"
        passwd jane
    else
        echo "User Jane already exists."
    fi
}

# Function to configure Jane's specific sudo permissions
configure_jane_sudo() {
    if ! grep -q "^jane" /etc/sudoers; then
        echo "jane ALL=(ALL) NOPASSWD: /bin/kill, /bin/id, PASSWD: /sbin/fdisk" >> /etc/sudoers
        echo "Jane's sudo permissions configured."
    else
        echo "Jane's sudo permissions already configured."
    fi
}

# Main execution
check_root
create_sudo_group
add_sudo_to_sudoers
create_user_jane
configure_jane_sudo

echo "Setup complete. Please test the configuration."
