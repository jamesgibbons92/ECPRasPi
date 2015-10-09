<?php

define('DB_NAME', 'printing');
define('DB_USER', 'root');
define('DB_PASSWORD', '23456789');
define('DB_HOST', 'localhost');

$link = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD);

if (!$link) {
        die('Could not connect: ' . mysql_error());
}


$db_selected = mysql_select_db(DB_NAME, $link);

if (!$db_selected) {
        die('Cant use ' . DB_NAME . ': ' . mysql_error());
}

echo 'Connected successfully, punch in the print run!';

$getray = "SELECT ID, Description FROM Trays";
$gettrayresult = mysql_query($getray);
$getprinter = mysql_query("SELECT ID, Model FROM printers");
$getspoolrep = mysql_query("SELECT ID, VendorColour FROM Spools WHERE VendorDiameter = '1.75'");
$getspoolum = mysql_query("SELECT ID, VendorColour FROM Spools WHERE VendorDiameter = '2.85'");
$getmaker = mysql_query("Select ID, Name FROM Makers");

mysql_close();

?>


<form action="./phpform/phpdefine.php" method="post" />
<?php
echo "<p>Tray: <select name='Tray'>";
while ($row = mysql_fetch_array($gettrayresult)) {
        echo "<option value='" . $row['ID'] ."'>" . $row['Description']. "</option>";
}
echo "</select> </p>";
?>

<?php
echo "<p>Printer: <select name='Printer'>";
while ($row = mysql_fetch_array($getprinter)) {
        echo "<option value='" . $row['ID'] ."'>" . $row['Model']. "</option>";
}
echo "</select> </p>";
?>

<?php
echo "<p>Spool: <select name='Spool'>";
if ($row['Model'] = "Replicator 2_1"){
while ($row = mysql_fetch_array($getspoolum)) {
        echo "<option value='" . $row['ID'] ."'>" . $row['VendorColour']. "</option>";
} }
else{
while ($row = mysql_fetch_array($getspoolum2)) {
        echo "<option value='" . $row['ID'] ."'>" . $row['VendorColour']. "</option>";
} }
echo "</select> </p>";
?>

<?php
echo "<p>Maker: <select name='Maker'>";
while ($row = mysql_fetch_array($getmaker)) {
        echo "<option value='" . $row['ID'] ."'>" . $row['Name']. "</option>";
}
echo "</select> </p>";
?>

<p>Time started: <input type="datetime-local" name="StartTime" /></p>
<p>Time finished: <input type="datetime-local" name="EndTime" /></p>
<p>Measured weight of print (In GRAMS): <input type="text" name="FilamentMass" /></p>
<p>Number of pieces accepted: <input type="text" name="NumAccepted" /></p>
<p>Number of pieces that are borderline 'OK': <input type="text" name="NumBorderline" /></p>
<p>Number of pieces rejected/unusable: <input type="text" name="NumRejected" /></p>
<input type="submit" value="Submit" />
</form>

