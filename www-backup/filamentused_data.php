<?php
$con = mysql_connect("localhost","root","23456789");

if (!$con) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("printing", $con);

//$result = mysql_query(" SELECT ID AS 'Production pieces', sum(FilamentMass) AS 'Filament Used' FROM PrintRuns WHERE TraysID NOT IN (31, 35, 36, 37 ,38);");
// produciton pieces
$data = array();
$data['name'] = 'Type';
$data1 = array();
$data1['name'] = 'Filament Used';
//while($row = mysql_fetch_array($result)) {
        //$acc[] = $row['NumAccepted'];
//        $data['data'][] = ['Production Pieces'];
//	$data1['data'][] = $row['Filament Used'];
//}

//$data2 = array();
//$data2['name'] = '3D hubs';
$result2 = mysql_query("SELECT ID AS '3D Hubs', sum(FilamentMass) AS 'Filament Used' FROM PrintRuns WHERE TraysID = '35' OR TraysID = '36';");
// 3dhubs
while($row = mysql_fetch_array($result2)) {
	$data['data'][] = ['3D hubs'];
	$data1['data'][] = $row['Filament Used'];
}

$result3 = mysql_query("SELECT ID AS 'R&D', sum(FilamentMass) AS 'Filament Used' FROM PrintRuns WHERE TraysID = '37';");
// RND
while($row = mysql_fetch_array($result3)) {
        $data['data'][] = ['R&D'];
        $data1['data'][] = $row['Filament Used'];
}

$result4 = mysql_query("SELECT ID AS 'Random Things', sum(FilamentMass) AS 'Filament Used' FROM PrintRuns WHERE TraysID = '31';");
// Random things
while($row = mysql_fetch_array($result4)) {
        $data['data'][] = ['Guest prints'];
        $data1['data'][] = $row['Filament Used'];
}

$result5 = mysql_query("SELECT ID AS 'PM', sum(FilamentMass) AS 'Filament Used' FROM PrintRuns WHERE TraysID = '38';");
// Tests
while($row = mysql_fetch_array($result5)) {
        $data['data'][] = ['Printer Maintenance/Test prints'];
        $data1['data'][] = $row['Filament Used'];
}


//}
$acc = array();
array_push($acc,$data);
array_push($acc,$data1);



//array_push($acc,$data2);
print json_encode($acc,JSON_NUMERIC_CHECK);
//while($row = mysql_fetch_array($result)) {
//	echo $row[TraysID] . "\t" . $row[] . "\n";/
//}

mysql_close($con);
?>
