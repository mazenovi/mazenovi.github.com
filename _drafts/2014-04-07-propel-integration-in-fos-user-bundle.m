---
layout: post
category : dev
tagline: "extend FosUser class without pain"
tags : [propel, symfony2]
---

{% include JB/setup %}

I read so often propel integration with symfony 2 is a "pain in the ass", I'd to say it's wrong. I work for two years with Symfony2 Propel 1.6 and symfony2admingenerator and everything is pretty stable and fun espicially since VichUploader has been made Propel compliant by @Kphoen (see layter for more details).
There's convenient solution for lots of Propel so if you like Propel ORM design you have no reason to not use it in your symfony2 projects.
For me there's is only two main reccurent problems
* fos_user integration
* dealing with symfony container

## fos_user integration

When you use fos_user with Propel eveything goes fine since you want to extend user model. For what I understand you desing a myUser model exented from fosUser model, BUT myUserQuery Class return fosUser model rather than myUser model ... Here I discover GlorpenBundle which fix this issue with some lines in your config.yml, nothing more ...