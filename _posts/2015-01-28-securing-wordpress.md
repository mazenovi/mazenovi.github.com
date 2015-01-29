---
layout: post
category : blog
tagline: "butcher a colander!"
tags : [sec, wp]
---

{% include JB/setup %}

<h1>Who hosted WordPress Blogs and never has been p0wned?</h1>
<h2>Liar!</h2>

Since WordPress 3.7 minor updates are automatically pushed ... great!

But what about Major updates, plugins and themes updates?
Here are the few lines I use to add to the <strong>theme's functions.php file</strong> (rather than in wp-config.php as suggested <a href="http://codex.wordpress.org/Configuring_Automatic_Background_Updates">here</a>, cause it did'nt work)

{% highlight php %}
// enable automatic plugins update
add_filter( 'auto_update_plugin', '__return_true' );
// enable automatic themes update
add_filter( 'auto_update_theme', '__return_true' );
// enable automatic translations update
add_filter( 'auto_update_translation', '__return_true' );
// enable automatic minor core update
add_filter( 'allow_minor_auto_core_updates', '__return_true' );
// enable automatic major core update
add_filter( 'allow_major_auto_core_updates', '__return_true' );
//add_filter( 'automatic_updates_is_vcs_checkout', '__return_false', 1 );
{% endhighlight %}

To avoid problems you to have clean themes and do regular backup

<strong>N.B</strong> : It will not work with child themes

To secure a little bit more in <strong>wp-config.php</strong> I check

{% highlight php %}
// admin access is https only as metioned
define('FORCE_SSL_ADMIN', true);
// php files are not editable online
define('DISALLOW_FILE_EDIT', true);
{% endhighlight %}

Finally I add in <strong>.htaccess</strong> file, outside <tt># BEGIN WordPress</tt> and  <tt># END WordPress,</tt> the following lines

{% highlight bash %}
# Protect wp-content directory -- php modules should not be directly accessed                                                                    
RewriteCond %{REQUEST_FILENAME} wp-content/.+\.(php|txt|pl)$ [NC]
# Cookies for Comments uses a PHP formatted CSS file
RewriteCond %{REQUEST_FILENAME} !cookies-for-comments/css\.php$ [NC]
RewriteRule .* - [F,NS,L]
 
# Protect wp-includes directory - don't allow access to php files
RewriteCond %{REQUEST_FILENAME} wp-includes/.+\.php$ [NC]
# Allow the multi-site uploaded files handling
RewriteCond %{REQUEST_FILENAME} !wp-includes/ms-files\.php$ [NC]
# js/tinymce has some php modules, following rule allows them
RewriteCond %{REQUEST_FILENAME} !wp-includes/js/tinymce/.+ [NC]
RewriteRule .* - [F,NS,L]
{% endhighlight %}

still in .htaccess, avoid driect access to wp-config.php as suggested <a href="http://codex.wordpress.org/Hardening_WordPress#Securing_wp-">here</a>

{% highlight bash %}
<files wp-config.php>
order allow,deny
deny from all
</files>
{% endhighlight %}

It's better to
<ul>
    <li>remove all useless plugins</li>
    <li>d'ont user any plugin that execute PHP code or require access to configuration files</li>
    <li>do frequent backup</li>
</ul>
Here are the few suggestions I applied, you should read the entire document <a href="http://codex.wordpress.org/Hardening_WordPress">here</a>

3 ways to explore
<ul>
    <li><a href="http://www.ossec.net/">http://www.ossec.net/</a> an intrusion detection system</li>
    <li><a href="https://www.modsecurity.org/">https://www.modsecurity.org/</a> detect and avoid malicious requests (be carefull)</li>
    <li>&lt;troll&gt;stop using wordpress&lt;/troll&gt;</li>
</ul>
&nbsp;