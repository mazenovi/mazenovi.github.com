---
layout: post
category : dev
tagline: "How to deal with container"
tags : [propel, symfony2]
---

{% include JB/setup %}

Sometimes you want to access some parameters or some services from your model, there's 3 ways to resolve this problem

* Design pattern approach : accesssing the container from the model layer is not a good idea. If you do this some kitten will be killed, your wife will go away, you'll lose your job, and you finally will be activly researched by FBI. So before reading the next two points. please think about if your model MUST access the container or not

* Caterpillar approach: install GlorpenBundle and implement ContainerAwareInterface and you'll have the whole container in your model

* Less Worst Practice approach : install PropelEventDispatcher and use the event dispatcher and some nice listener (where you can inject every services you want, even the whole container if you want). Note that you can have the same event programming approach with GlorpenPropelBundle as soon as it adds a some other event hooks ...

As you may have understood I like the last approach cause you can achieve what you're trying to do (I hate when people try to convince me that what I'm trying to do is unusefull) but you have to separate things between your listeners and your models. Most of times it willl produce not so ugly solutions.
What I was disliking in this solution is the configuration service part. For each model I had to manually tag the service ... even if some models share the same listeners.
Here I suggest you to focus on Kphoen's code in the VichUploader's Propel part. He uses a compiler pass to tag propel event listener at container compilation.
Here is the magic:

Note some important points:
* that model to tag are imported from config file
* Annotations don't work with Propel you have to create a yaml file
* All Models configured with VichUploader should have the event_dispatcher event
* Event dispatcher should be loaded after bundles required it

That's cool but as a lazy geek it's a bit complicated and ugly for me:
* All Models configured with VichUploader should have the event_dispatcher event ... I repeat myself
* I find the event_dispatcher behavior meaningless in my shcema.xml
* event_dispatcher will be shared by all bundles required id 
* getter and setter image method shoud be manually written in model classes

What I would like : add a filable behavior with a filefield parameter and that's all. Here is a proposition of such an implementation