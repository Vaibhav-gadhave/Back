#bin/bash

rpm -e jre1.8.0_25-1.8.0_25-fcs.x86_64

echo java removed done.

/usr/bin/rsync -v /aslan/projects/For_Bakup/IT/sangam/jre-8u112-linux-x64.rpm  /tmp/

echo copy done..

cd /usr/lib64/mozilla/plugins/

/usr/bin/unlink  libnpjp2.so

echo so file unlinked done..

rpm -ivh /tmp/jre-8u112-linux-x64.rpm

echo rpm installation done..

/usr/bin/ln -s /usr/java/jre1.8.0_112/lib/amd64/libnpjp2.so libnpjp2.so

echo all installatio done..

echo restart your firefox

