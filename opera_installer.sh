#!/bin/bash

#twitter.com/kh4xi | github.com/kh4xi
#Fixing ffmpeg codecs for opera
#Fixing video playback errors
#Fixing chromium


echo '''
  
  ____                       
 / __ \                      
| |  | |_ __   ___ _ __ __ _ 
| |  | | '_ \ / _ \ '__/ _` |
| |__| | |_) |  __/ | | (_| |
 \____/| .__/ \___|_|  \__,_|
       | |                   
       |_|                   
       

'''

echo "Cleaning old opera and codec files"
sudo dpkg -r opera-stable
sudo rm -f /etc/apt/sources.list.d/opera-stable.list
sudo apt-get remove chromium-codecs-ffmpeg-extra

echo "Creating Temp Dir for installation"

#temp dir for downloading files
cd ~/Downloads
mkdir opera_fixer
cd opera_fixer

#progressbar function

progressbar ()
{
    local flag=false c count cr=$'\r' nl=$'\n'
    while IFS='' read -d '' -rn 1 c
    do
        if $flag
        then
            printf '%s' "$c"
        else
            if [[ $c != $cr && $c != $nl ]]
            then
                count=0
            else
                ((count++))
                if ((count > 1))
                then
                    flag=true
                fi
            fi
        fi
    done
}

#Downloading necessary files
echo "Downloading browser and codec Files"
sudo wget --progress=bar:force https://download3.operacdn.com/pub/opera/desktop/73.0.3856.344/linux/opera-stable_73.0.3856.344_amd64.deb -O opera_installer.deb 2>&1 | progressbar
sudo wget --progress=bar:force http://launchpadlibrarian.net/507640811/chromium-codecs-ffmpeg-extra_87.0.4280.66-0ubuntu0.16.04.1_amd64.deb -O codec_installer.deb 2>&1 | progressbar


echo "Installing Requirements"
sudo dpkg --install opera_installer.deb
sudo dpkg --install codec_installer.deb
sudo apt-get install -f
sudo apt-mark hold chromium-codecs-ffmpeg-extra

echo "Cleaning temp dir"
cd ../
sudo rm -rf opera_fixer