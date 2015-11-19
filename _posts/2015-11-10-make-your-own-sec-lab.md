---
layout: post
category : blog
tagline: "DIY!"
tags : [sec, vm, www]
---

{% include JB/setup %}

Imagine that you want to seriously understand how to exploit server's weakness.
You'd better to train on one of your server.
Better you can do it using virtual machines: you will be able to replay attacks again and again whitout worrying about server's damage.
Virtual machines are usefull to host weak servers, but they are usefull too to host offensive OS such as Kali Linux for the most well known.

There's a lot of tutorials explaining how to build a set of machines to test some offensive scenari, this one aims to explain how to:

* set a correct and usefull offensive OS in few commands
* have multiple ready to use weak servers
* play attacks between offensive OS and weak servers (with an internet connection or in an off line way)

# Virtualization application

Here we have two (free) leaders:
[VirtualBox](https://www.virtualbox.org/) & [VMware Workstation Player](https://my.vmware.com/fr/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0) many of disribution we we'll use are available in a ready to use way in one or other version. But some, as [metasploitable](http://sourceforge.net/projects/metasploitable/), are WMPlayer only ... So I would suggest to install both. We we'll see how to get working all together anyway, and how to use some usefull network bridges automatically created by WMPlayer. 

## VirtualBox

I suggest you download last version for your OS from the [official website](https://www.virtualbox.org/wiki/Downloads).

For debian / Mint / Unbuntu you should install it with something like

{% highlight bash %}

sudo dpkg -i ~/Téléchargements/virtualbox-4.3_*.deb

{% endhighlight %}

To avoid installation of guest OSs I recommend taking pre-installed VMs from [OSboxes](http://www.osboxes.org/).

## Kali

For Kali [OSboxes provides Kali pre-installed VMs](http://www.osboxes.org/kali-linux/), but I recommand ["Offensive Security"'s Kali VMs](https://www.offensive-security.com/kali-linux-vmware-arm-image-download/). Choose Kali version / vm can be a matter of taste: following commands are related to [OSboxes _Kali 1.1 32 VM_](http://www.osboxes.org/kali-linux/) installation and I will comment on benefits to follow the [Offensive Security VMs](https://www.offensive-security.com/kali-linux-vmware-arm-image-download/) way.

_Be aware that you have access to WMware version too ;)_

Unzip downloaded archive

{% highlight bash %}

7za e ~/Téléchargements/Kali_Linux_1.1.0-32bit.7z

{% endhighlight %}


* [Offensive Security VMs](https://www.offensive-security.com/kali-linux-vmware-arm-image-download/) are packaged 
    * as a unique .ova file for Kali 2/0
        * import file via Virtual Box, start your VM: you're done
    * as a set of vdmk files for Kali 1.1
* [OSboxes Kali VMs](http://www.osboxes.org/kali-linux/) vm are pacakaged 
    * as a unique vdi files for all Kali versions        

Here we have vdi from [OSboxes](http://www.osboxes.org/kali-linux/) but you can follow next steps for the vdmk files from [Offensive Security](https://www.offensive-security.com/kali-linux-vmware-arm-image-download/)

Open Oracle VM Virtual Box 

![Kali Step 1](/images/Kali-s-1.png "Kali Step 1")

set a new VM as follow

![Kali Step 2](/images/Kali-s-2.png "Kali Step 2")

Allocate some RAM

![Kali Step 3](/images/Kali-s-3.png "Kali Step 3")

move downloaded preinstalled VM files (one vdi or multiple files) in Virtual Box Vms folder

{% highlight bash %}

#
mv ~/Téléchargements/32bit/Kali Linux 1.1.0 (32bit).vdi ~/VirtualBox VMs/Kali/

{% endhighlight %}

browse to moved vdi file (or first vdmk file) and create vm

![Kali Step 4](/images/Kali-s-4.png "Kali Step 4")

Now start your new Kali VM. 

If start up fails with a Guru mediation (Ohh Amiga 500 I remember you) activate the "PAE" option in the "System" > "Processor" section of your VM

![Kali Step PAE](/images/Kali-pae.png "Kali PAE")

* username : root
* password : osboxes.org 
* (be aware that you are in qwerty mode ;)

__note that if you use Security Offensive WM you will login with__

* username : root
* password : toor

### 3 usefull tweaks

#### choose your keyboard

"Applications" > "System Tools" > "Preferences" > "System" > "Region and Language" > "Layout tab"

- "+" to add 
- type "fran" to see french, select it, click add

![alt text](/images/Kali-k-1.png "Kali Step 4")

- now click a up to make french the default layout

![alt text](/images/Kali-k-2.png "Kali Step 4")

Now you can switch language a top right in task bar

Warning you will be in qwerty mode at startup and at login screen. If you want to change your default keyboard follow this [link](https://wiki.debian.org/Keyboard)

#### change root password

{% highlight bash %}

passwd

{% endhighlight %}

#### install Guest additions

features

- Better video support
- Shared clipboard
- Shared folder
-  ...

__note that if you use Security Offensive VM you can directly install VirtualBox Guest Additions, your system is already ready__

For [OSboxes Kali VMs](http://www.osboxes.org/kali-linux/) add to /etc/apt/sources.list

{% highlight bash %}

deb http://http.kali.org/kali kali-current main non-free contrib
deb-src http://http.kali.org/kali kali-current main non-free contrib

{% endhighlight %}

{% highlight bash %}

apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
reboot
apt-get install linux-headers-$(uname -r)

{% endhighlight %}

mount VirtualBox Guest Additions drive from VirtualBox menu

{% highlight bash %}

cp /media/cdrom/VBoxLinuxAdditions.run /root/Desktop/
cd /root/Desktop/
chmod 755 VBoxLinuxAdditions.run
./VBoxLinuxAdditions.run

{% endhighlight %}

## VMPlayer

[download last version](https://my.vmware.com/fr/web/vmware/free)

N.B. if you are runnning a 32 bits system you will have to use 6.0 version but it works however


{% highlight bash %}

sudo chmod 755 VMware-Player-6.0.6-2700073.i386.bundle
sudo ./VMware-Player-6.0.6-2700073.i386.bundle

{% endhighlight %}

Let's now download [OWASP Broken Web Applications Project](https://www.owasp.org/index.php/OWASP_Broken_Web_Applications_Project#tab=Main) as example

* move unzip file in ~/.vmware/OWASP_BWA
* "File" > "Open a virtual Machine" and browse to .vmx file


## Finally configure network

__NAT__ is a cool solution if you use your personal LAN but if you are in more secured environment with DHCP bail, it may be usefull to not have to register all virtual MAC Address with a local IP, &lt;troll&gt;especially if ur network admin is an asshole&lt;/troll&gt;

__Host-Only__ networking can be usefull to create a private local network, but the main problem with this solution is that your vm will not have access to the Internet ...

Installing both VMPlayer create two virtual usefull network __vmnet1__ and __vmnet8__
in network Section of your vm > "select Bridged mode" > and "vmnet8"

![Network configuration](/images/pentestlab-conf-vm.png "Network configuration")

launch your Kali via VirtualBox and Your OWASP BWA via VMPlayer 

## What about weak servers

You can install this ubuntu server to have a heartbleed vulnerable nginx

* [http://ubuntu-release.locaweb.com.br/12.04/](http://ubuntu-release.locaweb.com.br/12.04/)

Or this old wheezy to play with this [local root exploit](http://www.tux-planet.fr/local-root-exploit-pour-les-noyaux-linux-2-6-37-a-3-8-10/)

* [Debian 7.0.0 – amd64 – netinst](http://www.debiantutorials.com/download-debian-iso/)

You can install some vulnerable apps to play with 

* [DVWA](http://www.dvwa.co.uk/)
* [mutillidae](http://sourceforge.net/projects/mutillidae/)

## Enjoy your SecLab

You can now ping each other vm and each vm can access the Internet 

You can now start by mapping your network from Kali by a nice

{% highlight bash %}

nmap -sV -O -PN 172.16.76.0/24

{% endhighlight %}

* -sV detects service versions
* -O detects OS versions
* -PN tells it not to PING first, just check for the open ports


Marvelous isn't it?