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
_package='MPlayer-1.0rc1.tar.bz2'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET

cd $INSTALL_SDIR/
rm -rf MPlayer*
wget $SOURCE_URL/$_package
tar -xvjf $_package
cd MPlayer-1.0rc1/
./configure --prefix=$INSTALL_DDIR  --with-codecsdir=$INSTALL_DDIR/lib/codecs/  \
	--with-extraincdir=$INSTALL_DDIR/include --with-extralibdir=$INSTALL_DDIR/lib 

make -j$cpu
make install
cp -f etc/codecs.conf $INSTALL_DDIR/etc/mplayer/codecs.conf
ln -sf /usr/local/cpffmpeg/bin/mplayer /usr/local/bin/mplayer
ln -sf /usr/local/cpffmpeg/bin/mplayer /usr/bin/mplayer
ln -sf /usr/local/cpffmpeg/bin/mencoder /usr/bin/mencoder
ln -sf /usr/local/cpffmpeg/bin/mencoder /usr/local/bin/mencoder

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
