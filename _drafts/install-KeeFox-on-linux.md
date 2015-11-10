---
layout: post
category : blog
tagline: "DIY!"
tags : [sec, unix, www]
---

{% include JB/setup %}

ok there is offciial documentation and a nice askubuntu thread on this ... but I really suffer when installing this stuff

## Hurried? Here's the way to get it work: 

* first of all don't install keepass2 from debian repo 

* install mono (the whole ... yes I know)

sudo apt-get install mono-complete

* download [KeePass portable for windows](http://keepass.info/download.html) zip file and change directory to the location you just download this file

mkdir -p ~/KeePass/plugins
unzip KeePass-2*.zip -d ~/KeePass
sudo cp $HOME/.mozilla/firefox/*.default/extensions/keefox@chris.tomlinson/deps/KeePassRPC.plgx ~/KeePass/plugins/

* now be sure KeePass2 is closed and restart firefox

* click on the new icon KeeFox

* click on "launch KeePass"

* here you should see some progression windows
    * guess KeePass install the KeePassRPC plugin

* then you should see 2 windows 
    * one contain a password
    * other one asking for a password
* copy password in prompt and your done

## and what about keepass2 from debian repo

let's say you have already installed keepass from the repo

sudo apt-get install keepass2

your KeePass install is now locate in

/usr/lib/keepass2/

so you have to copy KeePassRPC.plgx

## KeePass configuration 

Interface > Close button [X] minimizes main window instead of terminating the application (checked)

Interface > Minimize to tray instead of taskbar

Integration > Single click instead of double click for default tray icon (we are not on windows checked)

## Sharing KeePass

