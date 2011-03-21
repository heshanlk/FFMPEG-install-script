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
INSTALL_SDIR='/usr/src/ffmpegscript'
SOURCE_URL='http://downloads.sherin.in/sources'
INSTALL_DDIR='/usr/local/cpffmpeg'
export cpu=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
export TMPDIR=$HOME/tmp
_package=' '
clear
sleep 2
echo -e $RED"Post installation Procedures  ....... started"$RESET
echo " ----------------------------------ffmpeg-php info--------------------------"
php -i |grep -i ffmpeg
echo -e $RED" Post installation Procedures ....... Completed"$RESET

echo " "
echo " "
echo " "
echo "				Don't forget to do the following "
echo " "
echo " "
echo "		1. Reboot webserver  "
echo "		2. Test the installation ( See http://www.sherin.in/forum/topic.php?id=46 )  "
echo " 		3. If you support this, Make a donation in http://www.sherin.in/ffmpeg/  :-D  "
echo " 		4. Write your success stories and testimonials here http://www.sherin.in/forum/forum.php?id=23"
echo " "
echo " "
echo " "

