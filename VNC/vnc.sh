echo
rsync -Rv /run/media/vaibhavg/Backup/PC/DOCS/VNC/install.sh  /root/

rsync -Rv /run/media/vaibhavg/Backup/PC/DOCS/VNC/vnc-setup.tar.gz /root/



echo

sh /root/install.sh

 mv /usr/local/TigerVNC/passwd  /usr/local/TigerVNC/passwd_old

 cp /run/media/vaibhavg/Backup/PC/DOCS/VNC/passwd /usr/local/TigerVNC/

 rm -rf /usr/local/TigerVNC/passwd_old


