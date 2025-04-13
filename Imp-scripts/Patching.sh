#!/bin/bash

# Set variables
LOGFILE="/var/log/linux_patch_$(date +%F).log"
BACKUP_DIR="/root/patch_backups"
MYSQL_BACKUP="$BACKUP_DIR/mysql_backup_$(date +%F).sql"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Create backup directory
mkdir -p $BACKUP_DIR

echo -e "${GREEN}[INFO] Starting Linux patching process...${NC}" | tee -a $LOGFILE

# 1. Show OS and Kernel version
echo -e "\n[INFO] OS and Kernel version:" | tee -a $LOGFILE
cat /etc/redhat-release | tee -a $LOGFILE
uname -r | tee -a $LOGFILE

# 2. Backup MySQL (if installed)
if command -v mysqldump >/dev/null 2>&1; then
    echo -e "${GREEN}[INFO] Backing up MySQL...${NC}" | tee -a $LOGFILE
    mysqldump -u root --all-databases > $MYSQL_BACKUP 2>>$LOGFILE
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] MySQL backup saved at $MYSQL_BACKUP" | tee -a $LOGFILE
    else
        echo -e "${RED}[ERROR] MySQL backup failed!${NC}" | tee -a $LOGFILE
    fi
else
    echo "[INFO] MySQL not installed, skipping DB backup." | tee -a $LOGFILE
fi

# 3. List updates
echo -e "\n[INFO] Checking available updates..." | tee -a $LOGFILE
yum check-update >> $LOGFILE

# 4. Perform full update
echo -e "\n${GREEN}[INFO] Applying updates...${NC}" | tee -a $LOGFILE
yum update -y >> $LOGFILE

# 5. Check if reboot is needed
REBOOT_NEEDED=$(needs-restarting -r 2>/dev/null)
if [ $? -eq 0 ]; then
    echo -e "${GREEN}[INFO] System requires a reboot to apply patches.${NC}" | tee -a $LOGFILE
else
    echo "[INFO] No reboot required." | tee -a $LOGFILE
fi

# 6. Log installed packages
echo -e "\n[INFO] Recently updated packages:" | tee -a $LOGFILE
rpm -qa --last | head -20 | tee -a $LOGFILE

# 7. Prompt for reboot
read -p "Do you want to reboot now? (y/n): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo -e "${GREEN}[INFO] Rebooting system...${NC}" | tee -a $LOGFILE
    reboot
else
    echo "[INFO] Skipping reboot. Please remember to reboot manually later." | tee -a $LOGFILE
fi
