#!/bin/bash 

# 1. Compress log file 
# 2. Save it with timestamp
# 3. Move it under /var/log/backups/
# 4. Clear the log file
# 5. Restart apache

log_file="access_log"
timestamp=$(date +%m-%d-%Y)

cd /var/log/httpd && tar -cf /var/log/backups/apache-access-log-$timestamp.tar $log_file
echo "" > $log_file
systemctl restart httpd