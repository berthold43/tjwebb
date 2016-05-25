<?php
checkLogin(4);?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Inline-vandringar-cykelturer</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta name="generator" content="HAPedit 3.1">
<style type="text/css">
html,body{margin:0;padding:0}
body{font: 80% arial,sans-serif;text-align:center}
p{margin:0 10px 10px 0px}
h1{margin:0 15px 0 0px}
h2 {margin:5px 0px 5px 0px;color: #000080; font-family: Verdana; font-size: 16px}
h3 {margin:0 0px 0 0px; font-family: Verdana; font-size: 12px}
a:link {color:#0000FF; text-decoration:none}
a:visited {color:#333399; text-decoration:none}
a:hover {color:#FFA500; text-decoration:none}
div#header img{float:right;border:0px none;}
div#header h1{height:90px;line-height:80px;margin:0;
  padding-left:10px;background: #FFFFFF;color: #000000}
div#header1{
font-size:14px;
height: 20px;
width: 100%;
background-color: #C0C0C0;
color: #FFFFFF;
text-align: center;
}
div#header2{
font-size:14px;
height: 12px;
width: 100%;
background-color: #FFFFFF;
color: #0000FF;
text-align: left;
}
div#container{text-align:left}
div#content p{line-height:1.4}
div#navigation{background:#FFFFFF}
div#extra{background:#FFFFFF}
div#footer{background: #333;color: #FFF}
div#footer p{margin:0;padding:5px 10px}
div#container{width:726px;margin:0 auto}
div#navigation{float:left;width:510px}
div#extra{float:right;width:350px}
div#footer{clear:both;width:100%}
</style>
</head>
<body>
<div id="container">
<div id="header"><a href="../index.htm"><img src="../../images/logo.jpg" alt="logo" width="150" height="82"></a><h1>Skånes Isseglarklubb - SIK</h1></div>
<div id="header1"> <a href="../../isinformation/index.htm">Isinformation</a>&nbsp; |&nbsp; <a href="../../skridskosegling/index.htm">Skridskosegling</a> &nbsp;| &nbsp;<a href="../../langfardsskridsko/index.htm">Långfärdsskridsko</a>&nbsp; 
  |&nbsp; <a href="../index.htm">Andra aktiviteter</a>&nbsp; |&nbsp; <a href="../../om_sik/index.htm">Om Sik</a>&nbsp; |&nbsp; <a href="../../vanliga_fragor/index.htm">Vanliga frågor</a>&nbsp; | &nbsp;<a href="../../kontakta_oss/index.htm">Kontakt</a> 
</div>
<div id="header2"><a href="../inlines.htm">Inline</a>&nbsp; | &nbsp;<a href="../hjul/hjul-v12.asp">Inline-cykel-vandringsrapporter</a></div>

<div id="wrapper">
<div id="content"><br>
<h3>De 12 senast inmatade turerna</h3>
<p><?php $entityName="Hjul";
require "viewpage.php";
require "veckodagar.php";

$conn = new ADO_Connection;
$conn->open("database=sssk", "httpd", "hg78nbgFjfg");
$rs = new ADO_Recordset;  

$stmt = "SELECT ID,rubrik,datum,inknappare FROM hjul ORDER BY ID DESC LIMIT 12";
$rs->open($stmt, $conn, adForwardOnly, adLockReadOnly, adCmdText);
?> För att läsa en viss färdrapport, klicka på rubriken i listan nedan</p>
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
<br>
    <p>För generell sökning bland alla färdrapporter från inlineturer, <a href="hjul-s.asp">klicka här</a>! </p>
    <!--webbot bot="Include" U-Include="_hjultabell.htm" TAG="BODY" startspan -->
<div align="center"><center>

<table cellpadding="3" cellspacing="3">
  <tr>
    <td colspan="2"><p align="center"><strong>Leta bland rapporter från inline - cykelturer -vandringar:</strong></td>
  </tr>
  <tr>
    <td><a href="hjul-v12.asp">De 25 senaste turerna</a></td>
    <td><a href="hjul-v12i.asp">De tolv senast inmatade rapporterna</a></td>
  </tr>
  <tr>
    <td><a href="hjul-vsm.asp">Rapporter från den senaste månaden</a></td>
    
  </tr>
  <tr>
    <td><a href="hjul-s.asp">Fritextsökning</a></td>
    
  </tr>
</table>
</div></div>
<div id="navigation">
</div>
<div id="extra">
</div>
<div id="footer"><p>SKÅNES ISSEGLARKLUBB  -  SIK</p></div>
</div>
</body>
</html>


















