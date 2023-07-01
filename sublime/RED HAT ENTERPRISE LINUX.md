RED HAT ENTERPRISE LINUX

1) INTRODUCTION OF LINUX 
2) FILE ARCHITECTURE IN LINUX  
3) INSTALLATION PROCESS OF LINUX
4) 

COMMANDS : 
1) pwd   : present working directory
2) cd    : change directory to home directory 
3) cd directory name  (chabge directory to the perticular directory)
4) cd ..   (chage directory to previous directory)
5) ls       (list the content)
6) ls -l    (long listing content with details)
7) ls (directory name)
8) mkdir directory name  (to create new directory)
9) touch filename        (create new empty file)
10) rm -f filename       (delete the file)
11) rm -d directory name (delete empty directory)
12) rm -rf directory name (delete contentfull directory)
13) cat filename          (check files content without open file)
14) cat > filename        (overwrite the content) (press ctrl+dd)
15) cat >> filename       (append the content)
16) head filename         (to see top 10 lines of files)
17) head -2 filename      (to see top 2 lines)
18) tail filename         (to see bottom 10 lines)
19) tail -3 filename      (to see bottom 3 lines)
20) touch .filename       (to create hidden file)
21) mkdir .dirname        (to create hidden directory)
22) ls -a                 (to see hidden content)
23) history               (to check command history of terminal)
24) history > filename    (to save history in file)
25) history -c            (to clear history from terminal)
26) clear                 (to clear the screen )


VIM and its shortcuts

NEW USER JOINED : user create, password, group membership
EMPLOYEE LEFT   : data backup, delete that user & home profile  
EXISTING EMPLOYEE: permission assign, daily issues
NEW SERVER : LINUX INSTALL, 
OS REPAIR

# useradd username
# id username

/etc/passwd   (user config file)
/etc/group    (group config)
/etc/shadow   (encrypted passwords of all users)

mkdir vaibhav\ gadhave

create 100 users
check their home directories /home ?
change the home dir / login shell

	PERMISSIONS : MAINTAIN THE SECURITY
TYPES OF PERMISSIONS
* READ     : Read
* WRITE    : modify
* EXECUTE  : run that file   

read    : r  4     u: user owner      + : add
write   : w  2    g: group owner     - : remove
execute : x  1    o: others

# chmod u+rwx filename/dir  (set full permissions for user owner)
# chmod g+rwx filename/dir  (set full permissions for group owner)
# chmod o+rwx filename/dir  (set full permissions for others)
# chmod u-x filename/dir     (remove execute perm of user owner)
# chmod g-x filename/dir     (remove execute perm of group owner)
# chmod o-rwx filename/dir    (no permission for others)
# chmod 000 filename/dir      (removing all permission) 
# chmod 777 filename/dir     (full permission for all)
#  

000  > userowner:0, groupowner:0, other:0
100  > userowner:exe, groupowner:0, other:0
200  > userowner:read, groupowner:0, other:0
300  > userowner:write+exe, groupowner:0, other:0
400  > userowner:read, groupowner:0, other:0 
500  > userowner:read+exe, groupowner:0, other:0
600  > userowner:read+write, groupowner:0, other:0
700  > userowner:read+write+exe, groupowner:0, other:0
710  > userowner:read+write+exe, groupowner:exe, other:0
720  > userowner:read+write+exe, groupowner:write, other:0
730  > userowner:read+write+exe, groupowner:write+exe, other:0
740  > userowner:read+write+exe, groupowner:read, other:0
750  > userowner:read+write+exe, groupowner:read+exe, other:0
760  > userowner:read+write+exe, groupowner:read+write, other:0
770  > userowner:read+write+exe, groupowner:read+write+exe, other:0
771  > userowner:read+write+exe, groupowner:read+write+exe, other:exe
772  > userowner:read+write+exe, groupowner:read+write+exe, other:write
773  > userowner:read+write+exe, groupowner:read+write+exe, other:write+exe
774  > userowner:read+write+exe, groupowner:read+write+exe, other:read
775  > userowner:read+write+exe, groupowner:read+write+exe, other:read+exe
776  > userowner:read+write+exe, groupowner:read+write+exe, other:read+write
777  > userowner:read+write+exe, groupowner:read+write+exe, other:read+write+exe

# chmod 777 file/dirname       (change the permissions)
# chown	username file/dirname  (change user ownership)
# chgrp groupname file/dirname (change group ownership)

 
PRACTICAL STEPS

 * create users
 * create groups
 * new directory in /
 * add users in groups
 * change ownership of dir and check with owner
 * change group owner and check with grous member
 

 ACL (Access control list)

 1 vaibhavg
 2 avegen

 touch /home/test
 #setfacl -m u:avegen:rw- /home/test # provides read and write permission for user avegen to a particular directory /home/test
 #setfacl -m g:IT:rwx /home/test
 #getfacl /home/test   # command to check permission
  
 groupadd Finance

 Step to add user in a group

 sudo usermod -G Finance avegen 
 sudo usermod -G IT vaibhavg

 mkdir IT
 touch IT/confedential.txt

 setfacl -m u:avegen:rw- IT


 chmod u+rw /home/test 
 chmod g+rwx /home/test
 chmod o+x /home/test

-------------------------------------------------------------------------------------

CRONTAB

used to do the work on daily basis without manual interference

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed

0 12 * * * /usr/bin/sh ~/backup.sh  # this command will only at 12:00 pm everyday
*/1 11 * * sun touch divya.txt   #  this command will run after every minute

-------------------------------------------------------------------------------------

TAR

What is zip used for?
And : to compress files, folder and toprovide secutity to that file.


1. Bunzip   -- bz2  (j) 
2. Gunzip   -- gz  (z)
3. xz -- xz  (J)
-------------------------------------------------------------------------------------
Process to create tar

tar -cvf swapnil.tar swapnil.txt # --- create
tar -xvf swapnil.tar # -- extract
-------------------------------------------------------------------------------------
Process to create bunzip

tar -cjvf swapnil.tar.bz2 swapnil.tar # --- create
tar -xjvf swapnil.tar.bz2 -C /Desktop # -- extract
-------------------------------------------------------------------------------------
Process to create Gunzip

tar -czvf swapnil.tar.gz swapnil.tar # --- create
tar -xjvf swapnil.tar.gz -C /Desktop # -- extract
-------------------------------------------------------------------------------------
Process to create xz

tar -czvf swapnil.tar.gz swapnil.tar # --- create
tar -xjvf swapnil.tar.gz -C /Desktop # -- extract

-------------------------------------------------------------------------------------
Process to create zip with multiple files

tar -cvf test.tar amol.txt chetan.txt vaibhav.txt  
-------------------------------------------------------------------------------------
Process to install software/Applications

Redhat/Centos : 

yum install {application_name}
yum remove {application_name}

ubuntu : 
apt install {application_name}
apt remove {application_name}

fedora: 
dnf install {application_name}
dnf remove {application_name}



















