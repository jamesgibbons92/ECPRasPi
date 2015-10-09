<?php
$con = mysql_connect("localhost","root","23456789");

if (!$con) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("printing", $con);

$result=mysql_query("select VendorColour, COUNT(*) AS `Total` from Spools WHERE `MeasuredDiameter` IS NULL AND VendorDiameter = '1.75' GROUP BY VendorColour;");


$date = array();
$date['name'] = 'Total 1.75mm Spools';
$data1 = array();
$data1['name'] = 'Colour';
$data3 = array();
$data3['name'] = 'Total 2.85mm Spools';
$data4 = array();
$data4['name'] = 'Colour';

while($row = mysql_fetch_array($result)) {
        //$acc[] = $row['NumAccepted'];
        $date['data'][] = $row['VendorColour'];
        $data1['data'][] = $row['Total'];

}

$result2 = mysql_query("select VendorColour, COUNT(*) AS Total from Spools WHERE `MeasuredDiameter` IS NULL AND VendorDiameter = '2.85' GROUP BY VendorColour;");

while($row = mysql_fetch_array($result2)) {
	$data3['data'][] = $row['VendorColour'];
	$data4['data'][] = $row['Total'];
}

//}
$acc = array();
array_push($acc,$date);
array_push($acc,$data1);
array_push($acc,$data3);
array_push($acc,$data4);

//array_push($acc,$data2);
print json_encode($acc,JSON_NUMERIC_CHECK);
//while($row = mysql_fetch_array($result)) {
//	echo $row[TraysID] . "\t" . $row[] . "\n";/
//}

mysql_close($con);
?>
