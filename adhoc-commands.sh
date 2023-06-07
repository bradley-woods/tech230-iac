# Useful Ansible ad-hoc commands for troubleshooting
# --------------------------------------------------

# Check Nginx is running on the web server
sudo ansible web -a "sudo systemctl status nginx"

# Check MongoDB is running on the database server
sudo ansible db -a "sudo systemctl status mongodb"
