<?php
$con = mysql_connect("localhost","root","23456789");

if (!$con) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("printing", $con);

$result = mysql_query("SELECT * FROM PrintRuns");

while($row = mysql_fetch_array($result)) {
	echo $row[NumAccepted] . "\t" . $row[NumBorderline]. "\n";
}

mysql_close($con);
?>
