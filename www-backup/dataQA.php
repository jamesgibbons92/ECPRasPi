<?php
$con = mysql_connect("localhost","root","23456789");

if (!$con) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("Pieces\ and\ boxes`", $con);

$result = mysql_query("SELECT * FROM QAd\ and\ boxes");

while($row = mysql_fetch_array($result)) {
	echo $row[Date] . "\t" . $row[std H]. "\t" . $row[std Y] . "\t" . $row[std Y-A]. "\t" . $row[std Dot] . "\t" . $row[tch H]. "\n";
}

mysql_close($con);
?>
