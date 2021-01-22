#!/bin/bash

## Educational bash script to install discord on linux
## Checking the dependent packages if it's installed or not and installing discord with required packages
## kh4xi@pm.me / twitter.com/kh4xi


# progress bar function for wget
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

##downloading discord package and renaming to a specific name
sudo wget --progress=bar:force https://dl.discordapp.net/apps/linux/0.0.13/discord-0.0.13.deb -O discord_installer.deb 2>&1 | pcount

echo "Checking for required package" \

##gdebi required package check if not exist then install
REQUIRED_PKG="gdebi"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get --yes install $REQUIRED_PKG 
fi

echo "Installing Discord Please say y when it's asked"
sudo gdebi discord_installer.deb


echo "Cleaning Installing File"
sudo rm -rf discord_installer.deb

echo "Running Discord"
sudo discord --no-sandbox