#!/bin/bash
if (("$EUID" != 0))
then
#	cdate=`date +"%Y%m%d"`
#	mv $HOME/.java $HOME/.java_$cdate 2> /dev/null
	 rm -rf $HOME/.java*
	 rm -rf $HOME/.mozilla*
	 rm -rf $HOME/.local*
	cp -Rv /aslan/projects/For_Bakup/IT/sangam/Java_6/. $HOME
        # echo "Hi ", $USER,  $HOME
fi

# sh /aslan/projects/Flow/comres/system_maintenance/pref_update.sh
# gconftool-2 -t str -s /desktop/gnome/background/picture_filename /aslan/projects/Anibrain_Logo/LiveWallpaper.jpg
