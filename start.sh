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
export LD_LIBRARY_PATH=/usr/local/cpffmpeg/lib:/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/cpffmpeg/lib:/usr/lib:/usr/local/lib:$LIBRARY_PATH
export CPATH=/usr/local/cpffmpeg/include:/usr/include/:usr/local/include:$CPATH
php -i |grep -i php.ini
echo ""
echo ""
echo -n "Enter the full path to php.ini (see above ) : "
read PHP_INI
if [ -e  "$PHP_INI" ]; then
        echo "Your php.ini is $PHP_INI :)"
else
        echo "Invalid php.ini :( "
        exit
fi
if [ -e "$PHP_INI.ffmpeg" ]; then
        echo " "
else
        cp -f $PHP_INI $PHP_INI.ffmpeg
fi
if [ -e "$PHP_INI.ffmpeg" ];then
        sed -ie 's/extension_dir/;extension_dir/g' $PHP_INI.ffmpeg
        sed -ie 's/\[PHP\]/ /g' $PHP_INI.ffmpeg
        sed -ie 's/upload_max_filesize/;upload_max_filesize/g ' $PHP_INI.ffmpeg
        sed -ie 's/post_max_size/;post_max_size/g' $PHP_INI.ffmpeg
fi
#presetup
sh presetup.sh

if [ -e "/etc/yum.conf" ];then
        echo "Ensuring required RPM ........"
        yum install gcc gcc-c++ libgcc gd gd-devel gettext freetype \
        freetype-devel ImageMagick ImageMagick-devel libjpeg* libjpeg-devel* \
        libpng* libpng-devel* libstdc++* libstdc++-devel* libtiff* \
        libtiff-devel* libtool* libungif* libungif-deve* libxml* libxml2* \
        libxml2-devel* zlib* zlib-devel* automake* autoconf* samba-common* \
	ncurses-devel ncurses patch make -y
else
        echo "		There is no Yum configured in this server .... starting normal operation"
	echo "		The installation may broke because of this. If it is a standard distribution "
	echo " 		Please install the respective yum. Then restart the installation"
	echo -n "Press ctrl+c to abort the installation, press Enter  to continue ......"
	read key2
fi





#libwmf
sh libwmf.sh
#ruby
sh ruby.sh
#flvtool
sh flvtool.sh
#lame
sh lame.sh
#codecs
sh codecs.sh
#libogg
sh libogg.sh
#libvorbis
sh libvorbis.sh
#vorbistools
sh vorbistools.sh
#libtheora
sh libtheora.sh
#amrnb
sh amrnb.sh
#amrwb
sh amrwb.sh
#liba52
sh liba52.sh
#facc
sh facc.sh
#faad2
sh faad2.sh
#yasm
sh yasm.sh
#nasm
sh nasm.sh
#xvid
sh xvid.sh
#x264
sh x264.sh
#re2c
sh re2c.sh
#Mplayer
sh mplayer.sh
if [ -e "/usr/local/cpffmpeg/bin/mplayer" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   Mplayer installation Failed :( , please visit the forum"$RESET
        echo " "
        echo " "
        exit
fi

#ffmpeg
sh ffmpeg.sh
if [ -e "/usr/local/cpffmpeg/bin/ffmpeg" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   FFMPEG installation Failed :( , please visit the forum"$RESET
        echo " "
        echo " "
        exit
fi


#Rebuilding Mplayer
sh mplayer.sh
if [ -e "/usr/local/cpffmpeg/bin/mplayer" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   Mplayer installation Failed :( , please visit the forum"$RESET
        echo " "
        echo " "
        exit
fi

#ffmpeg-php
sh ffmpeg-php.sh 
if [ -e "$PHP_INI.ffmpeg" ];then
	export EXTENSION_DIR=$(grep  EXTENSION_DIR  $INSTALL_SDIR/ffmpeg-php-0.5.0/Makefile|grep php|awk '{print $3}')
        echo '[PHP]' > $PHP_INI
        echo " " >> $PHP_INI
	echo "extension_dir = \"$EXTENSION_DIR\" " >> $PHP_INI
        echo "post_max_size = 200M " >> $PHP_INI
        echo "upload_max_filesize = 200M " >> $PHP_INI
        echo "extension=ffmpeg.so" >>$PHP_INI
        echo " " >> $PHP_INI
        cat $PHP_INI.ffmpeg >> $PHP_INI

fi
#post
sh post.sh



