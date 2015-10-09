<?php
$con = mysql_connect("localhost","root","23456789");

if (!$con) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("printing", $con);

$result=mysql_query("select date(EndTime), SUM(IFNULL((SELECT Amount FROM Models WHERE Shortname='H' AND ModelsID=Models.ID AND TrayModels.TraysID=Trays.ID AND PrintRuns.TraysID=Trays.ID),0)) as 'std H', SUM(IFNULL((SELECT Amount FROM Models WHERE Shortname='Y' AND ModelsID=Models.ID AND TrayModels.TraysID=Trays.ID AND PrintRuns.TraysID=Trays.ID),0)) as 'std Y',   SUM(IFNULL((SELECT Amount FROM Models WHERE Shortname='Y-Arm' AND ModelsID=Models.ID AND TrayModels.TraysID=Trays.ID AND PrintRuns.TraysID=Trays.ID),0)) as 'std Y-Arm',  SUM(IFNULL((SELECT Amount FROM Models WHERE Shortname='Tch Y' AND ModelsID=Models.ID AND TrayModels.TraysID=Trays.ID AND PrintRuns.TraysID=Trays.ID),0)) as 'tch Y', SUM(IFNULL((SELECT Amount FROM Models WHERE Shortname='Tch H' AND ModelsID=Models.ID AND TrayModels.TraysID=Trays.ID AND PrintRuns.TraysID=Trays.ID),0)) as 'tch H', SUM(IFNULL((SELECT Amount FROM Models WHERE Shortname='Tch D' AND ModelsID=Models.ID AND TrayModels.TraysID=Trays.ID AND PrintRuns.TraysID=Trays.ID),0)) as 'tch Dot' FROM PrintRuns,Trays,TrayModels,Models WHEre ModelsID=Models.ID AND TrayModels.TraysID=Trays.ID  AND PrintRuns.TraysID=Trays.ID AND DATE(EndTime) > (NOW() - INTERVAL 28 DAY) GROUP BY date(EndTime);
");

$date = array();
$date['name'] = 'Date';
$data1 = array();
$data1['name'] = 'std H';
$data2 = array();
$data2['name'] = 'std Y';
$data3 = array();
$data3['name'] = 'std Y-Arm';
$data4 = array();
$data4['name'] = 'tch Y';
$data5 = array();
$data5['name'] = 'tch H';
$data6 = array();
$data6['name'] = 'tch Dot';

while($row = mysql_fetch_array($result)) {
        //$acc[] = $row['NumAccepted'];
        $date['data'][] = $row['date(EndTime)'];
        $data1['data'][] = $row['std H'];
        $data2['data'][] = $row['std Y'];
	$data3['data'][] = $row['std Y-Arm'];
        $data4['data'][] = $row['tch Y'];
	$data5['data'][] = $row['tch H'];
        $data6['data'][] = $row['tch Dot'];

}


//}
$acc = array();
array_push($acc,$date);
array_push($acc,$data1);
array_push($acc,$data2);
array_push($acc,$data3);
array_push($acc,$data4);
array_push($acc,$data5);
array_push($acc,$data6);



//array_push($acc,$data2);
print json_encode($acc,JSON_NUMERIC_CHECK);
//while($row = mysql_fetch_array($result)) {
//	echo $row[TraysID] . "\t" . $row[] . "\n";/
//}

mysql_close($con);
?>
