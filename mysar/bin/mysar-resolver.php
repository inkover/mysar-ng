#!/usr/bin/php
<?php
# Program: mysar, File: bin/mysar-maintenance.php
# Copyright 2004-2006, Stoilis Giannis <giannis@stoilis.gr>
#
# This file is part of mysar.
#
# mysar is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as published by
# the Free Software Foundation.
#
# mysar is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Foobar; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


# record start time, to stop execution if time is exceeded...
$startTime=time();
$yesterdayTimestamp=$startTime-86400;

// calculate the base path of the program
$basePath=realpath(dirname(__FILE__).'/../');

$DEBUG_MODE='cmd';
$DEBUG_LEVEL='30';

// Common tasks for both web and cmd
require($basePath.'/inc/common.inc.php');

debug('Checking whether resolving is enabled...',40,__FILE__,__LINE__);
$resolveClients=getConfigValue('resolveClients');
if($resolveClients!='enabled') {
	debug('Resolving is NOT enabled. Exiting...',30,__FILE__,__LINE__);
	exit(0);
}
debug('Resolving is enabled.',40,__FILE__,__LINE__);

error_reporting(E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED);

debug('Start timestamp is '.$startTime,40,__FILE__,__LINE__);
debug('Configuration:'.print_r($iniConfig,TRUE),40,__FILE__,__LINE__);

$maxRunTime=55;

$query='SELECT ';
$query.='id';
$query.=',';
$query.='INET6_NTOA(UNHEX(ip)) AS ip';
$query.=' FROM ';
$query.=' hostnames ';
$query.=' WHERE ';
$query.="isResolved='0'";
$query.=' ORDER BY id ASC';

$result=db_select($query);
while($row=db_fetch_array($result)) {
	$timestampNow=time();
	debug('Now timestamp is: '.$timestampNow.'. Script start was at: '.$startTime,40,__FILE__,__LINE__);
	debug('Checking if run time exceeded '.$maxRunTime.' seconds...',40,__FILE__,__LINE__);
	if(($timestampNow-$startTime ) > $maxRunTime) {
		debug('YES',40);
		debug('Exceeded run time',30,__FILE__,__LINE__);
		my_exit(0);
	}
	debug('NO',40);

	$hostname=gethostbyaddr($row['ip']);
	$query='UPDATE ';
	$query.='hostnames';
	$query.=' SET ';
	$query.="hostname='".$hostname."'";
	$query.=',';
	$query.="isResolved='1'";
	$query.=' WHERE ';
	$query.="id='".$row['id']."'";
	db_update($query,1);
	debug('.',30);
}
	
debug('Updating last resolver timestamp...',40,__FILE__,__LINE__);
$query="UPDATE config SET value='".time()."' WHERE name='lastResolve'";
db_update($query);
echo "\n";
?>
