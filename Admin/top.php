<div style="margin-left:1px; margin-top:5px;">
    <img border="0" src="../img/admin/logoBig.png">
    <div style="margin-left: 278px; margin-top:-75px;">
        <div class="point2">Today is <b><?php echo jdate('l j F Y'); ?></b> .</div>
        <div class="point2"><?php if($_SESSION['access'] == MULTIHUNTER) { echo '<b><font color="Blue">Multihunter</font></b>'; } elseif($_SESSION['access'] == ADMIN){ echo '<b><font color="Red">Administrator</font></b>'; } ?> Welcome to the admin panel of Travian</div>
        <div class="point2">IP: <?php echo $_SERVER['REMOTE_ADDR']; ?></div>
    </div>
</div>
