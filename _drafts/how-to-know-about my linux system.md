---
layout: post
category : blog
tagline: "DIY!"
tags : [sec, unix, www]
---

{% include JB/setup %}

sometimes we have to answer this question
* a server we don't use to admin
* an old machine 
* an unknown machine ;)

You can access 4 information types with

## system information (including processor type and host name)

{% highlight bash %}

uname -a 

{% endhighlight %}

## Kernel information are available with 

{% highlight bash %}

cat /etc/*-release

{% endhighlight %}

or

{% highlight bash %}

cat /proc/version 

{% endhighlight %}

## distribution information

{% highlight bash %}

lsb_release -a

{% endhighlight %}

## "comercial" or "human name" information

{% highlight bash %}

cat /etc/issue

{% endhighlight %}

Another good question would be what about CPU?

{% highlight bash %}

grep flags /proc/cpuinfo

{% endhighlight %}

or

{% highlight bash %}

$ grep -o -w 'lm' /proc/cpuinfo | sort -u 

{% endhighlight %}


CPU modes are :

* lm flag means Long mode cpu - 64 bit CPU
* Real mode 16 bit CPU
* Protected Mode is 32-bit CPU