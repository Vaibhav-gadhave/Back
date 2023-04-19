$output_file = "hardware_info.txt"

# Processor information
Write-Output "==== Processor Information ====" | Out-File $output_file -Append
Get-CimInstance Win32_Processor | Format-List Name, NumberOfCores, NumberOfLogicalProcessors, Manufacturer, MaxClockSpeed | Out-File $output_file -Append
Write-Output "" | Out-File $output_file -Append

# RAM information
Write-Output "==== RAM Information ====" | Out-File $output_file -Append
Get-CimInstance Win32_PhysicalMemory | Format-List BankLabel, Capacity, PartNumber, Manufacturer, Speed | Out-File $output_file -Append
Write-Output "" | Out-File $output_file -Append

# IP address information
Write-Output "==== IP Address Information ====" | Out-File $output_file -Append
Get-NetIPAddress | Format-Table IPAddress, InterfaceAlias | Out-File $output_file -Append
Write-Output "" | Out-File $output_file -Append

# Graphics card information
Write-Output "==== Graphics Card Information ====" | Out-File $output_file -Append
Get-CimInstance Win32_VideoController | Format-List Name, AdapterRAM, DriverVersion, VideoModeDescription | Out-File $output_file -Append
Write-Output "" | Out-File $output_file -Append

# Operating System information
Write-Output "==== Operating System Information ====" | Out-File $output_file -Append
Get-CimInstance Win32_OperatingSystem | Format-List Caption, Version, BuildNumber | Out-File $output_file -Append
Write-Output "" | Out-File $output_file -Append

# MAC address information
Write-Output "==== MAC Address Information ====" | Out-File $output_file -Append
Get-NetAdapter | Format-Table Name, MacAddress | Out-File $output_file -Append
Write-Output "" | Out-File $output_file -Append

# Hostname information
Write-Output "==== Hostname Information ====" | Out-File $output_file -Append
$env:COMPUTERNAME | Out-File $output_file -Append
Write-Output "" | Out-File $output_file -Append

# Hard drive information
Write-Output "==== Hard Drive Information ====" | Out-File $output_file -Append
Get-CimInstance Win32_DiskDrive | Format-List Caption, Size | Out-File $output_file -Append
