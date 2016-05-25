<?php checkLogin(0); ?>
<?php echo pageHeader(0, false, "Rapporter", 'Rapporter');?>
<div id="wrapper">
<div id="main"><br>
<h3>Välkommen till söksidan för rapporter från Inline - vandringar - cykelturer!
    Härifrån kan du söka i alla lagrade rapporter.</h3><br> <form method="GET" action="hjul-v.asp">

<?php 
$entityName = "Hjul";
include "searchpage.php";

?>
      <table border="0" cellpadding="2" cellspacing="0" width="100%">
        <tr>
          <td><?php $fmb->echoQueryPageButtons($sm);?>
</td>
          <td><div align="right"><p><small><strong><font face="Arial">Sortering:</font></strong></small>
          <select name="_order" size="1">
            <option selected value="datum DESC">Datum (senaste först)</option>
            <option value="datum">Datum (älsta först)</option>
            <option value="datum DESC,inknappare">Datum (senaste först), Författare</option>
            <option value="datum,inknappare">Datum (älsta först), Författare</option>
            <option value="inknappare,datum DESC">Författare, Datum</option>
            <option value="inknappare DESC,datum DESC">Författare i omvänd ordning, Datum</option>
            <option value="rubrik">Rubriker</option>
            <option value="rubrik DESC">Rubriker i omvänd ordning</option>
          </select></td>
        </tr>
      </table>
      <p><?php if (!$_advanced):?></p>
      <p><input type="text" name="freetext" size="55"><br>
      <a href="<?="$SCRIPT_NAME?_advanced=1"?>">Avancerad sökning</a><br>
<?php else:
if ($_help) {?>      </p>
      <!--webbot bot="Include" U-Include="../_sokoperatorer.htm" TAG="BODY" startspan -->
<div align="left">

<table border="1" bgcolor="#E0E0E0" width="100%">
  <tr>
    <td align="left" valign="top"><p align="center"><font face="Arial,Helvetica"><strong>Sökoperatorer
    för avancerad sökning</strong></font></p>
    <div align="center"><center><table border="0" cellspacing="1" cellpadding="2">
      <tr>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1"><strong>=</strong></font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">&quot;Är
        odefinierad&quot;</font></td>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1"><strong>&gt;</strong></font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">&quot;Större
        än&quot;</font></td>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1"><strong>&gt;=</strong></font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">&quot;Större än <br>
        eller lika med&quot;</font></td>
      </tr>
      <tr>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1"><strong>&lt;</strong></font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">&quot;Mindre
        än&quot;</font></td>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1"><strong>&lt;=</strong></font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">&quot;Mindre än <br>
        eller lika med&quot;</font></td>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1"><strong>&lt;&gt;</strong></font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">&quot;Skilt
        från&quot;, <br>
        &quot;ej lika med&quot; </font></td>
      </tr>
      <tr>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1">n1...n2</font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">&quot;Mellan&quot;,
        t. ex. &quot;1...20&quot;</font></td>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1">!</font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">Negerar villkoret</font></td>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1">?</font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">Matchar ett tecken</font></td>
      </tr>
      <tr>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1">*</font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">Matchar noll<br>
        eller flera tecken</font></td>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1">&amp;</font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">&quot;Och&quot;</font></td>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1">|</font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">&quot;Eller&quot;</font></td>
      </tr>
      <tr>
        <td valign="top" align="center"><font color="#0000FF" face="Arial,Helvetica" size="-1">( )</font></td>
        <td valign="top" align="left"><font face="Arial,Helvetica" size="-1">Med parenteser kan
        man<br>
        gruppera i flera nivåer t. ex.<br>
        <font color="#0000FF">(</font>Amanda<font color="#0000FF">*|</font>Bertil<font
        color="#0000FF">*)&amp;*</font>Carlsson</font></td>
        <td valign="top" align="center"></td>
        <td valign="top" align="left"></td>
        <td valign="top" align="center"></td>
        <td valign="top" align="left"></td>
      </tr>
    </table>
    </center></div><p align="center"><font face="Arial,Helvetica" size="-1"><a
    href="<?="$SCRIPT_NAME?_advanced=1&_help=0"?>">Ta bort denna hjälpruta</a></font></td>
  </tr>
</table>
</div>
<!--webbot bot="Include" endspan i-checksum="45256" -->
<p><?php }
else {
?></p>
      <p><a href="<?="$SCRIPT_NAME?_advanced=1&_help=1"?>">Hjälp - sökoperatorer</a></p>
      <p><?php }
$form->addEntityField($entity, "omrade");
$form->addEntityField($entity, "sasong");
?> </p>
      <table>
        <tr>
          <td align="right" valign="top"><b>Rubrik:</b></td>
          <td><input type="text" name="rubrik" value size="50"> </td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Område:</b></td>
          <td><?php $form->show("omrade");?>
</td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Säsong:</b></td>
          <td><?php $form->show("sasong");?>
</td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Datum:</b></td>
          <td><input type="text" name="datum" value size="15"> </td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Slutdatum:</b></td>
          <td><input type="text" name="slutdatum" value size="15"> </td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Författare:</b></td>
          <td><input type="text" name="inknappare" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Färdlängd:</b></td>
          <td><input type="text" name="fardlangd" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Samlingsplats:</b></td>
          <td><input type="text" name="samling_plats" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Samlingstid:</b></td>
          <td><input type="text" name="samling_tid" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Färdmedel ut:</b></td>
          <td><input type="text" name="fardmedel_ut" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Färdmedel hem:</b></td>
          <td><input type="text" name="fardmedel_hem" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Färdstart plats:</b></td>
          <td><input type="text" name="fardstart_plats" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Färdstart tid:</b></td>
          <td><input type="text" name="fardstart_tid" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Färdslut plats:</b></td>
          <td><input type="text" name="fardslut_plats" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Färdslut tid:</b></td>
          <td><input type="text" name="fardslut_tid" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Kartor:</b></td>
          <td><input type="text" name="kartor" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Färdväg:</b></td>
          <td><input type="text" name="fardvag" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Omständigheter:</b></td>
          <td><input type="text" name="tips" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Mat- och vätskehak:</b></td>
          <td><input type="text" name="mathak" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Deltagare:</b></td>
          <td><input type="text" name="deltagare" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Sevärdheter:</b></td>
          <td><input type="text" name="sevart" value size="50"></td>
        </tr>
        <tr>
          <td align="right" valign="top"><b>Tillbud och olyckor:</b></td>
          <td><input type="text" name="tillbud" value size="50"> </td>
        </tr>
      </table>
<?php $fmb->echoQueryPageButtons($sm);?>
<?php endif;?>
    </form>
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
















