#!/bin/bash

#Solution for No module named gtk
#/usr/local/bin
#/usr/lib/python2.7
#/usr/lib/python2.7/plat-x86_64-linux-gnu
#/usr/lib/python2.7/lib-tk
#/usr/lib/python2.7/lib-old
#/usr/lib/python2.7/lib-dynload
#/usr/local/lib/python2.7/dist-packages
#/usr/lib/python2.7/dist-packages


echo """ 


 ______          ______ _               
|___  /         |  ____(_)              
   / / ___ _ __ | |__   ___  _____ _ __ 
  / / / _ \ '_ \|  __| | \ \/ / _ \ '__|
 / /_|  __/ | | | |    | |>  <  __/ |   
/_____\___|_| |_|_|    |_/_/\_\___|_|   
                                        
         twitter.com/kh4xi 
     Solution for No module named gtk

                                        """
echo "Please Uninstall the zenmap for clean install"
sudo apt remove zenmap
cd ~/Downloads
mkdir zenfixinstall
cd zenfixinstall

pcount ()
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

## package and renaming to a specific name
sudo wget --progress=bar:force https://nmap.org/dist/zenmap-7.91-1.noarch.rpm -O zenmap_installer.rpm 2>&1 | pcount
sudo wget --progress=bar:force http://archive.ubuntu.com/ubuntu/pool/universe/p/pygtk/python-gtk2_2.24.0-5.1ubuntu2_amd64.deb -O python-gtk2.deb 2>&1 | pcount
sudo wget --progress=bar:force http://azure.archive.ubuntu.com/ubuntu/pool/universe/p/pygobject-2/python-gobject-2_2.28.6-14ubuntu1_amd64.deb -O python-gobject.deb 2>&1 | pcount
sudo wget --progress=bar:force http://security.ubuntu.com/ubuntu/pool/universe/p/pycairo/python-cairo_1.16.2-2ubuntu2_amd64.deb -O python-cairo.deb 2>&1 | pcount
echo "Checking for required package" 

####

echo "Installing Requirements"
sudo dpkg -i python-gtk2.deb
sudo dpkg -i python-gobject.deb
sudo dpkg -i python-cairo.deb

##alien is required package check if not exist then install

REQUIRED_PKG="alien"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get --yes install $REQUIRED_PKG 
fi

echo "Preparing the deb file"

sudo alien zenmap_installer.rpm

echo "Installing Deb file"

#if the installation link changes // I'll update
sudo dpkg -i zenmap_7.91-2_all.deb

cd ../

echo "Cleaning Files"
sudo rm -rf zenfixinstall

