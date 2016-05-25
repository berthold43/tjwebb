<?php
checkLogin(0);?>
<?php echo pageHeader(0, false, "Rapport", 'Rapport');?>
<div id="wrapper">
<div id="left_column"><br>
<?php 
$entityName="Hjul";
require "viewpage.php";
require "functions.php";
$form->addEntityField($entity, "omrade");
$form->addEntityField($entity, "sasong");
$form->loadFromRecordset($rs);
$fmb->echoViewPageButtons($sm, $rows);
if ($rows == 1): ?>
<table border="0" width="100%">
      <tr WIDTH="100%" ALIGN="left">
        <td><h2>Turrapport <?=klartextdatum($rs->get("datum"))?><br>
<?=$rs->get("rubrik")?>        </h2>
        </td>
      </tr>
      <tr>
        <td><table BORDER="0">
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Datum: </b></td>
            <td VALIGN="top"><?=$rs->get("datum")?>
</td>
<?php if ($rs->get("slutdatum") != "" ): ?>
            <td VALIGN="top" ALIGN="right"><b>Slutdatum: </b></td>
            <td VALIGN="top"><?=$rs->get("slutdatum")?>
</td>
<?php endif;?>
          </tr>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Författare: </b></td>
            <td VALIGN="top"><?=$rs->get("inknappare")?>
</td>
            <td VALIGN="top" ALIGN="right"><b>Färdlängd (km): </b></td>
            <td VALIGN="top"><?=$rs->get("fardlangd")?>
</td>
          </tr>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Samlingsplats: </b></td>
            <td VALIGN="top"><?=$rs->get("samling_plats")?>
</td>
            <td VALIGN="top" ALIGN="right"><b>Samlingstid: </b></td>
            <td VALIGN="top"><?=$rs->get("samling_tid")?>
</td>
          </tr>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Färdmedel ut: </b></td>
            <td VALIGN="top"><?=$rs->get("fardmedel_ut")?>
</td>
            <td VALIGN="top" ALIGN="right"><b>Färdmedel hem: </b></td>
            <td VALIGN="top"><?=$rs->get("fardmedel_hem")?>
</td>
          </tr>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Färdstartplats: </b></td>
            <td VALIGN="top"><?=$rs->get("fardstart_plats")?>
</td>
            <td VALIGN="top" ALIGN="right"><b>Färdstart tid: </b></td>
            <td VALIGN="top"><?=$rs->get("fardstart_tid")?>
</td>
          </tr>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Målplats: </b></td>
            <td VALIGN="top"><?=$rs->get("fardslut_plats")?>
</td>
            <td VALIGN="top" ALIGN="right"><b>Tid i mål: </b></td>
            <td VALIGN="top"><?=$rs->get("fardslut_tid")?>
</td>
          </tr>
<?php if ($rs->get("kartor") != "" ): ?>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Kartor: </b></td>
            <td COLSPAN="3" VALIGN="top"><?=$rs->get("kartor")?>
</td>
          </tr>
<?php endif;
if ($rs->get("fardvag") != "" ): ?>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Färdväg: </b></td>
            <td COLSPAN="3" VALIGN="top"><?=$rs->get("fardvag")?>
</td>
          </tr>
<?php endif;
if ($rs->get("tips") != "" ): ?>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Omständigheter: </b></td>
            <td COLSPAN="3" VALIGN="top"><?=$rs->get("tips")?>
</td>
          </tr>
<?php endif;
if ($rs->get("mathak") != "" ): ?>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Mat- och vätskehak: </b></td>
            <td COLSPAN="3" VALIGN="top"><?=$rs->get("mathak")?>
</td>
          </tr>
<?php endif;
if ($rs->get("deltagare") != "" ): ?>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Deltagare:</b></td>
            <td COLSPAN="3" VALIGN="top"><?=$rs->get("deltagare")?>
</td>
          </tr>
<?php endif;
if ($rs->get("sevart") != "" ): ?>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Sevärdheter:</b></td>
            <td COLSPAN="3" VALIGN="top"><?=$rs->get("sevart")?>
</td>
          </tr>
<?php endif;
if ($rs->get("tillbud") != "" ): ?>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Tillbud och olyckor: </b></td>
            <td COLSPAN="3" VALIGN="top"><?=$rs->get("tillbud")?>
</td>
          </tr>
<?php endif;?>
          <tr>
            <td VALIGN="top" ALIGN="right"><b>Område:</b></td>
            <td COLSPAN="3" VALIGN="top"><?php $form->show("omrade")?>
</td>
          </tr>
</table>
<?php 
if ($_lankinfo) {?>
        <!--webbot bot="Include" U-Include="lankinfo_hjul.htm" TAG="BODY" startspan -->
<div align="left">

<table border="1" bgcolor="E0E0E0">
  <tr>
    <td align="left" valign="top"><font face="Arial,Helvetica"><h3><small>Länkinformation:</small></h3>
    <p><small>Du kan själv skapa länkar till den här sidan på två olika sätt,</small> <small>beroende
    på hur den skall användas.</small></p>
    <p><small>I ett inmatningsfält på någon SSSK-sida kan man referera till denna sida med
    :&nbsp;</small><br>
    <small>[<?=$rs->get("rubrik")?>=db:<?php echo $entityName;?>/<?=$rs->get("ID")?>]</small></p>
    <p><small>Länk som du kan maila:</small><br>
    <small><a href="/databas/hjul/hjul-v.asp?ID=<?=$rs->get("ID")?>">http://www.sssk.se/databas/hjul/hjul-v.asp?ID=<?=$rs->get("ID")?></a></small></p>
    <p align="right"><a href="hjul-v.asp?ID=<?=$rs->get("ID")?>&amp;_lankinfo=0"><small>Ta
    bort rutan med länkinformation</small></a></font></td>
  </tr>
</table>
</div>       

<!--webbot bot="Include" endspan i-checksum="27569" -->
<p><?php }
else {
?></p>
        <p><small><small><font face="Arial"><a href="hjul-v.asp?ID=<?=$rs->get("ID")?>&amp;_lankinfo=1">Länkinformation</a></font></small></small>
<?php }

elseif ($rows > 1):?>        </p>
        <p>För att läsa en viss färdrapport, klicka på rubrik i listan nedan</p>
        <table border="0" cellpadding="2" cellspacing="0">
          <tr>
            <th align="left" bgcolor="#C0C0C0">Rubrik</th>
            <th align="left" bgcolor="#C0C0C0">Datum</th>
            <th align="left" bgcolor="#C0C0C0">Författare</th>
          </tr>
<?php while(!$rs->getEOF() && $maxrows-- > 0):
?>
          <tr>
            <td><a href="hjul-v.asp?ID=<?=$rs->get("ID")?>"><?=$rs->get("rubrik")?></a> </td>
            <td><?=kortdag($rs->get("datum"))?>
</td>
            <td><?=$rs->get("inknappare")?>
</td>
          </tr>
<?php 
$rs->moveNext();
endwhile;
?>
        </table>
        <p><?php if ($_limit > 0  && $rs->getRecordCount() > $_limit):
$qs = $QUERY_STRING;
$qs = ereg_replace("&_limit=[0-9]+", "", $qs);
if ($qs)
	$qs .= "&";
$qs .= "_limit=-1";?></p>
        <p>Din sökfråga resulterade i upp till <?php  echo "$rows"; ?> träffar. <a href="hjul-v.asp?<?=$qs?>">Klicka
        här för att se alla!?</a></p>
        <p><?php endif;
else:?> </p>
        <div align="center"><center><table border="0" width="75%" bgcolor="#C0C0C0">
          <tr>
            <td width="100%" align="center"><b>Inga poster i databasen stämde överens med den
            sökfråga du ställde.</b><p><a href="javascript:history.go(-1)"><img src="../../images/rodpil_transp.gif" alt="Tillbaka - försök igen" border="0" hspace="3" align="bottom" WIDTH="9" HEIGHT="13"><small><strong>Försök igen </strong></small></a></td>
          </tr>
        </table>
        </center></div><?php endif;?>
<!--webbot bot="Include" U-Include="_hjultabell.htm" TAG="BODY" startspan -->
<div align="center"><center>

<table cellpadding="3" cellspacing="3">
  <tr>
    <td colspan="2"><p align="center"><strong>Leta bland rapporter från inline - cykelturer - vandringar:</strong></td>
  </tr>
  <tr>
    <td><a href="hjul-v12.asp">De 40 senaste turerna</a></td>
    
  </tr>
  
  <tr>
    <td><a href="hjul-s.asp">Fritextsökning</a></td>
    
  </tr>
</table>
</div></div>
<div id="right_column">
</div>
<div id="extra">
<? echo  pageFooter();














