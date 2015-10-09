<?php
$con = mysql_connect("localhost","root","23456789");

if (!$con) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("printing", $con);

$result=mysql_query("SELECT Spools.ID, VendorColour, ((VendorKilos-(sum(FilamentMass)))*1000) AS 'Filament Left (g)' , VendorKilos FROM Spools, PrintRuns WHERE SpoolsID = Spools.ID AND PrintersID='1' GROUP BY Spools.ID ORDER BY Spools.ID DESC LIMIT 1;");


$date = array();
$date['name'] = 'Colour';
$data1 = array();
$data1['name'] = 'Filament Left';
$data3 = array();

while($row = mysql_fetch_array($result)) {
        //$acc[] = $row['NumAccepted'];
        $date['data'][] = $row['VendorColour'];
        $data1['data'][] = $row['Filament Left (g)'];

}

$result2 = mysql_query("SELECT Spools.ID, VendorColour, ((VendorKilos-(sum(FilamentMass)))*1000) AS 'Filament Left (g)' , VendorKilos FROM Spools, PrintRuns WHERE SpoolsID = Spools.ID AND PrintersID='2' GROUP BY Spools.ID ORDER BY Spools.ID DESC LIMIT 1;");

while($row = mysql_fetch_array($result2)) {
	$date['data'][] = $row['VendorColour'];
	$data1['data'][] = $row['Filament Left (g)'];
}

//}
$acc = array();
array_push($acc,$date);
array_push($acc,$data1);



//array_push($acc,$data2);
print json_encode($acc,JSON_NUMERIC_CHECK);
//while($row = mysql_fetch_array($result)) {
//	echo $row[TraysID] . "\t" . $row[] . "\n";/
//}

mysql_close($con);
?>
