output_file="hardware_info.txt"

# Processor information
echo "==== Processor Information ====" >> $output_file
cat /proc/cpuinfo | grep "model name\|cpu cores" >> $output_file
echo "" >> $output_file

# RAM information
echo "==== RAM Information ====" >> $output_file
cat /proc/meminfo | grep "MemTotal\|MemFree" >> $output_file
echo "" >> $output_file

# IP address information
echo "==== IP Address Information ====" >> $output_file
ip addr show | grep "inet " | awk '{print $2}' >> $output_file
echo "" >> $output_file

# Graphics card information
echo "==== Graphics Card Information ====" >> $output_file
lspci -vnn | grep VGA -A 12 >> $output_file
echo "" >> $output_file

# Operating System information
echo "==== Operating System Information ====" >> $output_file
cat /etc/os-release >> $output_file
echo "" >> $output_file

# MAC address information
echo "==== MAC Address Information ====" >> $output_file
ip link show | grep "link/ether" | awk '{print $2}' >> $output_file
echo "" >> $output_file

# Hostname information
echo "==== Hostname Information ====" >> $output_file
hostname >> $output_file
echo "" >> $output_file

# Hard drive information
echo "==== Hard Drive Information ====" >> $output_file
lsblk >> $output_file
