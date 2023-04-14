#bin bash

echo "Copy is going on"

rsync -rv /aslan/projects/For_Bakup/IT/sangam/rishi/install.sh  /root/

rsync -rv /aslan/projects/For_Bakup/IT/sangam/rishi/vnc-setup.tar.gz /root/



echo "Copy has been done"

sh /root/install.sh

 mv /usr/local/TigerVNC/passwd  /usr/local/TigerVNC/passwd_old

 cp /aslan/projects/For_Bakup/IT/sangam/rishi/passwd /usr/local/TigerVNC/

 rm -rf /usr/local/TigerVNC/passwd_old

echo "installation Done"
