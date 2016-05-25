<?php
checkLoginSIK(0); 
?>
<?php echo pageHeader(0, false, "Rapporter", 'Rapporter');?>
<div id="wrapper">
<div id="main"><br>
<h3>De 60 senast genomförda turerna:</h3>
    <p><?php $entityName="Hjul";
require "viewpage.php";
require "veckodagar.php";

$conn = new ADO_Connection;
//$conn->open("database=sssk", "httpd", "hg78nbgFjfg");
$rs = new ADO_Recordset;  

$stmt = "SELECT ID,rubrik,datum,inknappare FROM hjul ORDER BY datum DESC LIMIT 60";
$rs->open($stmt, $conn, adForwardOnly, adLockReadOnly, adCmdText);
?> </p>
    <p>För att läsa en viss färdrapport, klicka på rubriken i listan nedan</p>

<div style="text-align:left;">
<table style="width:90%;">
<tr class="rubrad"><td style="width:45%;"><b>Rubrik</b></td><td style="width:15%;"><b>Datum</b></td><td style="width:30%;"><b>Författare</b></td></tr>


<?php while(!$rs->getEOF()):?>
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
<br>
<p><a href="hjul-r.asp">Klicka här</a> för att skriva in en ny rapport!</p>
    <p>För generell sökning bland alla färdrapporter <a href="hjul-s.asp">klicka här</a>! </p>
    <!--webbot bot="Include" U-Include="_hjultabell.htm" TAG="BODY" startspan -->
<div align="center"><center>

<table cellpadding="3" cellspacing="3">
  <tr>
    <td colspan="2"><p align="center"><strong>Leta bland rapporter från inline-vandringar-cykelturer:</strong></td>
  </tr>
  <tr>
    <td><a href="hjul-v13.asp">De 40 senaste turerna</a></td>
    
  </tr>
  
  <tr>
    <td><a href="hjul-s.asp">Fritextsökning</a></td>
    
  </tr>
</table>

</div>
<div id="right_column">
</div></div></div>
<div id="extra">
<? echo  pageFooter();


