<?php checkLogin(4); ?>
<?php echo pageHeader(0, false, "Rapporter", 'Rapporter');?>

<script LANGUAGE="JavaScript">
<!--
var defaultEmptyOK = true

function DatumFelaktigt(nDatum,nTyp)
{
   strMed = "Felaktigt datum\n\n";
   if ( nTyp == 1 )
      strMed = strMed + "Var vänlig ange datum i formatet YYYY-MM-DD\n\n";    
   if ( nTyp == 2 )
      strMed = strMed + "Var vänlig ange ett årtal mellan 1900 och i år\n\n"; 
   if ( nTyp == 3 )
      strMed = strMed + "Var vänlig ange en månad mellan 01 och 12\n\n";      
   if ( nTyp == 4 )
      strMed = strMed + "Var vänlig ange ett dagar mellan 01 och 31\n\n";     
   if ( nTyp == 5 )
      strMed = strMed + "Endast siffror och bindestreck är tillåtna\n\n";     
   if ( nTyp == 6 )
      strMed = strMed + "Felaktigt antal dagar i februari månad\n\n";     
   if ( nTyp == 7 ) {
      strMed = strMed + "Endast 28 dagar i februari\n";
      strMed = strMed + "och inget skottår är det heller\n\n";     
   }
   if ( nTyp == 8 )
      strMed = strMed + "Endast 30 dagar i angiven månad\n\n";     
   if ( nTyp == 9 )
      strMed = strMed + "Endast 31 dagar i angiven månad\n\n";     
   if ( nTyp == 0 )
      strMed = strMed + nDatum.value + " är i framtiden\n\n";     
   strMed = strMed + " ";      
   alert(strMed);
   nDatum.select();
   nDatum.focus();
}

function TidFelaktig(nTid,nTyp)
{
   strMed = "Felektigt tidsangivelse\n\n";
   if ( nTyp == 1 )
      strMed = strMed + "Var vänlig ange tid i formatet HH:mm\n\n";    
   if ( nTyp == 2 )
      strMed = strMed + "Endast siffror och kolon är tillåtna\n\n";    
   if ( nTyp == 3 )
      strMed = strMed + "Var vänlig ange timmar mellan 00 och 24\n\n";    
   if ( nTyp == 4 )
      strMed = strMed + "Var vänlig ange minuter mellan 00 och 59\n\n";    
   if ( nTyp == 5 )
      strMed = strMed + "Ogiltig tidangivelse, efter midnatt\n\n";    
  strMed = strMed + " ";      
  alert(strMed);
  nTid.select();
  nTid.focus();
}

function KontrolleraTid(nTid)
{
   var strTid = ""+nTid.value;

   if (strTid.length > 0 ) {

      if ( strTid.length == 4 && isInteger(strTid) != false ) {
         newstrTid = strTid.substring(0,1) + strTid.substring(1,2) + ":" ;
         newstrTid += strTid.substring(2,3) + strTid.substring(3,4) ;
         strTid = newstrTid ; 
      }

      if ( strTid.length == 3 && isInteger(strTid) != false ) {
         newstrTid = strTid.substring(0,1) + ":" ;
         newstrTid += strTid.substring(1,2) + strTid.substring(2,3) ;
         strTid = newstrTid ; 
      }

      if ( strTid.charAt(2) == "." || strTid.charAt(2) == " " ) {
         newstrTid = strTid.substring(0,1) + strTid.substring(1,2) + ":" ;
         for ( i = 3; i < strTid.length; i++ ) {
             ch = strTid.substring(i, i+1) ;
             newstrTid += ch ;
         }
         strTid = newstrTid ; 
      }

      if ( strTid.charAt(1) == "." || strTid.charAt(1) == " " ) {
         newstrTid = strTid.substring(0,1) + ":" ;
         for ( i = 2; i < strTid.length; i++ ) {
             ch = strTid.substring(i, i+1) ;
             newstrTid += ch ;
         }
         strTid = newstrTid ; 
      }

      if ( strTid.charAt(2) != ":" && strTid.charAt(1) != ":" ) {
         TidFelaktig(nTid,1);
         return "" ;
      }

      strTiddelar = strTid.split(":");
     
      if(isInteger(strTiddelar[0]) == false || isInteger(strTiddelar[1]) == false) {
         TidFelaktig(nTid,2);
         return "" ;
      }
      if(!(strTiddelar[0] >= 0 && strTiddelar[0] <= 24 )) {
         TidFelaktig(nTid,3);
         return nTid.value;
      }
      if(!(strTiddelar[1] >= 0 && strTiddelar[1] <= 59 )) {
         TidFelaktig(nTid,4);
         return nTid.value;
      }
      if( strTiddelar[0] == 24 && strTiddelar[1] > 0 ) {
         TidFelaktig(nTid,5);
         return nTid.value;
      }
      if ( strTid.charAt(1) == ":" ) {
         nyTid = "0" + strTiddelar[0] + ":" + strTiddelar[1] ;
         return nyTid ;
      } else {
         return strTid ;
      }
      return strTid ;
   } 
   return strTid ;
}

function KontrolleraDatum(nDatum)
{
   var strDatum = ""+nDatum.value;
<?php 
$serverYear = date( "Y", mktime(0,0,0,date("m"),date("d"),date("Y")));
$serverMonth = date( "m", mktime(0,0,0,date("m"),date("d"),date("Y")));
$serverDay = date( "d", mktime(0,0,0,date("m"),date("d"),date("Y")));

echo "serverYear=$serverYear;\n";
echo "serverMonth=$serverMonth;\n";
echo "serverDay=$serverDay;\n";
?>


   if(strDatum.length > 0)
   {
      if(strDatum.charAt(4) != "-")
      {
         DatumFelaktigt(nDatum,1);
         return toNumbersAndChar( strDatum, '-') ;
      }
      if(strDatum.charAt(7) != "-")
      {
         DatumFelaktigt(nDatum,1);
         return toNumbersAndChar( strDatum, '-') ;
      }
      strDatumdelar = strDatum.split("-");
      YYYY = strDatumdelar[0] ;
      MM = strDatumdelar[1] ;
      DD = strDatumdelar[2] ;

      if(isInteger(YYYY) == false || isInteger(MM) == false || isInteger(DD) == false) 
      {
         DatumFelaktigt(nDatum,5);
         return toNumbersAndChar( strDatum, '-') ;
      }
      if(!(YYYY >= 1900 && YYYY <= 2100))
      {
         DatumFelaktigt(nDatum,2);
         return strDatum ;
      }
      if(!(MM >= 1 && MM <= 12))
      {
         DatumFelaktigt(nDatum,3);
         return strDatum ;
      }
      if(!(DD >= 1 && DD <= 31))
      {
         DatumFelaktigt(nDatum,4);
             return strDatum ;
      }
      if ( MM == 2 && YYYY/4 == parseInt( YYYY/4 ))
      {
         if ( DD <= 0 || DD > 29 )
         {
             DatumFelaktigt(nDatum,6);
             return strDatum ;
         }
      }
      if ( MM == 2 &&  ( YYYY/4 != parseInt( YYYY/4 ) || YYYY == 1900 || YYYY == 2100 ))
      {
         if ( DD <= 0 || DD > 28 )
         {
             DatumFelaktigt(nDatum,7);
             return strDatum ;
         }
      }    
      if ( MM == 2 || MM == 4 || MM == 6 || MM == 9 || MM == 11 )
      {
         if ( DD <= 0 || DD > 30 )
         {
             DatumFelaktigt(nDatum,8);
             return strDatum ;
         }
      }
      if ( MM == 1 || MM == 3 || MM == 5 || MM == 7 || MM == 8 || MM == 10 || MM == 12 )
      {
         if ( DD <= 0 || DD > 31 )
         {
             DatumFelaktigt(nDatum,9);
             return strDatum ;
         }
      }

      if ( YYYY > serverYear ) {
         DatumFelaktigt(nDatum,0) ;
         return strDatum ;
      }
      if ( YYYY == serverYear && MM > serverMonth ) {
         DatumFelaktigt(nDatum,0) ;
         return strDatum ;
      }

      if ( YYYY == serverYear && MM == serverMonth && DD > serverDay ) {
         DatumFelaktigt(nDatum,0) ;
         return strDatum ;
      }
   } 
   return strDatum ;
}

function isDigit (c)
{   return ((c >= "0") && (c <= "9"))
}

function isEmpty(s)
{   return ((s == null) || (s.length == 0))
}

function isInteger(s)
{   var i;
    if (isEmpty(s)) 
       if (isInteger.arguments.length == 1) return defaultEmptyOK;
       else return (isInteger.arguments[1] == true);
    for (i = 0; i < s.length; i++)
    {   
        var c = s.charAt(i);
        if (!isDigit(c)) return false;
    }
    return true;
}

function isFloat (s)

{   var i;
    var seenDecimalPoint = false;

    if (isEmpty(s)) 
       if (isFloat.arguments.length == 1) return defaultEmptyOK;
       else return (isFloat.arguments[1] == true);

    if (s == ',' || s == '.') return false;

    for (i = 0; i < s.length; i++)
    {   
        // Check that current character is number.
        var c = s.charAt(i);

        if ( (c == ',' || c == '.') && !seenDecimalPoint) seenDecimalPoint = true;
        else if (!isDigit(c)) return false;
    }
    return true;
}

function KontrolleraTal(nTal)
{
   if( isInteger(nTal.value) == false)
   {               
      strMed = "Felaktigt tal inmatat\n\n";
      strMed = strMed + "Endast heltalssiffror är tillåtna i detta fält\n\n"; 
      alert(strMed);
      nTal.select();
      nTal.focus();
      return "";
   } else {
      return nTal.value;
   }
}

function KontrolleraDecimalTal(dTal)
{
   var strTal = ""+dTal.value;
   newTal = "";
   if ( isFloat(strTal) != false ) {
      for (i = 0; i < strTal.length; i++) {
         ch = strTal.substring(i, i+1);
         if (ch == ",") {
            newTal += '.' ;
         } else {
            newTal += ch ;
         }
      }
      return newTal ;
   }

   if ( isFloat(dTal.value) == false) {              
      strMed = "Felaktigt decimaltal inmatat\n\n";
      strMed = strMed + "Endast heltal eller decimaltal tillåtna i detta fält\n\n";        
      alert(strMed);
      dTal.select();
      dTal.focus();
      return "";
   }   
}

function toDNumbers(checkString)
{
    newString = "";
    count = 0;
    for (i = 0; i < checkString.length; i++) {
       ch = checkString.substring(i, i+1);
       if ((ch >= "0" && ch <= "9") || (ch == ",")) {
          newString += ch;
       }
    }
    return newString;
}

function toNumbers(checkString)
{
    newString = "";
    count = 0;
    for (i = 0; i < checkString.length; i++) {
       ch = checkString.substring(i, i+1);
       if (ch >= "0" && ch <= "9") {
          newString += ch;
       }
    }
    return newString;
}

function toNumbersAndChar( checkString, c)
{
    newString = "";
    count = 0;
    for (i = 0; i < checkString.length; i++) {
       ch = checkString.substring(i, i+1);
       if ((ch >= "0" && ch <= "9") || (ch == c)) {
          newString += ch;
       }
    }
    return newString;
}


function checkRequiredFields(input)
{
    var requiredFields = new Array("datum",
                                   "rubrik");
    var fieldNames = new Array("Datum",
                               "Rubrik");

    var fieldCheck   = true;
    var fieldsNeeded = "\nUppgifter saknas i följande obligatoriska " +
                       "fält:\n\n\t";

    for(var fieldNum=0; fieldNum < requiredFields.length; fieldNum++) {
        if ((input.elements[requiredFields[fieldNum]].value == "") ||
            (input.elements[requiredFields[fieldNum]].value == " ")) {

            fieldsNeeded += fieldNames[fieldNum] + "\n\t";
            fieldCheck = false;
        }
    }
    if (fieldCheck == true) {
        return true;
    } else {
        alert(fieldsNeeded);
        return false;
    }
}
//-->
</script>





<div id="wrapper">
<div id="main"><br>

<?php 
$entityName="Hjul";
require "editpage.php";

$form->addEntityField($entity, "omrade");
$form->addEntityField($entity, "sasong");
$form->loadFromRecordset($rs);?>
<form NAME="fardrapp" onSubmit="return checkRequiredFields(this)" method="POST" action="hjul-v.asp">
      <input type="hidden" name="ID" value="<?=$ID?>"><table BORDER="0">
        <tr>
          <td colspan="4" align="left" valign="top"><?php $fmb->echoEditPageButtons($sm, $rows);?>
</td>
        </tr>
        <tr>
          <td colspan="2" align="left" valign="top" bgcolor="#E0E0E0"><small>Fält märkta med <font color="#FF0000">*</font> är obligatoriska fält som mäste fyllas i.<br>
          </small></td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b><font color="#FF0000">*</font>&nbsp; Rubrik:</b></small></td>
          <td COLSPAN="3"><input type="text" name="rubrik" value="<?=$rs->get("rubrik");?>" maxlength="128" size="50"> </td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Åkområde:</b></small></td>
          <td><?php $form->show("omrade");?>
</td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b><font color="#FF0000">*</font>&nbsp; Datum:</b></small></td>
          <td><input type="text" name="datum" value="<?=$rs->get("datum")?>" maxlength="10" size="10" onBlur="this.value=KontrolleraDatum(this)"> &nbsp;<small>På formen 1998-12-24</small></td>
          <td align="right" valign="top"><small><b>Säsong:</b></small></td>
          <td><?php $form->show("sasong");?>
</td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Slutdatum:</b></small></td>
          <td colspan="3"><input type="text" name="slutdatum" value="<?=$rs->get("slutdatum")?>" maxlength="60" size="10" onBlur="this.value=KontrolleraDatum(this)"> &nbsp;<small>Ifylles
          endast vid övernattningsturer, på formen 1998-12-25</small></td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Författare:</b></small></td>
          <td><input type="text" name="inknappare" value="<?=$rs->get("inknappare");?>" maxlength="140" size="20"> </td>
          <td align="right" valign="top"><small><b>Färdlängd (km):</b></small></td>
          <td><input type="text" name="fardlangd" value="<?=$rs->get("fardlangd");?>" maxlength="255" size="5" onBlur="this.value=KontrolleraDecimalTal(this)"> <small>Siffror,
          tack!</small></td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Samling plats:</b></small></td>
          <td><input type="text" name="samling_plats" value="<?=$rs->get("samling_plats")?>" maxlength="50" size="20"> </td>
          <td align="right" valign="top"><small><b>Samling tid:</b></small></td>
          <td><input type="text" name="samling_tid" value="<?=$rs->get("samling_tid")?>" maxlength="50" size="7" onBlur="this.value=KontrolleraTid(this)">&nbsp;<small>På formen
          08:30</small></td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Färdmedel ut:</b></small></td>
          <td><input type="text" name="fardmedel_ut" value="<?=$rs->get("fardmedel_ut")?>" maxlength="128" size="20"> </td>
          <td align="right" valign="top"><small><b>Färdmedel hem:</b></small></td>
          <td><input type="text" name="fardmedel_hem" value="<?=$rs->get("fardmedel_hem")?>" maxlength="70" size="20"> </td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Färdstart plats:</b></small></td>
          <td><input type="text" name="fardstart_plats" value="<?=$rs->get("fardstart_plats")?>" maxlength="128" size="20"> </td>
          <td align="right" valign="top"><small><b>Färdstart tid:</b></small></td>
          <td><input type="text" name="fardstart_tid" value="<?=$rs->get("fardstart_tid")?>" maxlength="128" size="7" onBlur="this.value=KontrolleraTid(this)"> <small>På formen 10:15</small></td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Färdslut plats:</b></small></td>
          <td><input type="text" name="fardslut_plats" value="<?=$rs->get("fardslut_plats")?>" maxlength="70" size="20"> </td>
          <td align="right" valign="top"><small><b>Färdslut tid:</b></small></td>
          <td><input type="text" name="fardslut_tid" value="<?=$rs->get("fardslut_tid")?>" maxlength="128" size="7" onBlur="this.value=KontrolleraTid(this)"> <small>På formen 14:30</small>
          </td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Kartor:</b></small></td>
          <td COLSPAN="3"><textarea name="kartor" rows="5" cols="55" wrap><?=$rs->get("kartor")?></textarea></td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Färdväg:</b></small></td>
          <td COLSPAN="3"><textarea name="fardvag" rows="10" cols="55" wrap><?=$rs->get("fardvag")?></textarea></td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Omständigheter:</b></small></td>
          <td COLSPAN="3"><textarea name="tips" rows="5" cols="55" wrap><?=$rs->get("tips")?></textarea></td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Mat- och vätskehak:</b></small></td>
          <td COLSPAN="3"><textarea name="mathak" rows="5" cols="55" wrap><?=$rs->get("mathak")?></textarea></td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Deltagare:</b></small></td>
          <td COLSPAN="3"><textarea name="deltagare" rows="3" cols="55" wrap><?=$rs->get("deltagare")?></textarea></td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Sevärdheter:</b></small></td>
          <td COLSPAN="3"><textarea name="sevart" rows="5" cols="55" wrap><?=$rs->get("sevart")?></textarea></td>
		  <td align="right"><p align="left"><a href="#" onClick="window.open('http://sik.skridsko.net/skridskonet/bild/bild-r.asp','mywindow','width=920,height=480,toolbar=no,location=no,directories=no,statu s=no,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')">Ladda upp bild här</a> <br />kopiera länkadressen inklusive taggar<br/> (&lt;a...a&gt;) och klistra in här<br/> OBS: ange ej något rapportnummer</p></td>
        </tr>
        <tr>
          <td align="right" valign="top"><small><b>Tillbud och olyckor:</b></small></td>
          <td COLSPAN="3"><textarea name="tillbud" rows="5" cols="55" wrap><?=$rs->get("tillbud")?></textarea></td>
        </tr>
        <tr>
          <td colspan="4" align="left" valign="top"><?php $fmb->echoEditPageButtons($sm, $rows);?>
</td>
        </tr>
      </table>
    </form>
    <!--webbot bot="Include" U-Include="_hjultabell.htm" TAG="BODY" startspan -->
<div align="center"><center>

<table cellpadding="3" cellspacing="3">
  <tr>
    <td colspan="2"><p align="center"><strong>Leta bland rapporter från inline - vandringar - cykelturer:</strong></td>
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


