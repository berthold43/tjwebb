<%
echo pageBeginning ("Skridskon�tet - Inskrivaren", "Inskrivaren", 2);
mysql_select_db("sssk");
include "_inskrivaren_s.php";


echo pageEnding();
%>
