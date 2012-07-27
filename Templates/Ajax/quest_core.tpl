<?php

include("GameEngine/Village.php");

$uArray = $database->getUserArray($_SESSION['username'],0);

if($message->unread && !$message->nunread) { $messagelol = "i2"; }
else if(!$message->unread && $message->nunread) { $messagelol = "i3"; }
else if($message->unread && $message->nunread) { $messagelol = "i1"; }
else { $messagelol = "i4"; }

if (isset($qact)){
 switch($qact) {
	case 'enter':
	$database->updateUserField($_SESSION['username'],'quest','1',0);
	$_SESSION['qst']= 1;
	break;
	
	case 'skip':
	$database->updateUserField($_SESSION['username'],'quest','23',0);
	$_SESSION['qst']= 23;
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=25;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	$skiped=true;
	break;

	case '2':
	$database->updateUserField($_SESSION['username'],'quest','2',0);		
	$_SESSION['qst']= 2;	
	break;
	$database->FinishWoodcutter($session->villages[0]);	
	break;

	case '3':
	$database->updateUserField($_SESSION['username'],'quest','3',0);
	$_SESSION['qst']= 3;
    $today = date("mdHi");
	mysql_query("UPDATE ".TB_PREFIX."users set plus = ('".mktime(date("H"),date("i"), date("s"),date("m") , date("d"), date("Y"))."')+3600*24 where `id`='".$session->uid."'") or die(mysql_error());
	break;

	case '4':
	$database->updateUserField($_SESSION['username'],'quest','4',0);
	$_SESSION['qst']= 4;
	
	//Give Reward
	$database->modifyResource($session->villages[0],130,160,130,100,1);		
	break;
	
	case '5':
    $database->updateUserField($_SESSION['username'],'quest','5',0);
	$_SESSION['qst']= 5;
    
	$rSubmited=$qact2;
    //Give Reward
	$database->modifyResource($session->villages[0],80,110,60,40,1);
	break;
	
	case '6':
	$database->updateUserField($_SESSION['username'],'quest','6',0);
	$_SESSION['qst']= 6;
	//Give Reward
	$database->modifyResource($session->villages[0],80,110,60,40,1);	
	
	break;

	case '7':
	$database->updateUserField($_SESSION['username'],'quest','7',0);
	$_SESSION['qst']= 7;
	$Subject="Message From The Taskmaster";
	$Message="You are to be informed that a nice reward is waiting for you at the taskmaster.<br /><br />Hint: The message has been generated automatically. An answer is not necessary.";
	$database->sendMessage($session->userinfo['id'],0,$Subject,$Message,0);
	$RB=true;
		
	//Give Reward
	$database->modifyResource($session->villages[0],150,160,130,130,1);	
	break;
	
	case '8':
	$database->updateUserField($_SESSION['username'],'quest','8',0);
	$_SESSION['qst']= 8;
		
	//Give Reward
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=20;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	break;
	
	case '9':
	$database->updateUserField($_SESSION['username'],'quest','9',0);
	$_SESSION['qst']= 9;	
		
	//Give Reward
	$database->modifyUnit($session->villages[0],100,120,40,40,1);
	break;
    
    case 'coor':
	$x=$qact2;
	break;
	
	case '10':
	$database->updateUserField($_SESSION['username'],'quest','10',0);
	$_SESSION['qst']= 10;
	
	//Give Reward
	$database->modifyResource($session->villages[0],60,30,40,90,1);	
	break;
	
	case '11':
	$database->updateUserField($_SESSION['username'],'quest','11',0);
	$_SESSION['qst']= 11;
		
	//Give Reward
	$database->modifyResource($session->villages[0],75,120,30,50,1);	
	break;
	
	case '12':
	$database->updateUserField($_SESSION['username'],'quest','12',0);
	$_SESSION['qst']= 12;
			
	//Give Reward
	$database->modifyResource($session->villages[0],120,200,140,100,1);
	break;
	
	case '13':
	$database->updateUserField($_SESSION['username'],'quest','13',0);
	$_SESSION['qst']= 13;
			
	//Give Reward
	$database->modifyResource($session->villages[0],150,180,30,130,1);
	break;
    
    case '14':
	$database->updateUserField($_SESSION['username'],'quest','14',0);
	$_SESSION['qst']= 14;
			
	//Give Reward
	$database->modifyResource($session->villages[0],60,50,40,30,1);
	break;
	
	case 'lumber':
	$lSubmited=$qact2;
	break;
	
	case '15':
	$database->updateUserField($_SESSION['username'],'quest','15',0);
	$_SESSION['qst']= 15;
			
	//Give Reward
	$database->modifyResource($session->villages[0],50,30,60,20,1);
	break;
	
	case '16':
	$database->updateUserField($_SESSION['username'],'quest','16',0);
	$_SESSION['qst']= 16;
	
	//Give Reward
	$database->modifyResource($session->villages[0],75,75,40,40,1);
	break;
    
    case 'rank':
	$rSubmited=$qact2;
	break;
	
	case '17':
	$database->updateUserField($_SESSION['username'],'quest','17',0);
	$_SESSION['qst']= 17;
	
	//Give Reward
	$database->modifyResource($session->villages[0],100,90,100,60,1);
	break;
	
	case '18':
	$database->updateUserField($_SESSION['username'],'quest','18',0);
	$_SESSION['qst']= 18;
	break;

	case '19':
	$database->updateUserField($_SESSION['username'],'quest','19',0);
	$_SESSION['qst']= 19;
    
    //Give Reward
	$database->modifyResource($session->villages[0],70,100,90,100,1);
	break;
	
	case '20':
	$database->updateUserField($_SESSION['username'],'quest','20',0);
	$_SESSION['qst']= 20;
	break;
	
	case '21':
	$database->updateUserField($_SESSION['username'],'quest','21',0);
	$_SESSION['qst']= 21;
    
    //Give Reward
    $database->modifyResource($session->villages[0],80,90,60,40,1);
	break;
	
	case '22':
	$database->updateUserField($_SESSION['username'],'quest','22',0);
	$_SESSION['qst']= 22;
	
	//Give Reward
	$database->modifyResource($session->villages[0],70,120,90,50,1);
	break;
	
    case '23':
    $database->updateUserField($_SESSION['username'],'quest','23',0);
    $_SESSION['qst']= 23;
    
    //Give Reward
    $database->modifyResource($session->villages[0],1200,200,200,450,1);
    break;
    
    case '24':
    $database->updateUserField($_SESSION['username'],'quest','24',0);
    $_SESSION['qst']= 24;
    
    //Give Reward
    $database->modifyResource($session->villages[0],80,90,60,40,1);
    break;
    
	case '225':
	$_SESSION['qst']= 25;
	break;
    case '226':
	$_SESSION['qst']= 26;
	break;
    case '227':
	$_SESSION['qst']= 27;
	break;
    case '228':
	$_SESSION['qst']= 28;
	break;
    case '229':
	$_SESSION['qst']= 29;
	break;
    case '330':
	$_SESSION['qst']= 30;
	break;
    case '331':
	$_SESSION['qst']= 31;
	break;
    case '332':
	$_SESSION['qst']= 32;
	break;
    case '333':
	$_SESSION['qst']= 33;
	break;
    case '334':
	$_SESSION['qst']= 34;
	break;
    case '335':
	$_SESSION['qst']= 35;
	break;
    
	case '25':
	$database->updateUserField($_SESSION['username'],'fquest','25',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=15;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	break;
    
    case '26':
	$database->updateUserField($_SESSION['username'],'fquest','26',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],140,200,180,200,1);
	break;
    
    case '27':
	$database->updateUserField($_SESSION['username'],'fquest','27',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],200,120,180,80,1);
	break;
    
    case '28':
	$database->updateUserField($_SESSION['username'],'fquest','28',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],240,280,180,100,1);
	break;
    
    case '29':
	$database->updateUserField($_SESSION['username'],'fquest','29',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],600,750,600,300,1);
	break;
    
    case '30':
	$database->updateUserField($_SESSION['username'],'fquest','30',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],900,850,600,300,1);
	break;
    
    case '31':
	$database->updateUserField($_SESSION['username'],'fquest','31',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1800,2000,1650,800,1);
	break;
    
    case '32':
	$database->updateUserField($_SESSION['username'],'fquest','32',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1600,1800,1950,1200,1);
	break;
    
    case '33':
	$database->updateUserField($_SESSION['username'],'fquest','33',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],3400,2800,3600,2200,1);
	break;
    
    case '34':
	$database->updateUserField($_SESSION['username'],'fquest','34',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1050,800,900,750,1);
	break;
    
    case '35':
	$database->updateUserField($_SESSION['username'],'fquest','35',0);
    $database->updateUserField($_SESSION['username'],'quest','25',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1600,2000,1800,1300,1);
	break;
    
    
}

}

header("Content-Type: application/json;");

      if($_SESSION['qst']== 0){
      if($session->userinfo['tribe'] == 1) {
                $tribes = "Romans";
                }
                else if($session->userinfo['tribe'] == 2) {
                $tribes = "Teutons";
                }
                else if($session->userinfo['tribe'] == 3) {
                $tribes = "Gauls";
                }
	  ?>

{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Welcome to <?php echo SERVER_NAME; ?>!<\/h1><br \/><i>&rdquo;As I see you have been made senator of this little village. I will be your counselor for the first few days and never leave your (left) side.&rdquo;<\/i><br \/><br \/><span id=\"qst_accpt\"><a class=\"qle\" href=\"javascript: qst_next('','enter'); \">To the first task.<\/a><a class=\"qri\" href=\"javascript: qst_fhandle();\">Look\u00a0around\u00a0on\u00a0your\u00a0own.<\/a><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/><br \/><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"intro\"><\/div>\n\t\t","number":null,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":1}

<?php } elseif($_SESSION['qst']== 1){

//Check one of Woodcutters is level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$woodL=$tRes['f1']+$tRes['f3']+$tRes['f14']+$tRes['f17'];
	//check if you are building a woodcutter to level 1
	foreach($building->buildArray as $jobs) {
			if($jobs['type']==1){
				$woodL="99";
			}	
      	}
if ($woodL<1){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 1: Woodcutter<\/h1><br \/><i>&rdquo;There are four green forests around your village. Construct a woodcutter on one of them. Lumber is an important resource for our new settlement.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Construct a woodcutter.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"wood\"><\/div>\n\t\t","number":"-1","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 1: Woodcutter<\/h1><br \/><i>&rdquo;Yes, that way you gain more lumber.I helped a bit and completed the order instantly.&rdquo;<\/i><br \/><br \/><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/><div class=\"rew\"><p class=\"ta_aw\">Your reward:<\/p>Woodcutter instantly completed.<br \/><\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','2');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"wood\"><\/div>\n\t\t","number":"-1","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php }?>

<?php } elseif($_SESSION['qst']== 2){ 

//Check one of Croplands is level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$cropL=$tRes['f2']+$tRes['f8']+$tRes['f9']+$tRes['f12']+$tRes['f13']+$tRes['f15'];
	//check if you are building a cropland to level 1
	foreach($building->buildArray as $jobs) {
			if($jobs['type']==4){
				$cropL="99";
			}	
      	}
if ($cropL<1){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 2: Crop<\/h1><br \/><i>&rdquo;Now your subjects are hungry from working all day. Extend a cropland to improve your subjects' supply. Come back here once the building is complete.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Extend one cropland.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"farm\"><\/div>\n\t\t","number":"-2","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 2: Crop<\/h1><br \/><i>&rdquo;Very good. Now your subjects have enough to eat again...&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p>1 day Travian <b><span class=\"plus_g\">P</span><span class=\"plus_o\">l</span><span class=\"plus_g\">u</span><span class=\"plus_o\">s</span></b><\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','3');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"farm\"><\/div>\n\t\t","number":2,"reward":{"plus":1},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php }?>

<?php } elseif($_SESSION['qst']== 3){ 

$vName=$village->vname;
if ($vName==$session->userinfo['username']."'s village"){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/>Task 3: Your Village's Name<\/h1><br \/><i>&rdquo;Creative as you are you can grant your village the ultimate name.\r\n<br \/><br \/>\r\nClick on 'profile' in the left hand menu and then select 'change profile'...&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Change your village's name to something nice.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"village_name\"><\/div>\n\t\t","number":"-3","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/>Task 3: Your Village's Name<\/h1><br \/><i>&rdquo;Wow, a great name for their village. It could have been the name of my village!...&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>60&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>20&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','4');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"village_name\"><\/div>\n\t\t","number":3,"reward":{"wood":30,"clay":60,"iron":30,"crop":20},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php }?>

<?php } elseif($_SESSION['qst']== 4){ 

$rallypoint = $building->getTypeLevel(16);
	foreach($building->buildArray as $jobs) {
			if($jobs['type']==16){
				$rallypoint += 1;
			}	
      	}
if ($rallypoint == 0){
?>
{"markup":"\n\t\<div id=\"popup3\"><div id=\"qstd\"><h4>Task 4: Rally Point<\/h4><div class=\"spoken\">&rdquo;In your surroundings, there are many mysterious places for you to explore. To prepare for these adventures, you need a rally point. <br> The rally point must be built on a specific building site in your village centre. The <a href=\"build.php?id=39\">building site<\/a> itself is curved.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Build the rally point.<\/div><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rally\"><\/div>\n\t\t","number":"-4","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}

<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 4: Rally Point<\/h4><div class=\"spoken\">&rdquo;Your rally point has been erected! A good move towards world domination!&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p>Rally Point instantly completed.<\/div><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','5');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rally\"><\/div>\n\t\t","number":4,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}

<?php }?>

<?php } elseif($_SESSION['qst']== 5){

// Compare real player rank with submited rank
$temp['uid']=$session->userinfo['id'];
//$ranking->procRankReq($temp);
$displayarray = $database->getUserArray($temp['uid'],1);
//$rRes = $ranking->searchRank($displayarray['username'],"username");
if ($rRes!=$rSubmited){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 5: Másik játékos<\/h4><div class=\"spoken\">&rdquo;A Travianban rengeteg játékossal játszol együtt. Kattints a felső menü "Statisztikák" menüpontjára, keresd meg a helyezésedet és írd be ide:”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Keresd ki a rangodat a statisztikában és írd be ide.<\/div><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" \/><button type=\"button\" value=\"Task completion\" onclick=\"qst_next('','5',document.getElementById('qst_val').value)\">Taskt befejezni<\/button><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"rank1\"><\/div>\n\t\t","number":5,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}

<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 5: Másik játékos<\/h4><div class=\"spoken\">&rdquo;Pontosan! Ez a rangod.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">80<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">110<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">60<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img/x.gif\" alt=\"Búza\">40<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','6');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rank1\"><\/div>\n\t\t","number":5,"reward":{"wood":80,"clay":110,"iron":60,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 6){ 

//Check one of Iron Mines and one of Clay Pites are level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=$tRes['f4']+$tRes['f7']+$tRes['f10']+$tRes['f11'];
$clayL=$tRes['f5']+$tRes['f6']+$tRes['f16']+$tRes['f18'];
if ($ironL<1 || $clayL<1){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 6: Two Building Orders<\/h4><div class=\"spoken\">&rdquo;Build an iron mine and a clay pit. Of iron and clay one can never have enough. Thanks to the Plus account I gave you a short while ago, you can give both orders right away&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><b>Order:<\/b><\/p><ul><li> Extend one iron mine.<\/li><li>Extend one clay pit.<\/li><\/ul><\/div><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"clay_iron\"><\/div>\n\t\t","number":-6,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 6: Two Building Orders<\/h4><div class=\"spoken\">&rdquo;Ahogyan gondolom már feltűnt, az épületek kicsit lassabban épülnek. A Travian valós idejű, tehát akkor is megy, amikor nem vagy bejelentkezve. Elegendő elindítani az építkezést majd elmenni pl. ebédelni, vacsorázni, meccset nézni, stb.. nem kell előtte ülve megvárni amíg készen nem lesz..:)<br><br>A legjobb ha időközönként benézel a lakosaidhoz és ha készen vannak, újabb Orderot adsz nekik.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"1Fa\">150<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">160<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">130<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img/x.gif\" alt=\"Búza\">130<\/span><\/div><br \/><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','7');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"clay_iron\"><\/div>\n\t\t","number":6,"reward":{"wood":150,"clay":160,"iron":130,"crop":130},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 7){ 

//Check message is viewed or no
if ($message->unread || $RB==true){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 7: Üzenetek<\/h4><div class=\"spoken\">&rdquo;Az üzenetküldő rendszer segítségével tudsz a szomszédaiddal kommunikálni. Máris kaptál egy üzenetet, nézd meg, majd gyere vissza utána!”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Olvasd el a legújabb üzenetedet<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"msg\"><\/div>\n\t\t","number":"-6","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"i2","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 7: Üzenetek<\/h4><div class=\"spoken\">&rdquo;Megkaptad, nagyon jó. Itt van egy kis arany. Ezzel pl. a <b>Plusz<\/b> -számládat feltöltheted, vagy a nyersanyagtermelésed növelheted. Kattints a bal oldali menüben a <b><font color=\"#71D000\">Travian Plusz<\/font><\/b> menüpontra.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"gold\"><img src=\"img\/x.gif\" class=\"gold\" title=\"Arany\"> 20<\/span><\/div><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','8');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"msg\"><\/div>\n\t\t","number":6,"reward":{"gold":20},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 8){

$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;

if($tRes['f1']>0){$woodL++;};
if($tRes['f3']>0){$woodL++;};
if($tRes['f14']>0){$woodL++;};
if($tRes['f17']>0){$woodL++;};
if($tRes['f5']>0){$clayL++;};
if($tRes['f6']>0){$clayL++;};
if($tRes['f16']>0){$clayL++;};
if($tRes['f18']>0){$clayL++;};
if($tRes['f4']>0){$ironL++;};
if($tRes['f7']>0){$ironL++;};
if($tRes['f10']>0){$ironL++;};
if($tRes['f11']>0){$ironL++;};
if($tRes['f2']>0){$cropL++;};
if($tRes['f8']>0){$cropL++;};
if($tRes['f9']>0){$cropL++;};
if($tRes['f12']>0){$cropL++;};
if($tRes['f13']>0){$cropL++;};
if($tRes['f15']>0){$cropL++;};

if ($ironL<2 || $clayL<2 || $woodL<2 || $cropL<2){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 8: Egyre!<\/h4><div class=\"spoken\">&rdquo;A Travian világában mindig van mit tenni! Amíg a seregedre vársz, építs ki egy további favágót, egy agyagbányát, egy vasércbányát és egy búzamezőt a 1. szintre.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs ki minden nyersanyagtermelő típusból egyet-egyet első szintre.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"res_one_of_each\"><\/div>\n\t\t","number":-8,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 8: Egyre!<\/h4><div class=\"spoken\">&rdquo;Nagyon jó, a nyersanyagtermelésed remekül alakul.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">100<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img/x.gif\" alt=\"Búza\">40<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','9');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"res_one_of_each\"><\/div>\n\t\t","number":8,"reward":{"wood":100,"clay":120,"iron":40,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 9){

$getvID = $database->getVillageID($session->uid);
$coor = $database->getCoor($getvID);

if ($x!=$coor[y]){

?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 9: Szomszédok!<\/h4><div class=\"spoken\">&rdquo;A szomszédaidat a térképen találod meg. Valamelyikük falujának neve: <b><?php echo $village->vname; ?><\/b> A szomszédod nevét úgy tudhatod meg, ha az egérkurzort a térkép felett mozgatod, illetve egy falu fölé viszed. Írd be ide az <b><?php echo $village->vname; ?><\/b> nevű falu kordinátáját.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Keresd ki a  <b><?php echo $village->vname; ?><\/b>  falu kordinátáit és írd be ide.<\/div><div class=\"coordinatesInput\"><div class=\"xCoord\"><label for=\"xCoordInputQuest\">X:<\/label><input maxlength=\"4\" value=\"\" id=\"qst_val\" name=\"x\" id=\"xCoordInputQuest\" class=\"text coordinates x \"><\/div><div class=\"yCoord\"><label for=\"yCoordInputQuest\">Y:<\/label><input maxlength=\"4\" value=\"\" name=\"y\" id=\"yCoordInputQuest\" class=\"text coordinates y \"><\/div><div class=\"clear\"><\/div><\/div><button type=\"button\" value=\"Taskt befejezni\" class=\"coordinatesButton\" onclick=\"qst_next('','coor',document.getElementById('qst_val').value)\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">Taskt befejezni<\/div><\/div><\/button><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"neighbour\"><\/div>\n\t\t","number":-9,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 9: Szomszédok!<\/h4><div class=\"spoken\">&rdquo;Pontosan, ott van <b><?php echo $village->vname; ?><\/b> falu! Annyi nyersanyagot kapsz amennyit ez a falu ér. Na jó, majdnem annyit...””<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">60<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">30<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img/x.gif\" alt=\"Búza\">90<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','10');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"neighbour\"><\/div>\n\t\t","number":9,"reward":{"wood":60,"clay":30,"iron":40,"crop":90},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 10){

//Check additional of each resource upgraded to lvl1 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>0){$ironL++;};if($tRes['f7']>0){$ironL++;};if($tRes['f10']>0){$ironL++;};if($tRes['f11']>0){$ironL++;}
if($tRes['f5']>0){$clayL++;};if($tRes['f6']>0){$clayL++;};if($tRes['f16']>0){$clayL++;};if($tRes['f18']>0){$clayL++;}
if($tRes['f1']>0){$woodL++;};if($tRes['f3']>0){$woodL++;};if($tRes['f14']>0){$woodL++;};if($tRes['f17']>0){$woodL++;}
if($tRes['f2']>0){$cropL++;};if($tRes['f8']>0){$cropL++;};if($tRes['f9']>0){$cropL++;};if($tRes['f12']>0){$cropL++;};if($tRes['f13']>0){$cropL++;};if($tRes['f15']>0){$cropL++;}
if ($ironL<4 || $clayL<4 || $woodL<4 || $cropL<6){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 10: Minden az 1. szinten!<\/h4><div class=\"spoken\">&rdquo;Emelni kellene a nyersanyagtermelést. Építsd ki mindegyik nyersanyagtermelőt 1. szintre.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs fel minden nyersanyagtermelőt 1. szintre.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"res_all_one\"><\/div>\n\t\t","number":-12,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 10: Minden az 1. szinten!<\/h4><div class=\"spoken\">&rdquo;Nagyon jó, a nyersanyagtermelésed remekül alakul. <br><br>Hamarosan nekiláthatunk a faluban épületeket felhúzni.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">75<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">30<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img/x.gif\" alt=\"Búza\">50<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','11');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"res_all_one\"><\/div>\n\t\t","number":12,"reward":{"wood":75,"clay":120,"iron":30,"crop":50},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 11){ 

//Check player Descriptions for [#0]
$Dave= strrpos ($uArray['desc1'],'[#0]');
$Dave2=strrpos ($uArray['desc2'],'[#0]');
if (!is_numeric($Dave) and !is_numeric($Dave2)){?>
{"markup":"\n\t\t<div id=\"qstd\"><h4>Task 11: Békegalamb<\/h4><div class=\"spoken\">&rdquo;A regisztrálást követő néhány napban védett vagy a többi játékostól. A védelem pontos idejét úgy látod, ha a <b>[#0]<\/b> kódot beírod a profilodba.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Írd be a medál kódját: [#0] a profilodba.<\/div><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"medal\"><\/div>\n\t\t","number":"-11","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 11: Békegalamb<\/h4><div class=\"spoken\">&rdquo;Remek. Most már mindenki láthatja, hogy mekkora harcos érkezett a vidékre.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">120<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">140<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img/x.gif\" alt=\"Búza\">100<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','12');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"medal\"><\/div>\n\t\t","number":11,"reward":{"wood":120,"clay":200,"iron":140,"crop":100},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 12){

//Check cranny builded or no
$cranny = $building->getTypeLevel(23);
if ($cranny == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 12: Építs rejtekhelyet<\/h4><div class=\"spoken\">&rdquo;A Travian világa veszélyes. Építs fel egy rejtekhelyet, hogy a nyersanyagaid az ellenségeidtől elrejtsd.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs egy rejtekhelyet.</div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"cranny\"><\/div>\n\t\t","number":-12,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 12: Építs rejtekhelyet<\/h4><div class=\"spoken\">&rdquo;Szuper, a játékostársaidnak , akiknek a te nyersanyagaidra fáj a foguk így sokkal nehezebb dolguk lesz. <br><br>Egy esetleges támadás esetén a falu lakosai maguktól elviszik a rejtekhelyre a nyersanyagokat.. Ami befér persze..”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">150<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">180<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">30<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img/x.gif\" alt=\"Búza\">130<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','13');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"cranny\"><\/div>\n\t\t","number":12,"reward":{"wood":150,"clay":180,"iron":30,"crop":130},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 13){

//Check one of each resource is lvl2 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>1){$ironL++;};if($tRes['f7']>1){$ironL++;};if($tRes['f10']>1){$ironL++;};if($tRes['f11']>1){$ironL++;}
if($tRes['f5']>1){$clayL++;};if($tRes['f6']>1){$clayL++;};if($tRes['f16']>1){$clayL++;};if($tRes['f18']>1){$clayL++;}
if($tRes['f1']>1){$woodL++;};if($tRes['f3']>1){$woodL++;};if($tRes['f14']>1){$woodL++;};if($tRes['f17']>1){$woodL++;}
if($tRes['f2']>1){$cropL++;};if($tRes['f8']>1){$cropL++;};if($tRes['f9']>1){$cropL++;};if($tRes['f12']>1){$cropL++;};if($tRes['f13']>1){$cropL++;};if($tRes['f15']>1){$cropL++;}
if ($ironL<1 || $clayL<1 || $woodL<1 || $cropL<1){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 13: Kettőre!<\/h4><div class=\"spoken\">&rdquo;A Travian világában mindig van mit tenni! Építs ki egy favágót, egy agyagbányát, egy vasércbányát és egy búzamezőt a 2. szintre.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Épits minden nyersanyagtermelő típusból egyet-egyet 2. szintre.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"res_two_of_each\"><\/div>\n\t\t","number":"-13","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 13: Kettőre!<\/h4><div class=\"spoken\">&rdquo;Remek, a falud épül és szépül...”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">60<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">50<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img/x.gif\" alt=\"Búza\">30<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','14');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"res_two_of_each\"><\/div>\n\t\t","number":13,"reward":{"wood":60,"clay":50,"iron":40,"crop":30},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 14){ 

//Check player submited number Barracks cost lumber
if ($lSubmited!=210){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 14: Ismertető<\/h4><div class=\"spoken\">&rdquo;A játékon belüli leírásban benne van minden épület leírása. Nézz utána mennyi fára van szükség egy kaszárnya felépítéséhez.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Írd be mennyi fa kell egy kaszárnyához<\/div><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" onkeypress=\"if (event.keyCode==13) {qst_next('','lumber',document.getElementById('qst_val').value);}\"> <button type=\"button\" value=\"Taskt befejezni\" onclick=\"qst_next('','lumber',document.getElementById('qst_val').value)\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">Taskt befejezni<\/div><\/div><\/button><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"cost\"><\/div>\n\t\t","number":"-14","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 14: Ismertető<\/h4><div class=\"spoken\">&rdquo;Pontosan! Egy kaszárnya 210 fába kerül”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">50<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">30<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">60<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img/x.gif\" alt=\"Búza\">20<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','15');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"cost\"><\/div>\n\t\t","number":14,"reward":{"wood":50,"clay":30,"iron":60,"crop":20},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 15){

//Check main building lvl is 3 or upper
$mainbuilding = $building->getTypeLevel(15);
if ($mainbuilding<3){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 15: Főépület<\/h4><div class=\"spoken\">&rdquo;Az építőmestereid hatékonyabban tudnak dolgozni jobb infrastrukturális kiépítettség esetén. Különösen fontos ez pl. a piac vagy a kaszárnya építésekor. Építsd fel a főépületed 3. szintre.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építsd fel a főépületed 3. szintre.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"main\"><\/div>\n\t\t","number":-15,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 15: Főépület<\/h4><div class=\"spoken\">&rdquo;Buli van! Az építőmestereid megünnepelik ezen fontos építészeti mérföldkő elérését. A mesterek nem csak újabb típusú épületeket tudnak építeni, hanem az épületek gyorsabban is készülnek el.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">75<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">75<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img/x.gif\" alt=\"Búza\">40<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','16');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"main\"><\/div>\n\t\t","number":15,"reward":{"wood":75,"clay":75,"iron":40,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 16){

// Compare real player rank with submited rank
$temp['uid']=$session->userinfo['id'];
//$ranking->procRankReq($temp);
//$displayarray = $database->getUserArray($temp['uid'],1);
//$rRes=$ranking->searchRank($displayarray['username'],"username");
if ($rRes!=$rSubmited){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 16: Haladó!!<\/h4><div class=\"spoken\">&rdquo;Nézd meg a rangodat a játékos statisztikáknál és élvezd ki az előrehaladásod.”</div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Keresd meg a rangodat a statisztikáknál és írd be ide.<\/div><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" onkeypress=\"if (event.keyCode==13) {qst_next('','rank',document.getElementById('qst_val').value);}\"> <button type=\"button\" value=\"Taskt befejezni\" onclick=\"qst_next('','rank',document.getElementById('qst_val').value)\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">Taskt befejezni<\/div><\/div><\/button><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"rank2\"><\/div>\n\t\t","number":"-16","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 16: Haladó!<\/h4><div class=\"spoken\">&rdquo;Szuper! Pontosan ez a te rangod.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">100<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">90<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">100<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img/x.gif\" alt=\"Búza\">60<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','17');\">Continue with the next task<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rank2\"><\/div>\n\t\t","number":16,"reward":{"wood":100,"clay":90,"iron":100,"crop":60},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 17){

// Ask from plyer ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 17: Fegyverek vagy Pénz<\/h4><div class=\"spoken\">&rdquo;Most döntést kell hoznod: inkább békés kereskedelmet folytatnál avagy rettegett harcos szeretnél lenni. <br><br>A piachoz szükséged van egy magtárra, a katonákhoz kaszárnyára.”<\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><button type=\"button\" value=\"Gazdaság\" class=\"qb1 granary_barracks\" onclick=\"javascript: qst_next('','20');\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">Gazdaság<\/div><\/div><\/button><button type=\"button\" value=\"Katonaság\" class=\"qb2 granary_barracks\" onclick=\"javascript: qst_next('','18');\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">Katonaság<\/div><\/div><\/button><div class=\"clear\"><\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks\"><\/div>\n\t\t","number":"-17","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}

<?php } elseif($_SESSION['qst']== 18){

// Checking rollypoint builded or no
$barrack = $building->getTypeLevel(19);
if ($barrack==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 18: Kaszárnya<\/h4><div class=\"spoken\">&rdquo;Bátor döntés. <br><br><br> Van már tehát egy 3. szintű főépületed és egy gyülekezőtered. Most már megvan minden feltétel egy kaszárnya építéséhez. <br><br>A kaszárnyában tudsz kiképezni katonákat.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs kaszárnyát<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks2\"><\/div>\n\t\t","number":"-18","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 18: Kaszárnya<\/h4><div class=\"spoken\">&rdquo;ساخت سربازخانه تمام شد. حال یک قدم به تسخیر دنیای تراوین نزدیکتر شدی.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">70<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">100<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">90<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">100<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','19');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks2\"><\/div>\n\t\t","number":18,"reward":{"wood":70,"clay":100,"iron":90,"crop":100},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 19){

// Checking 2 warrior trained or no
$units = $village->unitall;
$unarray=array("","سرباز لژیون", "گرزدار","سرباز پیاده");
$unarray2=array("","u1", "u11","u21");
if ($units[$unarray2[$session->userinfo['tribe']]]<2){ ?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 19: Kiképzés!<\/h4><div class=\"spoken\">&rdquo;حال که تو سربازخانه داری قادر به تربیت لشکری می باشی. 2 عدد <?php echo $unarray[$session->userinfo['tribe']];?> تربیت کن.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>2 عدد <?php echo $unarray[$session->userinfo['tribe']];?> تربیت کن.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"units\"><\/div>\n\t\t","number":"-19","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 19: Kiképzés!<\/h4><div class=\"spoken\">&rdquo;حال تو در حال ساخت ارتش عظیمی می باشی.<br><br>قبل از اینکه نیورهای خود را برای غارت ارسال کنی ابتدا در <a href=\"warsim.php\">شبیه ساز جنگ<\/a> کنترل کن تا بدانی برای مبارزه با یک موش صحرایی نیاز به چه اندازه لشکری داری تا تلفاتی نداشته باشی.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">300<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">320<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">360<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">570<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','23');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"units\"><\/div>\n\t\t","number":19,"reward":{"wood":300,"clay":320,"iron":360,"crop":570},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 20){

// Checking granary builded or no
$granary = $building->getTypeLevel(11);
if ($granary ==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 20: Fegyverek vagy Pénz<\/h4><div class=\"spoken\">&rdquo;A gazdaság és kereskedelem mellett döntöttél. Arany életed lesz. Egészen biztos!”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs egy magtárat.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks1\"><\/div>\n\t\t","number":"-20","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 20: Fegyverek vagy Pénz<\/h4><div class=\"spoken\">&rdquo;Nagyon jó! A magtárban még több búzát tudsz tárolni.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">80<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">90<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">60<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">40<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','21');\">Continue with the next task<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks1\"><\/div>\n\t\t","number":20,"reward":{"wood":80,"clay":90,"iron":60,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']==21){

// Checking warehouse builded or no
$warehouse = $building->getTypeLevel(10);
if ($warehouse==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 21: Raktár<\/h4><div class=\"spoken\">&rdquo;Nem csak a búzát kell rendesen tárolni, a többi nyersanyag is tönkremegy, ha nem megfelelően tárolják. Építs egy raktárat!””<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs egy raktárat.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"warehouse\"><\/div>\n\t\t","number":"-21","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 21: Raktár<\/h4><div class=\"spoken\">&rdquo;Nagyon jó, a raktárad készen áll... <br><br>Minden feltétel megvan ahhoz, hogy egy piacot építhess.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">70<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">90<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">50<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','22');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"warehouse\"><\/div>\n\t\t","number":21,"reward":{"wood":70,"clay":120,"iron":90,"crop":50},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 22){

// Checking market builded or no
$market = $building->getTypeLevel(17);
if ($market==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 22: Piac<\/h4><div class=\"spoken\">&rdquo;Építs egy piacot, hogy a többi játékossal kereskedni tudj.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs piacot.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"market\"><\/div>\n\t\t","number":"-22","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 22: Piac<\/h4><div class=\"spoken\">&rdquo;A piacod készen áll, most már lehetőséged van a többi játékos számára terményeket megvételre felajánlani és persze te is tudsz az többiek ajánlatai között böngészni. Figyelj, ne hagyd magad átverni!”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">1200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">200<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">450<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','23');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"market\"><\/div>\n\t\t","number":22,"reward":{"wood":1200,"clay":200,"iron":200,"crop":450},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 23){

$unarray=array("","kőfalat", "földfalat","cölöpfalat");


$wall = $village->resarray['f40'];
if ($wall==0){?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 23: Építs egy <?php echo $unarray[$session->userinfo['tribe']];?><\/h4><div class=\"spoken\">&rdquo;Most, hogy már képeztél katonákat, javaslom, hogy építs egy <?php echo $unarray[$session->userinfo['tribe']];?> is. A <?php echo $unarray[$session->userinfo['tribe']];?> növeli az alapvédelmet és a katonák számára védelmi bónuszt ad.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs egy <?php echo $unarray[$session->userinfo['tribe']];?> .<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"wall<?php echo $session->userinfo['tribe'];?>\"><\/div>\n\t\t","number":"-23","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\<div id=\"popup3\"><div id=\"qstd\"><h4>Task 23: Építs egy <?php echo $unarray[$session->userinfo['tribe']];?><\/h4><div class=\"spoken\">&rdquo;Erről beszélek én. A <?php echo $unarray[$session->userinfo['tribe']];?> nagyon hasznos. A bent lévő egységek védő értékét növeli.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">80<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','24');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"wall<?php echo $session->userinfo['tribe'];?>\"><\/div>\n\t\t","number":23,"reward":{"wood":80,"clay":90,"iron":60,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } ?>

<?php

if ($database->getUserField($_SESSION['username'],'fquest','username')>=25){
$ff25 = "<div class=none><b>Minden a 2. szinten!<\/b><\/div>";
} else { $ff25 = "<a onclick=qst_next('','225')>Minden a 2. szinten!<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=26){
$ff26 = "<div class=none><b>Piac az 1 szintre.<\/b><\/div>";
} else { $ff26 = "<a onclick=qst_next('','226')>Piac az 1 szintre.<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=27){
$ff27 = "<div class=none><b>Követség<\/b><\/div>";
} else { $ff27 = "<a onclick=qst_next('','227')>Követség<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=28 && $database->getUserField($_SESSION['username'],'alliance','username')>0){
$ff28 = "<div class=none><b>Klán<\/b><\/div>";
} else { $ff28 = "<a onclick=qst_next('','228')>Klán<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=29){
$ff29 = "<div class=none><b>Főépület 5<\/b><\/div>";
} else { $ff29 = "<a onclick=qst_next('','229')>Főépület 5<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=30){
$ff30 = "<div class=none><b>Magtár 3<\/b><\/div>";
} else { $ff30 = "<a onclick=qst_next('','330')>Magtár 3<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=31){
$ff31 = "<div class=none><b>Raktár 7<\/b><\/div>";
} else { $ff31 = "<a onclick=qst_next('','331')>Raktár 7<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=32){
$ff32 = "<div class=none><b>Mindent ötödikre!<\/b><\/div>";
} else { $ff32 = "<a onclick=qst_next('','332')>Mindent ötödikre!<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=33){
$ff33 = "<div class=none><b>Palota vagy rezidencia<\/b><\/div>";
} else { $ff33 = "<a onclick=qst_next('','333')>Palota vagy rezidencia<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=34){
$ff34 = "<div class=none><b>3 telepes<\/b><\/div>";
} else { $ff34 = "<a onclick=qst_next('','334')>3 telepes<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=35){
$ff35 = "<div class=none><b>Új falu<\/b><\/div>";
} else { $ff35 = "<a onclick=qst_next('','335')>Új falu<\/a>"; }


if($_SESSION['qst']== 24){ ?>

{"markup":"\n\t\t<div id=\"popup3\"><div><h4>Ezt a sok mindent kell még elvégezni<\/h4><ul><input type=\"hidden\" id=\"qst_val\" value=\"\"><li><?php echo $ff25;?><\/li><li><?php echo $ff26;?><\/li><li><?php echo $ff27;?><\/li><li><?php echo $ff28;?><\/li><li><?php echo $ff29;?><\/li><li><?php echo $ff30;?><\/li><li><?php echo $ff31;?><\/li><li><?php echo $ff32;?><\/li><li><?php echo $ff33;?><\/li><li><?php echo $ff34;?><\/li><li><?php echo $ff35;?><\/li><\/ul><\/div><\/div>\n\t\t\n\t\t","number":"-24","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}


<?php } elseif($_SESSION['qst']== 25){

$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>1){$ironL++;};if($tRes['f7']>1){$ironL++;};if($tRes['f10']>1){$ironL++;};if($tRes['f11']>1){$ironL++;}
if($tRes['f5']>1){$clayL++;};if($tRes['f6']>1){$clayL++;};if($tRes['f16']>1){$clayL++;};if($tRes['f18']>1){$clayL++;}
if($tRes['f1']>1){$woodL++;};if($tRes['f3']>1){$woodL++;};if($tRes['f14']>1){$woodL++;};if($tRes['f17']>1){$woodL++;}
if($tRes['f2']>1){$cropL++;};if($tRes['f8']>1){$cropL++;};if($tRes['f9']>1){$cropL++;};if($tRes['f12']>1){$cropL++;};if($tRes['f13']>1){$cropL++;};if($tRes['f15']>1){$cropL++;}
if ($ironL<4 || $clayL<4 || $woodL<4 || $cropL<6){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Minden a 2. szinten!<\/h4><div class=\"spoken\">&rdquo;Ismételten eljött az idő, hogy tovább építsd a hatalom és gazdagság alapjait! Most már nem elég az 1. szint... Eltart ugyan egy darabig, de meglátod, megéri. Építs fel minden nyersanyagmezőt 2. szintre..”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs fel minden nyersanyagtermelőt 2. szintre.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources gold\" alt=\"سکۀ طلای تراوین\"><img alt=\"سکۀ طلای تراوین\" class=\"gold\" src=\"img/x.gif\">15<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_res_all_two\" id=\"qstbg\"><\/div>\n\t\t","number":"-25","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Minden a 2. szinten!<\/h4><div class=\"spoken\">&rdquo;عالی است! همۀ منابع به سطح 2 رسید...”<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources gold\" alt=\"سکۀ طلای تراوین\"><img alt=\"سکۀ طلای تراوین\" class=\"gold\" src=\"img/x.gif\">15<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><a href=\"javascript: qst_next('','25');\" class=\"qri arrow\">Befejezés<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_res_all_two\"><\/div>\n\t\t","number":25,"reward":{"gold":15},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 26){

$market = $building->getTypeLevel(17);
if ($market == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Piac az 1 szintre<\/h4><div class=\"spoken\">&rdquo;Itt az ideje, hogy a gazdaságodat felélénkítsd egy kicsit. Építsd fel a piacot első szintre.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>یک بازار بساز.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">140<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_market_barracks1\" id=\"qstbg\"><\/div>\n\t\t","number":"-26","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Piac az 1 szintre<\/h4><div class=\"spoken\">&rdquo;خوب است! حال اقتصاد دهکدۀ تو پیشرفت کرده است، از طریق بازار میتوانی با بازیکنان دیگر منابع مبادله کنی...”<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">140<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><a href=\"javascript: qst_next('','26');\" class=\"qri arrow\">Befejezés<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_market_barracks1\"><\/div>\n\t\t","number":26,"reward":{"wood":140,"clay":200,"iron":180,"crop":200},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 27){

$embassy = $building->getTypeLevel(18);
if ($embassy == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Követség<\/h4><div class=\"spoken\">&rdquo;A Travian világa veszélyes. Már építettél egy rejtekhelyet, amely megvédi nyersanyagaidat a fosztogatóktól. Egy klán még több védelmet tud nyújtani.<br>Építs követséget, hogy a klánok meghívóit elfogadni tudd.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs követséget.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">80<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_dispatch\" id=\"qstbg\"><\/div>\n\t\t","number":"-27","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Követség<\/h4><div class=\"spoken\">&rdquo;بسیار عالی! اکنون تو سفارت داری، به یک اتحادی برو و سعی کن عضو یک اتحاد بشوی...”<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">80<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><a href=\"javascript: qst_next('','27');\" class=\"qri arrow\">Befejezés<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_dispatch\"><\/div>\n\t\t","number":27,"reward":{"wood":200,"clay":120,"iron":180,"crop":80},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 28){

$aid = $session->alliance;
$allianceinfo = $database->getAlliance($aid);
if ($aid['alliance'] == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Klán<\/h4><div class=\"spoken\">&rdquo;Együttműködés fontos a Travian világában. Azon játékosok akik együttműködnek, klánokba szerveződnek<br>Szerezz be egy környékbeli klántól meghívót és lépj be a klánba.<br>A másik lehetőség, hogy te magad alapítasz klánt. A klánalapításhoz azonban szükség van 3. szintű követségre.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Lépj be egy klánba, vagy alapíts egy saját klánt.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">240<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">280<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">100<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_alliance\" id=\"qstbg\"><\/div>\n\t\t","number":"-28","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Klán<\/h4><div class=\"spoken\">&rdquo;خوب است! حالا تو در اتحادی به نام <b><?php echo $allianceinfo['tag']; ?><\/b> عضو هستی و میتوانی با کمک هم اتحادی های خود سریعتر پیشرفت کنی...”<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">240<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">280<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">100<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><a href=\"javascript: qst_next('','28');\" class=\"qri arrow\">Befejezés<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_alliance\"><\/div>\n\t\t","number":28,"reward":{"wood":240,"clay":280,"iron":180,"crop":100},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 29){

$mainbuilding = $building->getTypeLevel(15);
if ($mainbuilding < 5){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Főépület 5<\/h4><div class=\"spoken\">&rdquo;Egy palota vagy rezidencia építéséhez szükség van egy 5. szintű főépületre.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építsd a főépületed 5. szintre.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">750<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_main_on_five\" id=\"qstbg\"><\/div>\n\t\t","number":"-29","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Főépület 5<\/h4><div class=\"spoken\">&rdquo;ساختمان اصلی به سطح 5 رسید، حال می توانی اقامتگاه یا قصر بنا کنی...”<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">750<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><a href=\"javascript: qst_next('','29');\" class=\"qri arrow\">Befejezés<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_main_on_five\"><\/div>\n\t\t","number":29,"reward":{"wood":600,"clay":750,"iron":600,"crop":300},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 30){

$granary = $building->getTypeLevel(11);
if ($granary < 3){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Magtár 3<\/h4><div class=\"spoken\">&rdquo;A magtárak gyors túlcsordulását megakadályozandó, építs ki a magtáradat magasabb szintre.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építsd egy magtárad 3. szintre.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">900<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">850<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_granary_on_three\" id=\"qstbg\"><\/div>\n\t\t","number":"-30","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Magtár 3<\/h4><div class=\"spoken\">&rdquo;انبار غذا به سطح 3 ارتقاء داده شد...”<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">900<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">850<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><a href=\"javascript: qst_next('','30');\" class=\"qri arrow\">Befejezés<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_granary_on_three\"><\/div>\n\t\t","number":30,"reward":{"wood":900,"clay":850,"iron":600,"crop":300},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 31){

$warehouse = $building->getTypeLevel(10);
if ($warehouse < 7){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Raktár 7<\/h4><div class=\"spoken\">&rdquo;A raktárak gyors túlcsordulását megakadályozandó, építs ki a raktáradat magasabb szintre.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs egy raktárat a 7. szintre.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">1800<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">1650<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">800<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_warehouse_on_seven\" id=\"qstbg\"><\/div>\n\t\t","number":"-31","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Raktár 7<\/h4><div class=\"spoken\">&rdquo;انبار به سطح 7 ارتقاء داده شد...”<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">1800<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">1650<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">800<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><a href=\"javascript: qst_next('','31');\" class=\"qri arrow\">Befejezés<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_warehouse_on_seven\"><\/div>\n\t\t","number":31,"reward":{"wood":1800,"clay":2000,"iron":1650,"crop":800},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 32){

//Check one of each resource is lvl5 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>4){$ironL++;};if($tRes['f7']>4){$ironL++;};if($tRes['f10']>4){$ironL++;};if($tRes['f11']>4){$ironL++;}
if($tRes['f5']>4){$clayL++;};if($tRes['f6']>4){$clayL++;};if($tRes['f16']>4){$clayL++;};if($tRes['f18']>4){$clayL++;}
if($tRes['f1']>4){$woodL++;};if($tRes['f3']>4){$woodL++;};if($tRes['f14']>4){$woodL++;};if($tRes['f17']>4){$woodL++;}
if($tRes['f2']>4){$cropL++;};if($tRes['f8']>4){$cropL++;};if($tRes['f9']>4){$cropL++;};if($tRes['f12']>4){$cropL++;};if($tRes['f13']>4){$cropL++;};if($tRes['f15']>4){$cropL++;}
if ($ironL<4 || $clayL<4 || $woodL<4 || $cropL<6){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Mindent ötödikre!<\/h4><div class=\"spoken\">&rdquo;Nyersanyagból soha nem elég. Rövid távon a nyersanyagmezők fejlesztése igen drága, de hosszú távon bőven behozza az árát.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs ki minden nyersanyagmezőt 5. szintre.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">1800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">1950<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">1200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_res_all_five\" id=\"qstbg\"><\/div>\n\t\t","number":"-32","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Mindent ötödikre!<\/h4><div class=\"spoken\">&rdquo;همۀ منابع به سطح 5 شدند، اکنون تولیدات دهکده بالا رفته و یک قدم پیشرفت کردید...”<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">1800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">1950<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">1200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><a href=\"javascript: qst_next('','32');\" class=\"qri arrow\">Befejezés<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_res_all_five\"><\/div>\n\t\t","number":32,"reward":{"wood":1600,"clay":1800,"iron":1950,"crop":1200},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 33){

$residence = $building->getTypeLevel(25);
if ($residence<10){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Palota vagy rezidencia<\/h4><div class=\"spoken\">&rdquo;Egy új település alapításához szükség van telepesekre. Ezeket a rezidencián avagy a palotában tudod kiképezni.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Építs fel palotát vagy rezidenciát a 10. szintre<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">3400<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">2800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">3600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">2200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_palace_or_residence\" id=\"qstbg\"><\/div>\n\t\t","number":"-33","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Palota vagy rezidencia<\/h4><div class=\"spoken\">&rdquo;اقامتگاه به سطح 10 رسید، حالا میتوانید مهاجر بسازید و دهکدۀ دوم خود را بنا کنید.<br><br>به امتیاز فرهنگی خود دقت کنید...”<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">3400<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">2800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">3600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">2200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><a href=\"javascript: qst_next('','33');\" class=\"qri arrow\">Befejezés<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_palace_or_residence\"><\/div>\n\t\t","number":33,"reward":{"wood":3400,"clay":2800,"iron":3600,"crop":2200},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 34){

// Checking 3 settlers trained or no
$units = $village->unitall;
$unarray2=array("","u10", "u20","u30");
if ($units[$unarray2[$session->userinfo['tribe']]]<3){ ?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>3 telepes<\/h4><div class=\"spoken\">&rdquo;Egy új település alapításához szükség van 3 telepesre. Ezeket a rezidencián avagy a palotában tudod kiképezni.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Képezz 3 telepest<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">1050<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">900<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">750<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_three_settlers\" id=\"qstbg\"><\/div>\n\t\t","number":"-34","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>3 telepes<\/h4><div class=\"spoken\">&rdquo;3 مهاجر ساخته شد.<br><br>برای بنا کردن دهکدۀ جدید شما به 2000 امتیاز فرهنگی نیاز دارید...”<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">1050<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">900<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">750<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><a href=\"javascript: qst_next('','34');\" class=\"qri arrow\">Befejezés<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_three_settlers\"><\/div>\n\t\t","number":34,"reward":{"wood":1050,"clay":800,"iron":900,"crop":750},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 35){

$vil = $database->getProfileVillages($session->uid);
if (count($vil)<2){ ?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Új falu<\/h4><div class=\"spoken\">&rdquo;A térképen találsz sok üres területet. Válassz ki egyet és alapíts ott egy új falut.”<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Alapíts egy új falut.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">1800<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">1300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_new_village\" id=\"qstbg\"><\/div>\n\t\t","number":"-35","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Új falu<\/h4><div class=\"spoken\">&rdquo;تبریک میگویم<br><br>شما همۀ وظایف را پشت سر گذاشتید، اکنون باید به تنهایی ادامه دهید.<br><br>خداحافظ...”<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Fa\" src=\"img\/x.gif\" alt=\"Fa\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Agyag\" src=\"img\/x.gif\" alt=\"Agyag\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Vasérc\" src=\"img\/x.gif\" alt=\"Vasérc\">1800<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Búza\" src=\"img\/x.gif\" alt=\"Búza\">1300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">vissza az áttekintő nézethez.<\/a><a href=\"javascript: qst_next('','35');\" class=\"qri arrow\">Befejezés<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_new_village\"><\/div>\n\t\t","number":35,"reward":{"wood":1600,"clay":2000,"iron":1800,"crop":1300},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>




// End tasks message
<?php } ?>
