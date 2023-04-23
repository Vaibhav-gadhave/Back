#bin bash

echo File...........

mkdir -p /deadline1

echo mounting............

mount -t cifs -o username=root,password=admin //10.100.2.50/DeadlineRepositoryi /deadline1/

