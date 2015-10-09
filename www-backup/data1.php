<?php
$con=mysql_connect('localhost','root','23456789');

if (!$con) {
        die('Could not connect: ' . mysql_error());
}


mysql_select_db("printing", $con);
$result=mysql_query('SELECT Shortname, NumAccepted, date(EndTime) from PrintRuns,Trays,TrayModels,Models WHERE ModelsID=Models.ID AND TrayModels.TraysID=Trays.ID AND PrintRuns.TraysID=Trays.ID;');
while($row = mysql_fetch_array($result)) {
  echo $row['Shortname'] . "\t" . $row['NumAccepted'] . "\t" . $row['date(EndTime)']. "\n";
}

mysql_close($con);
?>
