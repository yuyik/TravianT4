<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       manual.php                                                  ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

include("GameEngine/Database/connection.php");
include("GameEngine/config.php");
?>

<html>
	<head>
	<title><?php echo SERVER_NAME; ?></title>
        <link REL="shortcut icon" HREF="favicon.ico"/>
	<meta name="content-language" content="en" />
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="mt-core.js?0faaa" type="text/javascript"></script>
	<script src="mt-more.js?0faaa" type="text/javascript"></script>
	<script src="unx.js?0faaa" type="text/javascript"></script>
	<script src="new.js?0faaa" type="text/javascript"></script>
 	<link href="gpack/travian_Travian_4.0_41/lang/ir/compact.css?asd423" rel="stylesheet" type="text/css" />
	<!--    TODO - We need a lang pack for en, only one there is ir -->
 	<!-- <link href="<?php echo GP_LOCATE; ?>lang/en/compact.css?f4b7c" rel="stylesheet" type="text/css" /> 
	<link href="<?php echo GP_LOCATE; ?>lang/en/lang.css?f4b7c" rel="stylesheet" type="text/css" />
	<link href="<?php echo GP_LOCATE; ?>travian.css?f4b7c" rel="stylesheet" type="text/css" />
	<link href="<?php echo GP_LOCATE; ?>lang/en/lang.css" rel="stylesheet" type="text/css" />	-->
	<style>
		p{width: 450px;word-wrap:break-word;padding-left:10px;}
		table{width:48%;padding:15px;word-wrap:break-word;}
		div{width: 450px;word-wrap:break-word;padding-left:10px;}
	</style>
</head>

<body style="background-color:white;">
<?php

if (!ctype_digit($_GET['s'])) {
	$_GET['s'] = "0";
}
if (!ctype_digit($_GET['typ'])) {
	$_GET['typ'] = null;
}
if(!isset($_GET['typ']) && !isset($_GET['s'])) {
	include("Templates/Manual/00.tpl");
}
else if (!isset($_GET['typ']) && $_GET['s'] == 1) {
	include("Templates/Manual/00.tpl");
}
else if (!isset($_GET['typ']) && $_GET['s'] == 2) {
	include("Templates/Manual/direct.tpl");
}
else if (isset($_GET['typ']) && $_GET['typ'] == 5 && $_GET['s'] == 3) {
	include("Templates/Manual/medal.tpl");
}
else {
	if(isset($_GET['gid'])) {
		include("Templates/Manual/".$_GET['typ'].($_GET['gid']).".tpl");
	}
	else {
		if($_GET['typ'] == 4 && $_GET['s'] == 0) {
			$_GET['s'] = 1;
		}
	include("Templates/Manual/".$_GET['typ'].$_GET['s'].".tpl");
	}
}
?>
</body>

</html>
