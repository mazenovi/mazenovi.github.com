---
layout: page
title: Don't reinvent the wheel! 
tagline: <i class="fa fa-cogs"></i> Use the broken wheels others made!
---
{% include JB/setup %}

<div class="row-fluid post-full">
	<div class="span8">
		<h2 class="fa fa-envelope"> Last posts</h2>
		<ul class="posts">
	  	{% for post in site.posts %}
    		<li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  		{% endfor %}
		</ul>
	</div>
	
	<div class="span4">
		<img src="{{ ASSET_PATH }}twitter/img/punk.png" />
		<ul id="social">
			<li><span class='symbol'>circleaboutme</span><a href="http://vincent.mazenod.fr">cv</a></li>
			<li><span class='symbol'>circleaboutme</span><a href="http://vincent.mazenod.fr/oim.rdf#VM">foaf</a></li>
			<li><span class='symbol'>circlewordpress</span><a href="http://blog.mazenod.fr">blog</a></li>
			<li><span class='symbol'>circlegithubalt</span><a href="http://github.com/mazenovi">github</a></li>
			<li><span class='symbol'>circletwitterbird</span><a href="http://twitter.com/mazenovi">twitter</a></li>
			<li><span class='symbol'>circledelicious</span><a href="http://delicious.com/mazenovi">delicious</a></li>
			<li><span class='symbol'>circletumblr</span><a href="http://veillessi.tumblr.com/">tumblr</a></li>
			<li><span class='symbol'>circlefacebook</span><a href="http://facebook.com/mazenovi">facebook</a></li>
			<li><span class='symbol'>circlepinterest</span><a href="http://www.pinterest.com/mazenovi/">pinterest</a></li>
			<li><span class='symbol'>circlegoogleplus</span><a href="https://plus.google.com/114935681540162614560/posts">google+</a></li>
			<li><span class='symbol'>circleidentica</span><a href="http://identi.ca/mazenovi/all">identi.ca</a></li>
			<li><span class='symbol'>circlefriendsfeed</span><a href="http://friendfeed.com/mazenovi">friendfeed</a></li>
			<li><span class='symbol'>circleaboutme</span><a href="http://www.viadeo.com/fr/profile/vincent.mazenod">viadeo</a></li>	
			<li><span class='symbol'>circlelinkedin</span><a href="http://www.linkedin.com/in/mazenovi">linkedin</a></li>
			<li><span class='symbol'>circlesoundcloud</span><a href="http://soundcloud.com/mazenovi">soundcloud</a></li>						
			<li><span class='symbol'>circleaboutme</span><a href="http://symfonians.net/person/mazenovi">symfonians</a></li>
			<li><span class='symbol'>circleaboutme</span><a href="http://flavors.me/mazenovi">flavors.me</a></li>			
			<li><span class='symbol'>circleslideshare</span><a href="http://slideshare.net/mazenovi">slideshare</a></li>
			<li><span class='symbol'>circlescribd</span><a href="http://www.scribd.com/mazenovi">scribd</a></li>
			<!-- li><span class='symbol'>circleaboutme</span><a href="http://www.udapro.fr/pg/profile/mazenovi">UdAPro</a></li>
			<li><span class='symbol'>circlestackoverflow</span><a href="http://stackoverflow.com/users/1649359/mazenovi">stackoverflow</a></li>
			<li><span class='symbol'>circlemsn</span><a href="">msn</a></li>
			<li><span class='symbol'>circleflickr</span><a href="">flickr</a></li>
			<li><span class='symbol'>circlefoursquare</span><a href="">foursquare</a></li>
			<li><span class='symbol'>circleamazon</span><a href="">amazon</a></li>
			<li><span class='symbol'>circleemail</span><a href="">email</a></li>
			<li><span class='symbol'>circlequora</span><a href="">quora</a></li>
			<li><span class='symbol'>circleyoutube</span><a href="">youtube</a></li>
			<li><span class='symbol'>circleyahoo</span><a href="">yahoo</a></li -->
		</ul>
  	</div>

</div>
