<?
/* ----------------------------------------------------------------------------- */
/*                                                                               */
/* Copyright (C) 2005, Script by RP-Draw WebDesign, Delfzijl, Netherlands        */
/* http://www.rp-draw.nl/scripts/index.html - info@rp-draw.nl                    */
/* Version 2.1.01 - 28-03-2005                                                   */
/*                                                                               */
/*                                                                               */
/* GPL LICENCE                                                                   */
/* This file is part of Flat-Guest guestbook.                                    */
/*                                                                               */
/* Flat-Guest guestbook is free software; you can redistribute it and/or modify  */
/* it under the terms of the GNU General Public License as published by          */
/* the Free Software Foundation; either version 2 of the License, or             */
/* (at your option) any later version.                                           */
/*                                                                               */
/* Flat-Guest guestbook is distributed in the hope that it will be useful,       */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of                */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                 */
/* GNU General Public License for more details.                                  */
/*                                                                               */
/* You should have received a copy of the GNU General Public License             */
/* along with Flat-Guest guestbook; if not, write to the Free Software           */
/* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA     */
/*                                                                               */
/* ----------------------------------------------------------------------------- */


error_reporting('E_ALL & ~E_NOTICE');
//Script file version
  $version = "2.1.01";

//Script file version date
  $versiondate = "28-03-2005";

// Ttitle of the web page
  $title = "My Guestbook";

//####Change "12345" with your own password. It's required when you delete an entry
  $admin_password = "vomb2varv";

//####Change "en" to your language 
  $language = 'se';
					// dk = Danish, by Robert van Rees ** partial translation Need help.
					// nl = Dutch, by Robert van Rees
					// en = English by Gary Cleghorn
					// fr = French, by Loïc Reynaud
					// de = German, by Robert van Rees
					// hu = Hungarian, by Timea Vrasko
					// no = Norwegian, by Vegard Søbstad Alsli
					// pt = Portuguese, by Mirele Sotelo Gonçalves
					// es = Spanish, by Manuel
					// se = swedish, by Roffe Johnzon

//####Change to your website adres.
//####When people click the back button on the main page the wil be taken here...
  $website = "http://www.skridsko.net/sik/langfardsskridsko/default.htm";

//Maximum entry per page when you view your guestbook
  $max_entry_per_page = "10";

//--only 2000 characters allowed for comment
  $maxchar = 2000;

//Name of file used to store your entry
//Be sure that your server can write in this file by CHMOD it to 777
  $data_file = "data.dat";

//Maximum entry stored in data file
  $max_record_in_data_file = "150";

//Color & font setting
  $background = "#FFFFFF";						// Page color
  $table_top = "#000080";						// Color of the first row
  $font_top_color = "#FFFFFF";					// Font Color of the text on the first row
  $table_content_1a = "#C3DCF9";				// Background color of odd messages
  $table_content_2a = "#66A6EE";				// Background color of even messages
  $table_bottom = "#000080";					// Color of the last row
  $table_width = "95%";							// Width of the message table
  $font_bottom_color = "#FFFFFF";				// Font Color of the text on the last row
  $table_border = "#000000";					// Bordercolor of the main message table
  $link = "#FFFFFF";							// Color of some of the links (see style sheet)
  $visited_link = "#FFFFFF";
  $active_link = "#CC0000";
  $font_face = "verdana";						// Fontface of some of the text (zee style sheet)
  $linecolor = "#FE7302"; 						// Color of line above messages
  $message_font_face = "arial";					// Fontface of messages (also see style sheet)
  $message_font_size = "2";						// Fontsize of messages (also see style sheet)
  $message_font_color = "#000000";				// Fontcolor of messages (also see style sheet)


$conf = array(); 								// Don't edit this line!
/* language-file selection */
$conf['lang'] = $language;
$lang = array();
$langfile = "language/".$language."-lang.php";

// Check if language file exists.
if (!file_exists($langfile)) {
echo "<FONT FACE=\"$page_font\" SIZE=\"$page_font_size\" COLOR=\"$page_font_color\">";
    echo "<B>ERROR !</B><BR>The Script can not find the language file <b>$langfile</B>.<BR> Please check and change the language value: \"<b>$language</b>\" in the config area of fggbook.php.</font><BR>";
        exit;
} else {
include $langfile;
}

// +++ Start of Script +++ DO NOT EDIT BELOW THIS LINE ++++++++++++++++++++++++++++++++++++++++++
if (!empty($_GET)) {
        if (isset($_GET["do"])) $do = $_GET["do"];
        if (isset($_GET["id"])) $id = $_GET["id"];
        if (isset($_GET["page"])) $page = $_GET["page"];
} else if (!empty($HTTP_GET_VARS)) {
        if (isset($HTTP_GET_VARS["do"])) $do = $HTTP_GET_VARS["do"];
        if (isset($HTTP_GET_VARS["id"])) $id = trim($HTTP_GET_VARS["id"]);
        if (isset($HTTP_GET_VARS["page"])) $page = trim($HTTP_GET_VARS["page"]);
}

if (isset($_POST["do"])) $do = $_POST["do"];
else if (isset($HTTP_POST_VARS["do"])) $do = $HTTP_POST_VARS["do"];

if (!isset($PHP_SELF)) {
        if (isset($_SERVER["PHP_SELF"])) $PHP_SELF = $_SERVER["PHP_SELF"];
        else if (isset($HTTP_SERVER_VARS["PHP_SELF"])) $PHP_SELF = $HTTP_SERVER_VARS["PHP_SELF"];
}
if (!isset($DOC_ROOT)) {
        if (isset($_SERVER['DOCUMENT_ROOT'])) $DOC_ROOT = $_SERVER['DOCUMENT_ROOT'];
        else if (isset($HTTP_SERVER_VARS['DOCUMENT_ROOT'])) $DOC_ROOT = $HTTP_SERVER_VARS['DOCUMENT_ROOT'];
}

// reverse strrchr() - PHP v4.0b3 and above
function reverse_strrchr($haystack, $needle)
{
   $pos = strrpos($haystack, $needle);
   if($pos === false) {
       return $haystack;
   }
   return substr($haystack, 0, $pos + 1);
}
$data1 = $DOC_ROOT;
$data2 = reverse_strrchr($PHP_SELF, '/'); 
$data_path = "$data1$data2$data_file";

if (!isset($do)) $do = "";
else if (preg_match("/\W/",$do)) $do = "";

if (!isset($page) or $page == 0) $page=1;

// Check if date file exists.
if (!file_exists($data_path)) {
    echo "<B>".$lang[$conf['lang']]['error']."</B><BR> ".$lang[$conf['lang']]['no-datafile']."<BR>path : <b>$data_path</B><BR>";
        exit;
} else {
  if ($max_record_in_data_file <> 0) {
     $f = file($data_path);
     rsort($f);
     $j = count($f);
     if ($j > $max_record_in_data_file) {
        $rf = fopen($data_path,"w");
              for ($i=0; $i<$max_record_in_data_file; $i++) {
                  fwrite($rf,$f[$i]);
                   }
                    fclose($rf);
     }
  }
}

switch ($do) {
case "":
   $record = file($data_path);
   rsort($record);
   $jmlrec = count($record);
?>
<HTML>
<HEAD>
<TITLE><?php echo "$title" ?></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK REL="StyleSheet" HREF="fg-style.css" TYPE="text/css">
</HEAD>
<BODY bgcolor="<?php echo $background; ?>" link="<?php echo $link; ?>" vlink="<?php echo $visited_link; ?>" alink="<?php echo $active_link; ?>" topmargin="0" marginheight="0">

<h1><?php echo $lang[$conf['lang']]['read-gbook-title']; ?></h1>

<!-- start Top Row message board with link to sign guestbook -->
<TABLE align=center border=0 cellPadding=2 cellSpacing=0 width="<?php echo $table_width; ?>">
  <TBODY>
  <TR>
    <TD class=font2 width="56%"><?PHP echo date("l dS of F Y h:i:s A"); ?></TD>
    <TD class=font1 align=right width="44%"><B><FONT SIZE="2" ><img src="home.gif" width="16" height="16" border="0" alt="<?php echo $lang[$conf['lang']]['sign-but3'] ?>" title="<?php echo $lang[$conf['lang']]['sign-but3'] ?>" align=absmiddle><A class=font1 HREF='<?php echo $website; ?>'><?php echo $lang[$conf['lang']]['sign-but3'] ?></A>&nbsp; &nbsp; 
<IMG src="sign.gif" width=15 alt="<?php echo $lang[$conf['lang']]['sign-gbook-link']; ?>" title="<?php echo $lang[$conf['lang']]['sign-gbook-link']; ?>" align=absmiddle><A class=font1 HREF="<?PHP echo "$PHP_SELF?do=add_form&page=$page" ?>">
	  <?php echo $lang[$conf['lang']]['sign-gbook-link']; ?></FONT></B></a>
      </TD></TR></TBODY></TABLE><br>
<!-- End Top Row message board -->

   <TABLE align=center bgcolor="<?PHP echo $table_border; ?>" border=0 cellPadding=5 cellSpacing=1 width="95%">

 <TR bgColor="<?php echo $table_top; ?>">
    <TD width="32%"><FONT color="<?php echo $font_top_color; ?>" 
	  FACE="<?php echo $font_face?>" size=2><B><?php echo $lang[$conf['lang']]['signed-by']; ?></B></FONT></TD>
    <TD width="68%"><FONT color="<?php echo $font_top_color; ?>" 
      FACE="<?php echo $font_face; ?>"
    size=2><B><?php echo $lang[$conf['lang']]['messages']; ?></B></FONT></TD></TR>

<?
      $jml_page = intval($jmlrec/$max_entry_per_page);
      $sisa = $jmlrec%$max_entry_per_page;
      if ($sisa > 0) $jml_page++;
      $no = $page*$max_entry_per_page-$max_entry_per_page;
      if ($jmlrec == 0) echo "<TR><TD colspan=2 bgcolor='$table_content_1a' align='center'><FONT color='$message_font_color' SIZE='3' FACE='$font_face'><b>".$lang[$conf['lang']]['no-messages']."</b></FONT></TD></TR>";

                $w = 0; //--Color
        for ($i=0; $i<$max_entry_per_page; $i++) {
                    $no++;
                    $recno = $no-1;
                    if (isset($record[$recno])) {
                       $row = explode("|~~|",$record[$recno]);
                           if ($w==0) {
                                   $warna = $table_content_1a;
                                        //$warna = "#c6d7ec";
                                            $w=1;
                           } else {
                                   $warna = $table_content_2a;
                                        //$warna = "#D9E4F2";
                                        $w=0;
                                    }
//---Displaying Records--

                echo "<TR bgColor='$warna'><TD vAlign=top width='32%'>
                <TABLE border=0 cellPadding=2 cellSpacing=0><TBODY>";

        echo "<TR><TD class=font1 colSpan=2><IMG border=0 height=17 src='user.gif' width=18 alt='".$lang[$conf['lang']]['userinfo1']."$row[3]' title='".$lang[$conf['lang']]['userinfo1']."$row[3]'><b> &nbsp;$row[3]</b></TD><TR>";
        echo "<TR><TD class=font2 colSpan=2>";
                if (trim($row[7])<>"" and trim($row[7])<>"http://")
                {
                if (ereg("^http://", trim($row[7])))
        echo "<A class=font2 HREF='$row[7]'TARGET='_blank'><IMG SRC='homepage.gif' BORDER=0 ALT='".$lang[$conf['lang']]['userinfo2']."$row[7]' title='".$lang[$conf['lang']]['userinfo2']."$row[7]'></A> &nbsp;<A HREF='$row[7]'TARGET='_blank'>$row[7]</A>";
                 else
        echo "<A class=font2 HREF='http://$row[7]' TARGET='_blank'><IMG SRC='homepage.gif' BORDER=0 ALT='".$lang[$conf['lang']]['userinfo2']."$row[7]' title='".$lang[$conf['lang']]['userinfo2']."$row[7]'></A> &nbsp;<A HREF='http://$row[7]' TARGET='_blank'>$row[7]</A>";
                }
        echo "</TD></TR>";
                if ($row[4] == "")
                {
        echo " ";}
                 else {
        echo "<TR><TD class=font2 colSpan=2><A href='mailto:$row[4]'><IMG alt='".$lang[$conf['lang']]['userinfo3']."$row[4]' title='".$lang[$conf['lang']]['userinfo3']."$row[4]' border=0 height=15 src='email.gif' width=15></A> &nbsp;<A HREF='mailto:$row[4]'>$row[4]</a></TD></TR>";
                }
         echo "<TR><TD class=font2 colSpan=2><img src='location.gif' width=16 height=16 border=0 alt='".$lang[$conf['lang']]['userinfo4']."$row[5]' title='".$lang[$conf['lang']]['userinfo4']."$row[5]'> &nbsp;$row[5]</TD></TR>";
        echo "</TBODY></TABLE></TD>";

        echo "<TD class=font1 valign=top width='68%'><!--<DIV align=left class=font3><B>$no .</B> &nbsp;--><img src=message.gif width=18 height=15 border=0 align=absmiddle alt='".$lang[$conf['lang']]['userinfo5a']."$no ".$lang[$conf['lang']]['userinfo5b']."$row[3]' title='".$lang[$conf['lang']]['userinfo5a']."$no ".$lang[$conf['lang']]['userinfo5b']."$row[3]'>";
        echo " &nbsp;<A HREF='$PHP_SELF?do=del&id=$row[1]&page=$page'><IMG SRC='slot.gif' width=15 height=16 ALT='".$lang[$conf['lang']]['userinfo6']."$no' title='".$lang[$conf['lang']]['userinfo6']."$no' border=0 align='center'></A> &nbsp;$row[2]</DIV>";
        echo "<HR SIZE=1 color='$linecolor' size='1' noshade>
              <div align=left valign=top>$row[6]</div></TD>";
        echo "</td></tr>";


        } //--end if
} //--end for

echo "<TR><TD bgcolor='$table_bottom' align='left' colspan='2'>";
echo "<Table width='100%' border='0' cellpadding='0' cellspacing='0'>";

//--- Page Count Start
      echo "<TR><TD align='left'><FONT SIZE='1' FACE='$font_face' COLOR='$font_bottom_color'>";
      if ($jml_page > 1) {
           if ($page <> 1) echo "[<A HREF='$PHP_SELF?page=1'>".$lang[$conf['lang']]['pagenum-top']."</A>] "; else echo "[".$lang[$conf['lang']]['pagenum-top']."] ";
           echo $lang[$conf['lang']]['pagenum-a'] ;
       if ($jml_page > 10) {
                  if ($page < 5) {
                    $start = 1;
                        $stop = 10;
                 } elseif ($jml_page - $page < 5) {
                    $start = $jml_page - 9;
                        $stop = $jml_page;
                 } else {
                    $start = $page-4;
                        $stop = $page+5;
                 }
                 if ($start <> 1) echo "... ";
         for ($p=$start; $p<=$stop; $p++) {
                 if ($p == $page) echo "<FONT color='$active_link'><B>$p</B></FONT>&nbsp;&nbsp;";
                         else echo "<A HREF='$PHP_SELF?page=$p'>$p</A>&nbsp;&nbsp;";
         }
                 if ($stop <> $jml_page) echo "... ";
                 echo "van $jml_page ";
       } else {
         for ($p=1; $p<=$jml_page; $p++) {
                 if ($p == $page) echo "<FONT color='$active_link'><B>$p</B></FONT>&nbsp;&nbsp;";
                         else echo "<A HREF='$PHP_SELF?page=$p'>$p</A>&nbsp;&nbsp;";
         }
           }
       if ($page <> $jml_page) echo "[<A HREF='$PHP_SELF?page=$jml_page'>".$lang[$conf['lang']]['pagenum-bot']."</A>]"; else echo "[".$lang[$conf['lang']]['pagenum-bot']."]";
      } else echo $lang[$conf['lang']]['pagenum-b'];
          echo "</FONT></TD><td bgcolor='$table_bottom' align='right' width='30%'><FONT size='2' face='$font_face' color='$active_link'><IMG src='sign.gif' width=12 align=absmiddle  alt=".$lang[$conf['lang']]['sign-gbook-link']." title=".$lang[$conf['lang']]['sign-gbook-link']."> <A HREF=$PHP_SELF?do=add_form&page=$page><B>".$lang[$conf['lang']]['sign-gbook-link']."</B></a></font></td></TR>";
//---Page Count End
echo "</TABLE>"
?>
		</td></TR>
        </TABLE>
        <P>
		<TABLE align=center border=0 cellPadding=2 cellSpacing=0 width="95%">
		<TBODY><TR>
		<TD class=font2 align=center><b>Flat-Guest script by: <a class=font1 href="http://www.rp-draw.nl/scripts/index.html" target="_blank">RP-Draw WebDesign</a></b> - <b>Version: <?php echo $version;?></b></td></TR>
		</TBODY></TABLE>
   </CENTER>
   </BODY>
   </HTML>
<?
break;
case "add_form":
?>
<!-- Start Form --->
<html>
<head>
<title><?php echo "$title" ?></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK REL="StyleSheet" HREF="fg-style.css" TYPE="text/css">
</head>
<body bgcolor="<?php echo "$background" ?>">

<h1><?PHP echo $lang[$conf['lang']]['sign-gbook-title']; ?></h1>

<div align="center"> <br>
  <form method="post" action="<?php echo "$PHP_SELF" ?>">
  <input type="hidden" name="do" value="add">
    <table width="460" border="0" cellspacing="0" cellpadding="0" bgcolor="<?php echo "$table_border" ?>">
      <tr>
      <td>
        <div align="center">
            <table width="100%" border="0" cellspacing="1" cellpadding="5">
                  <tr>
                    <TD bgColor="<?php echo $table_top ?>" colSpan=2><B>
					<FONT color='<?php echo $font_top_color ?>' face="<?php echo $font_face ?>" size=2>
					<?PHP echo $lang[$conf['lang']]['sign-gbook-link']; ?>:</FONT></B></TD>
				  </tr>
              <tr bgcolor="<?php echo "$table_content_1a" ?>">
                <td width="28%">
                  <div align="left"><font face="<?php echo $font_face?>" size="2"><IMG border=0 height=17 src='user.gif' width=18 alt="<?PHP echo $lang[$conf['lang']]['signinfo1']; ?>" title="<?PHP echo $lang[$conf['lang']]['signinfo1']; ?>">&nbsp;*<?PHP echo $lang[$conf['lang']]['signinfo1']; ?></font></div>
                </td>
                <td width="72%">
                  <input type="text" name="vname" size="40" maxlength="70">
                </td>
              </tr>
              <tr bgcolor='<?php echo "$table_content_1a" ?>'>
                <td width="28%">
                  <div align="left"><font face="<?php echo $font_face?>" size="2"><IMG border=0 height=17 src='email.gif' width=18 alt="<?PHP echo $lang[$conf['lang']]['userinfo3']; ?>" title="<?PHP echo $lang[$conf['lang']]['userinfo3']; ?>">&nbsp;<?PHP echo $lang[$conf['lang']]['signinfo2']; ?></font></div>
                </td>
                <td width="72%">
                  <input type="text" name="vemail" size="40" maxlength="100">
                </td>
              </tr>
              <tr bgcolor='<?php echo "$table_content_1a" ?>'>
                <td width="28%">
                  <div align="left"><font face="<?php echo $font_face?>" size="2"><IMG border=0 height=17 src='home.gif' width=18 alt="<?PHP echo $lang[$conf['lang']]['userinfo2']; ?>" title="<?PHP echo $lang[$conf['lang']]['userinfo2']; ?>">&nbsp;<?PHP echo $lang[$conf['lang']]['signinfo3']; ?></font></div>
                </td>
                <td width="72%">
                  <input type="text" name="vurl" size="40" maxlength="150" VALUE="http://">
                </td>
              </tr>
              <tr bgcolor='<?php echo "$table_content_1a" ?>'>
                <td width="28%">
                  <div align="left"><font face="<?php echo $font_face?>" size="2"><IMG border=0 height=17 src='location.gif' width=18 alt="<?PHP echo $lang[$conf['lang']]['signinfo4']; ?>" title="<?PHP echo $lang[$conf['lang']]['signinfo4']; ?>">&nbsp;*<?PHP echo $lang[$conf['lang']]['signinfo4']; ?></font></div>
                </td>
                <td width="72%">
<input type="text" name="vcountry" size="40" maxlength="100">
                </td>
              </tr>
              <tr bgcolor="<?php echo "$table_content_1a" ?>">
                <td valign="top" width="28%">
                  <div align="left"><font face="<?php echo $font_face?>" size="2"><IMG border=0 height=17 src='message.gif' width=18 alt="<?PHP echo $lang[$conf['lang']]['signinfo5']; ?>" title="<?PHP echo $lang[$conf['lang']]['signinfo5']; ?>">&nbsp;*<?PHP echo $lang[$conf['lang']]['signinfo5']; ?></font></div>
                </td>
                <td width="72%">
                  <textarea name="vcomment" cols="40" rows="7" wrap="VIRTUAL"></textarea><BR><font size=1 FACE="<?php echo $font_face?>">* <?PHP echo $lang[$conf['lang']]['signinfo6']; ?></font>
                </td>
              </tr>
              <tr bgcolor="<?php echo "$table_content_1a" ?>">
                <td colspan="2" bgcolor="<?php echo "$table_bottom" ?>">
                  <div align="center"><font face="<?php echo $font_face?>" size="3">
                    <font size="2">
                    <input class="button" type="submit" value="<?PHP echo $lang[$conf['lang']]['sign-but1']; ?>">
                    <input class="button" type="reset" value="<?PHP echo $lang[$conf['lang']]['sign-but2']; ?>">
                    <input class="button" type="button" value="<?PHP echo $lang[$conf['lang']]['sign-but3']; ?>" onclick="window.location='<?php echo "$PHP_SELF?page=$page" ?>'">
                    </font></font></div>
                </td>
              </tr>
            </table>
        </div>
      </td>
    </tr>
  </table>
  </form>
</div>
<TABLE align=center border=0 cellPadding=2 cellSpacing=0 width="95%">
<TBODY><TR>
<TD class=font2 align=center><b>Flat-Guest script by: <a class=font1 href="http://www.rp-draw.nl/scripts/index.html" target="_blank">RP-Draw WebDesign</a></b> - <b>Version: <?php echo $version;?></b></td></TR>
</TBODY></TABLE>
</body>
</html>
<!-- End of entry form -->
<?
break;
case "add":
   if (!empty($_POST)) {
           if (isset($_POST["vname"])) {
                   $vname = $_POST["vname"];
                   if (strlen($vname) > 70) $vname = substr($vname,0,70);
           }
           if (isset($_POST["vemail"])) {
                   $vemail = $_POST["vemail"];
                   if (strlen($vemail) > 100) $vemail = substr($vemail,0,100);
           }
           if (isset($_POST["vurl"])) {
                   $vurl = $_POST["vurl"];
                   if (strlen($vurl) > 150) $vurl = substr($vurl,0,150);
           }
           if (isset($_POST["vcountry"])) {
                   $vcountry = $_POST["vcountry"];
                   if (strlen($vcountry) > 50) $vcountry = substr($vcountry,0,50);
           }
           if (isset($_POST["vcomment"])) $vcomment = $_POST["vcomment"];
   } else if (!empty($HTTP_POST_VARS)) {
           if (isset($HTTP_POST_VARS["vname"])) {
                   $vname = $HTTP_POST_VARS["vname"];
                   if (strlen($vname) > 70) $vname = substr($vname,0,70);
           }
           if (isset($HTTP_POST_VARS["vemail"])) {
                   $vemail = $HTTP_POST_VARS["vemail"];
                   if (strlen($vemail) > 100) $vemail = substr($vemail,0,100);
           }
           if (isset($HTTP_POST_VARS["vurl"])) {
                   $vurl = $HTTP_POST_VARS["vurl"];
                   if (strlen($vurl) > 150) $vurl = substr($vurl,0,150);
           }
           if (isset($HTTP_POST_VARS["vcountry"])) {
                   $vcountry = $HTTP_POST_VARS["vcountry"];
                   if (strlen($vcountry) > 50) $vcountry = substr($vcountry,0,50);
           }
           if (isset($HTTP_POST_VARS["vcomment"])) $vcomment = $HTTP_POST_VARS["vcomment"];
   }

// ERROR - Empty fields
   if (trim($vname)=="" or trim($vcountry)=="" or trim($vcomment)=="") {
      echo "<HTML>
			<head>
			<title>".$lang[$conf['lang']]['error']." - $title></title>
			<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
			<LINK REL='StyleSheet' HREF='fg-style.css' TYPE='text/css'>
			</head>";
	  echo "<BODY bgcolor='$background'>
			<H2>".$lang[$conf['lang']]['error']."</H2>
			<FONT SIZE=2 FACE='$font_face'>".$lang[$conf['lang']]['empty-fields']."<B><A class=font1 HREF='javascript:history.back()'>".$lang[$conf['lang']]['click-here']."</A></B> ".$lang[$conf['lang']]['try-again']."</FONT>
			</BODY>
			</HTML>";
          exit;
   }

// ERROR - Wrong Email address
   if (trim($vemail)!="" and !preg_match("/([\w\.\-]+)(\@[\w\.\-]+)(\.[a-z]{2,4})+/i", $vemail)) {
      echo "<HTML>
<head>
<title>".$lang[$conf['lang']]['error']." - $title></title>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<LINK REL='StyleSheet' HREF='fg-style.css' TYPE='text/css'>
</head>";
	  echo "<BODY bgcolor='$background'>
<H2>".$lang[$conf['lang']]['error']."</H2>
<FONT SIZE=2 FACE='$font_face'>".$lang[$conf['lang']]['wrong-email']."<B><A class=font1 HREF='javascript:history.back()'>".$lang[$conf['lang']]['click-here']."</A></B> ".$lang[$conf['lang']]['try-again']."</FONT>
</BODY>
</HTML>";
          exit;
   }

// ERROR - Wrong URL address
   if (trim($vurl) <> "") {
          if (strtolower(trim($vurl)) <> "http://") {
         if (!preg_match ("#^http://[_a-z0-9-]+\\.[_a-z0-9-]+#i", $vurl)) {
      echo "<HTML>
<head>
<title>".$lang[$conf['lang']]['error']." - $title></title>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<LINK REL='StyleSheet' HREF='fg-style.css' TYPE='text/css'>
</head>";
	  echo "<BODY bgcolor='$background'>
<H2>".$lang[$conf['lang']]['error']."</H2>
<FONT SIZE=2 FACE='$font_face'>".$lang[$conf['lang']]['wrong-url']."<B><A class=font1 HREF='javascript:history.back()'>".$lang[$conf['lang']]['click-here']."</A></B> ".$lang[$conf['lang']]['try-again']."</FONT>
</BODY>
</HTML>";
                exit;
          }
      }
   }

// ERROR - Message to long
   $test_comment = explode(" ",$vcomment);
   $jmltest = count($test_comment);
   for ($t=0; $t<$jmltest; $t++) {
      if (strlen(trim($test_comment[$t])) > 35) {
      echo "<HTML>
<head>
<title>".$lang[$conf['lang']]['error']." - $title></title>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<LINK REL='StyleSheet' HREF='fg-style.css' TYPE='text/css'>
</head>";
	  echo "<BODY bgcolor='$background'>
<H2>".$lang[$conf['lang']]['error']."</H2>
<FONT SIZE=2 FACE='verdana'>".$lang[$conf['lang']]['no-abuse1']."$maxchar ".$lang[$conf['lang']]['no-abuse2']."<B><A class=font1 HREF='javascript:history.back()'>".$lang[$conf['lang']]['click-here']."</A></B> ".$lang[$conf['lang']]['try-again']."</FONT>
</BODY>
</HTML>";
            exit;
          }
   }

   if (strlen($vcomment) > $maxchar) $vcomment = substr($vcomment,0,$maxchar)."...";
   $idx = date("YmdHis");
   $tgl = date("F d, Y - h:i A");
   $vname = str_replace("<","",$vname);
   $vname = str_replace(">","",$vname);
   $vname = str_replace("~","-",$vname);
   $vname = str_replace("'","&quot;",$vname);

   $vcomment = str_replace("<","&lt;",$vcomment);
   $vcomment = str_replace(">","&gt;",$vcomment);
   $vcomment = str_replace("~","-",$vcomment);
   $vcomment = str_replace("'","&quot;",$vcomment);

   $vurl = str_replace("<","",$vurl);
   $vurl = str_replace(">","",$vurl);
   $vcomment = str_replace("\r\n","<BR>",$vcomment);
   $vcomment = str_replace("\r","",$vcomment);
   $vcomment = str_replace("\n","",$vcomment);

   if (preg_match("#<|>|'\~#",$vcountry)) exit;
   if (preg_match("/[^a-z ,-]/i",$vcountry)) $vcountry = "...";
   $newdata = "|~~|$idx|~~|$tgl|~~|$vname|~~|$vemail|~~|$vcountry|~~|$vcomment|~~|$vurl|~~|\n";
   $newdata = stripslashes($newdata);

   $tambah = fopen($data_path,"a");
   fwrite($tambah,$newdata);
   fclose($tambah);

// Message added to Guestbook
      echo "<HTML>
<head>
<title>$title</title>
<META HTTP-EQUIV='REFRESH' CONTENT='1; URL=$PHP_SELF'>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<LINK REL='StyleSheet' HREF='fg-style.css' TYPE='text/css'>
</head>";
	  echo "<BODY bgcolor='$background'>
<H1>".$lang[$conf['lang']]['added1']."</H1>
<center>".$lang[$conf['lang']]['added2']."".$lang[$conf['lang']]['one-moment']."</center>
</BODY>
</HTML>";

break;
case "del":
   $record = file($data_path);
   $jmlrec = count($record);
   for ($i=0; $i<$jmlrec; $i++) {
       $row = explode("|~~|",$record[$i]);
           if ($id == $row[1]) {
              echo "<HTML>
<head>
<TITLE>".$lang[$conf['lang']]['delete-title']." - $title</TITLE>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<LINK REL='StyleSheet' HREF='fg-style.css' TYPE='text/css'>
</head>";
	  echo "<BODY bgcolor='$background'>
<CENTER>
<h1>".$lang[$conf['lang']]['delete-title']."</h1>
<BR><BR>
<TABLE border=1 cellpadding=5 cellspacing=-1 width=450 bordercolor='#000000'>
	<TR>
    <TD bgcolor='$table_content_1a'>
    <FONT SIZE=2 FACE='$font_face'>
    <FONT SIZE='1'><B>$row[2]</FONT><BR>$row[3]</B> ".$lang[$conf['lang']]['from']." $row[5]<BR><A HREF='mailto:$row[4]'>$row[4]</A> &nbsp;$row[7] <P>$row[6]</FONT>
	</TD>
	</TR>
</TABLE>
                  ";
              break;
           }
   }
// echo "<FONT COLOR=\"RED\" >Demo version: Delete is disabled !</FONT><BR><BR>";
   echo "<FORM ACTION='$PHP_SELF' METHOD='post'>
<img src='slot.gif' width='16' height='16' border='0' alt='".$lang[$conf['lang']]['password-needed']."'>
<FONT FACE='$font_face' SIZE=2><B>".$lang[$conf['lang']]['admin-password']."</B></FONT>
<INPUT TYPE='password' NAME='pwd'>
<INPUT TYPE='hidden' NAME='do' VALUE='del2'>
<P>
<INPUT class=button TYPE='submit' VALUE='".$lang[$conf['lang']]['del-but1']."'> 
<INPUT class=button TYPE='button' VALUE='".$lang[$conf['lang']]['del-but2']."' onclick='window.location=\"$PHP_SELF?page=$page\"'>
<INPUT TYPE='hidden' NAME='id' VALUE='$id'>
<INPUT TYPE='hidden' NAME='page' VALUE='$page'>
</FORM>
</CENTER>
</BODY>
</HTML>";
break;
case "del2":
   if (isset($_POST["pwd"])) $pwd = $_POST["pwd"];
   else if (isset($HTTP_POST_VARS["pwd"])) $pwd = $HTTP_POST_VARS["pwd"];

   if (isset($_POST["id"])) $id = $_POST["id"];
   else if (isset($HTTP_POST_VARS["id"])) $id = $HTTP_POST_VARS["id"];

   if (isset($_POST["page"])) $page = $_POST["page"];
   else if (isset($HTTP_POST_VARS["page"])) $page = $HTTP_POST_VARS["page"];

// error - Wrong admin password
   if ($pwd <> $admin_password) {
         echo "<HTML>
<HEAD>
<TITLE>".$lang[$conf['lang']]['wrong-admin-password']." - $title</TITLE>
<META HTTP-EQUIV='REFRESH' CONTENT='1; URL=$PHP_SELF?page=$page'>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<LINK REL='StyleSheet' HREF='fg-style.css' TYPE='text/css'>
</HEAD>";
	  echo "<BODY bgcolor='$background'>
<H1>".$lang[$conf['lang']]['wrong-admin-password']."</H1>
<center>".$lang[$conf['lang']]['one-moment']."</center>
</BODY>
</HTML>";
         exit;
   }

   $record = file($data_path);
   $jmlrec = count($record);
   for ($i=0; $i<$jmlrec; $i++) {
       $row = explode("|~~|",$record[$i]);
       if ($id==$row[1]) {
              $record[$i] = "";
                  break;
           }
   }
   $update_data = fopen($data_path,"w");
         for ($j=0; $j<$jmlrec; $j++) {
        if ($record[$j] <> "") fputs($update_data,$record[$j]);
        }
         fclose($update_data);

// report - message deleted
   echo "<HTML>
<HEAD>
<TITLE>".$lang[$conf['lang']]['deleted']." - $title</TITLE>
<META HTTP-EQUIV='REFRESH' CONTENT='1; URL=$PHP_SELF?page=$page'>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<LINK REL='StyleSheet' HREF='fg-style.css' TYPE='text/css'>
</HEAD>";
	  echo "<BODY bgcolor='$background'>
<H1>".$lang[$conf['lang']]['deleted']."</H1>
<center>".$lang[$conf['lang']]['one-moment']."</center>
</BODY>
</HTML>";

break;
} //--end switch
?>