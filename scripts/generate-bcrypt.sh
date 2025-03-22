#!/bin/bash

# Ensure required command is installed
if ! command -v htpasswd &> /dev/null; then
    echo " 'htpasswd' not found. Install it with: sudo apt install apache2-utils (Debian/Ubuntu)"
    exit 1
fi

# Prompt for password (silent input)
read -s -p "Enter new ArgoCD admin password: " PASSWORD
echo ""
read -s -p "Confirm password: " PASSWORD_CONFIRM
echo ""

# Verify match
if [ "$PASSWORD" != "$PASSWORD_CONFIRM" ]; then
    echo " Passwords do not match. Exiting."
    exit 1
fi

# Generate bcrypt hash (no username, extract only hash)
BCRYPT_HASH=$(htpasswd -nbBC 10 "" "$PASSWORD" | tr -d ':\n' | sed 's/^ //')

echo ""
echo " Bcrypt hash generated:"
echo "$BCRYPT_HASH"
echo ""
echo " You can now use this in your Terraform variable: var.argocd_admin_password_hash"
