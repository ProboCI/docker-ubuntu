#!/usr/bin/php
<?php

$php_information = explode("\n", `php --version`);
$apache_information = explode("\n", `apache2 -v`);
$linux_information = explode("\n", `lsb_release -a`);
$linux_distribution = str_replace('Description:', '', $linux_information[1]);
// ----------------------------------------------------------------------------
$php_version = $php_information[0];
$apache_version = $apache_information[0];
$chrome_version = `google-chrome --version`;
$chromedriver_version = `chromedriver --version`;
$mysql_version = `mysql --version`;
$linux_kernel = `uname -r`;
$linux_distribution = trim($linux_distribution);
$solr_version = `/opt/solr/bin/solr version`;
$composer_version = `composer --version`;
$drush_version = `drush --version`;
$node_version = `node --version`;
$wp_cli_version = `wp --version --allow-root`;
$acli_version = `acli --version`;
$terminus_version = `terminus --version`;
// $bee_version = `bee version`;

print "\n\n";
print "\e[1;33m------------------------------------------\n";
print "Probo.CI - Software Versions Report:\n";
print "Ubuntu Linux Distribution - v18.04\n";
print "------------------------------------------\e[0m\n";
print $php_version . "\n";
print "Web " . $apache_version . "\n";
print $chrome_version;
print $chromedriver_version;
print $mysql_version;
print "Kernel: " . $linux_kernel;
print $linux_distribution . "\n";
print "SOLR: " . $solr_version;
print $composer_version;
print $drush_version;
print "Node: " . $node_version;
print "WordPress CLI: " . $wp_cli_version;
print "Pantheon " . $terminus_version;
print "Acquia CLI: " . $acli_version;
// print $bee_version;
print "\n\n";
