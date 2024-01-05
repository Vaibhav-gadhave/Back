#!/bin/bash

path=/media/vaibhavg/Backup/REPOS/StudyMaterial/scripts-learned/
read -p "Please provide the file name that you want to create: " filename
touch $path/$filename\.sh
chmod -R 777 $path/$filename\.sh
echo '#!/bin/bash' > $path/$filename\.sh
echo '#Created date : ' `date +"%Y-%m-%d %r"` >> $path/$filename\.sh
echo '#Modified date : ' >> $path/$filename\.sh
echo '#Author: Vaibhav Gadhave' >> $path/$filename\.sh
echo -e '#Start \n\n#End' >> $path/$filename\.sh 
sleep 1 
vim $path/$filename\.sh

