#!/bin/bash

set `pwd`
#path=/media/vaibhavg/Backup/REPOS/StudyMaterial/scripts-learned/
read -p "Please provide the file name that you want to create: " filename
touch $1/$filename\.sh
chmod -R 777 $1/$filename\.sh
echo '#!/bin/bash' > $1/$filename\.sh
echo '#Created date : ' `date +"%Y-%m-%d %r"` >> $1/$filename\.sh
echo '#Modified date : ' >> $1/$filename\.sh
echo '#Author: Vaibhav Gadhave' >> $1/$filename\.sh
echo -e '#Start \n\n#End' >> $1/$filename\.sh 
sleep 1 
vim $1/$filename\.sh

