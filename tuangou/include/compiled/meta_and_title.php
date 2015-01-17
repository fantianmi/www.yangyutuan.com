<?php if(!$pagetitle||$request_uri=='index'){?>
	<title><?php echo $INI['system']['sitename']; ?> - <?php echo $INI['system']['sitetitle']; ?>|<?php echo $city['name']; ?>购物|<?php echo $city['name']; ?>团购|<?php echo $city['name']; ?>打折</title>
<?php } else { ?>
	<title><?php echo $pagetitle; ?> | <?php echo $INI['system']['sitename']; ?> - <?php echo $INI['system']['sitetitle']; ?> |<?php echo $city['name']; ?>购物|<?php echo $city['name']; ?>团购|<?php echo $city['name']; ?>打折<?php echo $INI['system']['subtitle']; ?></title>
<?php }?>

<?php if($seo_description){?>
	<meta name="description" content="<?php echo $seo_description; ?>" />
<?php } else if($team) { ?>
	<meta name="description" content="<?php echo mb_strimwidth(strip_tags($team['title'] .', '. $team['summary'] .', '. $team['systemreview']), 0, 320); ?>" />
<?php } else { ?>
	<meta name="description" content="<?php echo $INI['system']['description']; ?>" />
<?php }?>
<?php if($seo_keyword){?>
	<meta name="keywords" content="<?php echo $seo_keyword; ?>，<?php echo $city['name']; ?>购物，<?php echo $city['name']; ?>团购" />
<?php } else { ?>
	<meta name="keywords" content="<?php echo $INI['system']['keywords']; ?>" />
<?php }?>