<?php  

if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
} 
$varmedal = $database->getProfileMedalAlly($aid); 
$allianceinfo = $database->getAlliance($aid);
$memberlist = $database->getAllMember($aid);
$totalpop = 0;
foreach($memberlist as $member) {
	$totalpop += $database->getVSumField($member['id'],"pop");
}

echo "<h1>Alliance - ".$allianceinfo['tag']."</h1>";
include("alli_menu.tpl");  
  
?>
<h4 class="round">Description</h4>
<form method="post" action="allianz.php">
<input type="hidden" name="a" value="3">
<input type="hidden" name="o" value="3">
<input type="hidden" name="s" value="5">
		<textarea class="editDescription editDescription1" tabindex="1" name="be1"><?php echo $allianceinfo['desc']; ?></textarea>
		<textarea class="editDescription editDescription2" tabindex="2" name="be2"><?php echo $allianceinfo['notice']; ?></textarea>
		<div class="clear"></div>
    <script type="text/javascript">
	window.addEvent('domready', function()
	{
		if ($('switchMedals'))
		{
			$('switchMedals').addEvent('click', function(e)
			{
				Travian.toggleSwitch($('medals'), $('switchMedals'));
			});
		}
	});


</script>
				<div class="switchWrap">
			<div class="openedClosedSwitch switchClosed" id="switchMedals">Medals</div>
			<div class="clear"></div>
		</div>
<br />
        <table cellpadding="1" cellspacing="1" id="medals" class="hide">
				<tr>
					<td>Category</td>
					<td>Rank</td>
					<td>Week</td>
					<td>(BB) Code </td>
				</tr>
                <?php
/******************************
INDELING CATEGORIEEN:
===============================
== 1. Attackers top 10      ==
== 2. Defenders top 10      ==
== 3. Climbers top 10       ==
== 4. Raiders top 10        ==
== 5. Attack and Defence    ==
== 6. in top 3 - Attackers  ==
== 7. in top 3 - Defenders  ==
== 8. in top 3 - Climbers   ==
== 9. in top 3 - Raiders    ==
******************************/                
                
                
    foreach($varmedal as $medal) {
    $titel="Medal";
    switch ($medal['categorie']) {
    case "1":
        $titel="Top 10 Attackers of the Week";
        break;
    case "2":
        $titel="Top 10 Defenders of the Week";
        break;
    case "3":
        $titel="Top 10 Climbers of the Week";
        break;
    case "4":
        $titel="Top 10 Raiders of the Week";
        break;
    case "5":
        $titel="Top 10 Raiders and Defenders of the Week";
        break;
    case "6":
        $titel="بین 3 مهاجمین اول با ".$medal['points']." امتیاز";
        break;
    case "7":
        $titel="بین 3 مدافعین اول با ".$medal['points']." امتیاز";
        break;
    case "8":
        $titel="بین 3 پیشرفت کننده اول با ".$medal['points']." امتیاز";
        break;
    case "9":
        $titel="بین 3 غارتگر اول با ".$medal['points']." منابع";
        break;
    case "10":
        $titel="پیشرفت کننده هفته";
        break;
    case "11":
        $titel="بین 3 پیشرفت کننده اول با ".$medal['points']." امتیاز";
        break;
    case "12":
        $titel="بین 3 مهاجمین اول با ".$medal['points']." امتیاز";
        break;
    }            
                 echo"<tr>
                   <td> ".$titel."</td>
                   <td>".$medal['plaats']."</td>
                   <td>".$medal['week']."</td>
                   <td>[#".$medal['id']."]</td>
                  </tr>";
                 } ?>
                 </table></p>

	<p class="btn">
		<button type="submit" value="ذخیره" name="s1" id="btn_save" tabindex="3"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Save</div></div></button>
		</p>
	</form>

<p class="error"><?php echo $form->getError("error"); ?></p>