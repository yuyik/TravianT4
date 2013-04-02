<<<<<<< HEAD
﻿<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       ban_msq.tpl                                                 ##
##  Developed by:  yi12345                                                     ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
$time = time();
$ban = mysql_query("SELECT * FROM ".TB_PREFIX."banlist WHERE `uid` = '".$session->uid."' and active = 1");
$ban1 = mysql_fetch_array($ban);
?>

<p>
Hello <?php echo $ban1['name']; ?>!
You have been banned due to a violation of the rules.
</br>
Your banning reason is <?php echo $ban1['reason']; ?>.
</br>

</br></br> To ensure that you won't get banned again in the future, you shuold read the rules carefully:
</br></br><center> <?php echo "<a class=\"rules\" href=\"rules.php\">» Game rules</a>"; ?> </center>
</br></br></br>
To continue playing contact the Multihunter and put things straight with him/her
</br></br><center> <?php echo "<a class=\"rules\" href=\"nachrichten.php?t=1&id=4\">» Write Message</a>"; ?> </center>
</br></br>
Heed the following advice when writing your message:
</br></br>
● There is always a reason for a ban. <u>Try to think about possible reasons for this ban</u> and put things straight with the Multihunter.
</br>
● Multihunters can review enormous amounts of information about accounts. <u>Stick to the truth</u> and do not make excuses to justify your violation of the rules.
</br>
● Be cooperative and insightful, this might reduce the punishment.
</br>
● If the Multihunter does not answer immediately, then he/she is probably not online. The issue will not be resolved any faster by sending multiple messages, especially if he/she did not even read the first one yet.
</br>
● If you have really been banned unjustly, try to stay <u>calm and polite</u> while talking to the Multihunter and telling him/her about your point of view.
</p>
=======
<?php

$banned = mysql_query("SELECT reason, end FROM " . TB_PREFIX . "banlist WHERE active = 1 and uid = '" . $session->uid . "';");
$ban = mysql_fetch_assoc($banned);

echo "<h2>You Are Banned</h2><br /><br />";
echo "Sorry, your due to not obeying the rule and and use of <b>" . $ban['reason'] . "</b>,<br /> till <b>" . date("d/m/Y", $ban['end']) . " </b> Time <b>" . date("G:i:s", $ban['end']) . "</b> is banned.<br /><br /><br /><br />";
?>
<form action="logout.php?del_cookie" method="post">
<center>
<button type="submit" value="Login" name="s1" id="btn_login" onclick="document.snd.w.value=screen.width+':'+screen.height;">
        <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div>
        <div class="button-contents">Continue</div></div>
        </button></center></form>
>>>>>>> e8574568a0b50e1149c03aed1e46eb20961548ff
