<%
echo pageBeginning ("Skridskonštet - Inskrivaren", "Inskrivaren", 2);
mysql_select_db("sssk");

include "_inskrivaren_v.php";



echo pageEnding();
%>
