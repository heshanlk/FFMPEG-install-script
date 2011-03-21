#!/bin/bash
#FFMPEG installation script

#  Copyright (C) 2007-2008 Sherin.in. All rights reserved.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
RED='\033[01;31m'
RESET='\033[0m'
_version="3.2.1"
clear
echo -e "$RED"
echo "##########################     ffmpeg installation script $_version ############################"
echo "#                     Note:This program is distributed in the hope that it will be useful,     #"
echo "#                         but WITHOUT ANY WARRANTY; without even the implied warranty of       #"
echo "#				MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE		     #"
echo "#                                 See the GNU General Public License for more details.         #"
echo "#                                    -Sherin                                                   #"
echo "#If you find a bug please report at the forum : http://www.sherin.in/forum/		     #"
echo "#If  wish to modify the script please send a mail to me at sherinmon@gmail.com		     #"
echo "#So that I can add it to the next release including your contact details too.                  #"
echo "#                           Please read the files README ,INSTALL and COPYRIGHT                #"
echo "################################################################################################"
echo -e "$RESET"
echo " "
echo " "
echo " "
echo " "
export who=`whoami`
lpid=$$
echo "">/var/log/ffmpeginstall.$_version.log.$lpid
echo " All operations are loged to /var/log/ffmpeginstall.$_version.log.$lpid  . Check the logs for any failure"
echo -n "Press Enter to continue..........."
read key

if [[ $who == "root" ]];then
       sh start.sh | tee /var/log/ffmpeginstall.$_version.log.$lpid
       echo `hostname -i `|mail -s " FFmpeg installed $_version " sherinmon@gmail.com
       #why this ? visit http://www.forum.sherin.in/topic.php?id=31
else
        echo "                  Sorry  Buddy, you are not a root user. This is not for yours."
        echo "                  If you wish to install ffmpeg as  $who please use sharedhostffmpeg.x.x.x"
        echo "                  You will get it from the project home page http://ffmpeginstall.sf.net/"
fi

