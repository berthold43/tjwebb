<?php
checkLoginSIK(0); 
?>
<?php echo pageHeader(0, false, "Rapporter", 'Rapporter');?>
<div id="wrapper">
<div id="main"><br>
<h3>De 60 senast genomf�rda turerna:</h3>
    <p><?php $entityName="Hjul";
require "viewpage.php";
require "veckodagar.php";

$conn = new ADO_Connection;
//$conn->open("database=sssk", "httpd", "hg78nbgFjfg");
$rs = new ADO_Recordset;  

$stmt = "SELECT ID,rubrik,datum,inknappare FROM hjul ORDER BY datum DESC LIMIT 60";
$rs->open($stmt, $conn, adForwardOnly, adLockReadOnly, adCmdText);
?> </p>
    <p>F�r att l�sa en viss f�rdrapport, klicka p� rubriken i listan nedan</p>

<div style="text-align:left;">
<table style="width:90%;">
<tr class="rubrad"><td style="width:45%;"><b>Rubrik</b></td><td style="width:15%;"><b>Datum</b></td><td style="width:30%;"><b>F�rfattare</b></td></tr>


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
<p><a href="hjul-r.asp">Klicka h�r</a> f�r att skriva in en ny rapport!</p>
    <p>F�r generell s�kning bland alla f�rdrapporter <a href="hjul-s.asp">klicka h�r</a>! </p>
    <!--webbot bot="Include" U-Include="_hjultabell.htm" TAG="BODY" startspan -->
<div align="center"><center>

<table cellpadding="3" cellspacing="3">
  <tr>
    <td colspan="2"><p align="center"><strong>Leta bland rapporter fr�n inline-vandringar-cykelturer:</strong></td>
  </tr>
  <tr>
    <td><a href="hjul-v13.asp">De 40 senaste turerna</a></td>
    
  </tr>
  
  <tr>
    <td><a href="hjul-s.asp">Fritexts�kning</a></td>
    
  </tr>
</table>

</div>
<div id="right_column">
</div></div></div>
<div id="extra">
<? echo  pageFooter();


