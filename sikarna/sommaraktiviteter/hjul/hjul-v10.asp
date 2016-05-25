<?php checkLogin(0); ?>
<html>
<head>
<title>SIK - Inlinerapporter - 12 senaste</title>
<link rel="stylesheet" href="../../sikenkel.css">
<meta name="Microsoft Border" content="none">
</head>
<body stylesrc="../../_webbots/style.htm" leftmargin="0" background="/images/backgnd.gif">
<!--webbot bot="Include" U-Include="../../_webbots/sidhuvud.htm" TAG="BODY" startspan -->
<div align="left">

<table border="0" width="600" cellspacing="3" cellpadding="3">
  <tr>
    <td valign="top"><a href="/index.htm"><img src="../../images/logo.jpg" alt="Till förstasidan" border="0" WIDTH="98" HEIGHT="63"></a><br>
    <img src="/images/filler_120.gif" width="120" height="1" alt=""></td>
    <td width="100%" align="left"><h1 align="left" class="sidtitel">Dom 12 senaste Inline - Vandringar - Cykelturer</h1>
    </td>
  </tr>
</table>
</div>
<!--webbot bot="Include" endspan i-checksum="43520" -->
<div align="left">

<table border="0" width="100%" cellspacing="3" cellpadding="3">
  <tr>
    <td valign="top"><!--webbot bot="Include" U-Include="../../_webbots/navbar_databas.htm" TAG="BODY" startspan -->
<div align="left">

<table border="0" width="96" cellpadding="2">
<?php  include "newuser.php"; ?>
  <tr>
    <td width="100%" valign="top" align="left">
    <a class="navbar"
    href="javascript:history.go(-1)">Tillbaka</a></td>
  </tr>
</table>
</div>
<!--webbot bot="Include" endspan i-checksum="55282" -->
<!--webbot bot="Include" U-Include="../../_webbots/navbar.htm" TAG="BODY" startspan -->
<div align="left">

<table border="0" width="120" cellpadding="2">
  <tr>
    <td width="100%"><a class="navbar" href="/index.htm">Förstasidan</a></td>
  </tr>

<?php  if ($userlevel > 1) { echo "  <tr>\n    <td width=\"100%\"><a class=\"navbar\" href=\"/medlem/isnytt.htm\">Isnytt</a></td>\n  </tr>\n"; } ?>  
  
  
<?php  if ($userlevel > 1) { echo "  <tr>\n    <td width=\"100%\"><a class=\"navbar\" href=\"/medlem/soktips.htm\">Söktips</a></td>\n  </tr>\n";  } ?>  
  
 
 
 
</table>
</div>
<!--webbot bot="Include" endspan i-checksum="40904" -->
<p><img src="../../images/filler_120.gif" alt="filler_120.gif (51 bytes)" WIDTH="120" HEIGHT="1"> </td>
    <td width="100%" valign="top"><h3>De tolv senast genomförda turerna:</h3>
    <p><?php $entityName="Hjul";
require "viewpage.php";
require "veckodagar.php";

$conn = new ADO_Connection;
$conn->open("database=sssk", "httpd", "hg78nbgFjfg");
$rs = new ADO_Recordset;  

$stmt = "SELECT ID,rubrik,datum,inknappare FROM hjul ORDER BY datum DESC LIMIT 12";
$rs->open($stmt, $conn, adForwardOnly, adLockReadOnly, adCmdText);
?> </p>
    <p>För att läsa en viss färdrapport, klicka på rubriken i listan nedan</p>
    <table border="0" cellpadding="2" cellspacing="0">
      <tr>
        <th align="left" bgcolor="#C0C0C0">Rubrik</th>
        <th align="left" bgcolor="#C0C0C0">Datum</th>
        <th align="left" bgcolor="#C0C0C0">Författare</th>
      </tr>
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
<p><a href="hjul-r.asp">Klicka här</a> för att skriva in en ny rapport!</p>
    <p>För generell sökning bland alla färdrapporter <a href="hjul-s.asp">klicka här</a>! </p>
    <!--webbot bot="Include" U-Include="_hjultabell.htm" TAG="BODY" startspan -->
<div align="center"><center>

<table cellpadding="3" cellspacing="3">
  <tr>
    <td colspan="2"><p align="center"><strong>Leta bland rapporter från inlineturer:</strong></td>
  </tr>
  <tr>
    <td><a href="hjul-v12.asp">De tolv senaste turerna</a></td>
    <td><a href="hjul-v12i.asp">De tolv senast inmatade rapporterna</a></td>
  </tr>
  <tr>
    <td><a href="hjul-vsm.asp">Rapporter från den senaste månaden</a></td>
    
  </tr>
  <tr>
    <td><a href="hjul-s.asp">Fritextsökning</a></td>
    
  </tr>
</table>
</center></div>
<!--webbot bot="Include" endspan i-checksum="23116" -->
</td>
  </tr>
</table>
</div>
</body>
</html>
