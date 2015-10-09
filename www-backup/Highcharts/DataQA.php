<?php
header('Cache-Control: no-cache, must-revalidate');
header ("Expires: Sat, 6 July 1997 05:00:00 GMT");
header('Content-type: application/json');

error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);

/** Include Php_Excel_IOFActory */
require_once 'PHPExcel/Classes/PHPExcel/IOFactory.php';

if (!file_exists("DataQA.xls")) {
		die("There's no excel file to read from");
}

$objPHPExcel = PHPExcel_IOFactory::load("DataQA.xls");
$objWorksheet = $objPHPExcel->getActiveSheet();

define('PIECES', 2);

$mon = array();
$tues = array();
$wed = array();
$thurs = array();
$fri = array();

$total_pieces = array($mon, $tues, $wed, $thurs, $fri);

for ($col = 0; $col < count($total_pieces); $col++){
		for ($row = 1; $row <= PIECES + 1; $row++) {
			$total_pieces[$col][$row - 1] =
				$objWorksheet->getCellByColumnAndRow($col, $row)->getValue();
		}
}
// var_dump($total_pieces);
echo json_encode($total_pieces);
?>