<?php			   
	//gp link
	if($session->gpack == null || GP_ENABLE == false) {
	$gpack= GP_LOCATE;
	} else {
	$gpack= $session->gpack;
	}


  
//de lintjes
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
$geregistreerd=date('Y/m/d', ($allianceinfo['timestamp']));

$profiel = preg_replace("/\[war]/s",'در جنگ با<br>'.$database->getAllianceDipProfile($aid,3), $profiel, 1); 
$profiel = preg_replace("/\[ally]/s",'متحد با<br>'.$database->getAllianceDipProfile($aid,1), $profiel, 1); 
$profiel = preg_replace("/\[nap]/s",'آتش بس با<br>'.$database->getAllianceDipProfile($aid,2), $profiel, 1); 
$profiel = preg_replace("/\[diplomatie]/s",'متحد با<br>'.$database->getAllianceDipProfile($aid,1).'<br>آتش بس با<br>'.$database->getAllianceDipProfile($aid,2).'<br>در جنگ با<br>'.$database->getAllianceDipProfile($aid,3), $profiel, 1);

foreach($varmedal as $medal) {

switch ($medal['categorie']) {
    case "1":
        $titel="Top 10 Attackers of the Week";
		$woord="Points";
        break;
    case "2":
        $titel="Top 10 Defenders of the Week";
 		$woord="Points";
       break;
    case "3":
        $titel="Top 10 Climbers of the Week";
 		$woord="Population";
       break;
    case "4":
        $titel="Top 10 Raiders of the Week";
		$woord="Resources";
        break;
	 case "5":
        $titel="Top 10 Raiders and Defenders of the Week";
        $bonus[$medal['id']]=1;
		break;
	 case "6":
        $titel="دریافت این مدال نشان میدهد که اتحاد شما در تاپ مهاجمین هفته با ".$medal['points']." امتیاز بین 3 نفر اول بوده.";
        $bonus[$medal['id']]=1;
		break;
	 case "7":
        $titel="دریافت این مدال نشان میدهد که اتحاد شما در تاپ مدافعین هفته با ".$medal['points']." امتیاز بین 3 نفر اول بوده.";
        $bonus[$medal['id']]=1;
		break;
	 case "8":
        $titel="دریافت این مدال نشان میدهد که اتحاد شما در تاپ پیشرفت کننده های هفته با ".$medal['points']." امتیاز بین 3 نفر اول بوده.";
        $bonus[$medal['id']]=1;
		break;
	 case "9":
        $titel="دریافت این مدال نشان میدهد که اتحاد شما در تاپ دزدان هفته با ".$medal['points']." منبع بین 3 نفر اول بوده.";
        $bonus[$medal['id']]=1;
		break;
    case "11":
        $titel="دریافت این مدال نشان میدهد که اتحاد شما در تاپ پیشرفت کننده های هفته با ".$medal['points']." امتیاز بین 3 نفر اول بوده.";
        $bonus[$medal['id']]=1;
        break;
         case "12":
        $titel="دریافت این مدال نشان میدهد که اتحاد شما در تاپ مهاجمین هفته با ".$medal['points']." امتیاز بین 10 نفر اول بوده.";
        $bonus[$medal['id']]=1;
        break;
        case "13":
        $titel="دریافت این مدال نشان میدهد که اتحاد شما در تاپ مدافعین هفته با ".$medal['points']." امتیاز بین 10 نفر اول بوده.";
        $bonus[$medal['id']]=1;
        break;
        case "15":
        $titel="دریافت این مدال نشان میدهد که اتحاد شما در تاپ دزدان با ".$medal['points']." منبع بین 10 نفر اول بوده.";
        $bonus[$medal['id']]=1;
        break;
        case "16":
        $titel="دریافت این مدال نشان میدهد که اتحاد شما در تاپ پیشرفت کننده ها با ".$medal['points']." امتیاز بین 10 نفر اول بوده";
        $bonus[$medal['id']]=1;
        break;

}

if(isset($bonus[$medal['id']])){
$profiel = preg_replace("/\[#".$medal['id']."]/is",'<img src="'.$gpack.'img/t/'.$medal['img'].'.gif" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>'.$titel.'<br /><br />دریافت در هفته: '.$medal['week'].'</td></tr></table>\')">', $profiel, 1);
} else {
$profiel = preg_replace("/\[#".$medal['id']."]/is",'<img src="'.$gpack.'img/t/'.$medal['img'].'.gif" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>دسته:</td><td>'.$titel.'</td></tr><tr><td>هفته:</td><td>'.$medal['week'].'</td></tr><tr><td>رتبه:</td><td>'.$medal['plaats'].'</td></tr><tr><td>'.$woord.':</td><td>'.$medal['points'].'</td></tr></table>\')">', $profiel, 1);
}
}



?>

