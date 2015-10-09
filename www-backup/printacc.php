<?php
$con = mysql_connect("localhost","root","23456789");

if (!$con) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("printing", $con);

$result = mysql_query("SELECT NumAccepted, NumBorderline, date(EndTime) FROM PrintRuns");


$date = array();
$date['name'] = 'Date';
$data1 = array();
$data1['name'] = 'NumAccepted';
$data2 = array();
$data2['name'] = 'Borderline';

while($row = mysql_fetch_array($result)) {
	//$acc[] = $row['NumAccepted'];
	$date['data'][] = $row['date(EndTime)'];
	$data1['data'][] = $row['NumAccepted'];
	$data2['data'][] = $row['NumBorderline']; 
}

//$printerID = mysql_query("SELECT ID,Model FROM printers");
//Printer = array();
//$Printer['name'] = 'Printer';

//while ($row = mysql_fetch_array($printerID)) {
//	$Printer['data'][] = $row['Model'];
//}
$acc = array();
array_push($acc,$date);
array_push($acc,$data1);
array_push($acc,$data2);

print json_encode($acc,JSON_NUMERIC_CHECK);
//while($row = mysql_fetch_array($result)) {
//	echo $row[TraysID] . "\t" . $row[] . "\n";/
//}

mysql_close($con);
?>
