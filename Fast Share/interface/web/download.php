<?php
require_once "../nocch.php";
require_once "../iflnk.php";
require_once "../dbcfg.php";

if (!isset($_GET['key'])) //Check for post arguments
    retJSONRC(false, "Invalid arguments", "");

if (!preg_match("/^[a-f0-9]{32}$/i", $_GET['key']))
    retJSONRC(false, "Illigal arguments!", "");

$key = $_GET['key'];
$file = "./../../images/".basename($key);

if (!file_exists($file))
    retJSONRC(false, "File not found!", "");

$qry = 'CALL getFileName(?);'; //Get user data
$res = $link->prepare($qry);
if ($res == false)
    retJSON(false, "Mysqli querry returned in ERROR state\n".$link->errno.'-'.$link->error, "");


$res->bind_param('s', $key);
$res->execute();
$res = $res->get_result();

$nrow = $res->num_rows;
if( $nrow != 1 ) //Check result
    retJSON(false, "db error - could not grab file name", "");

$row = $res->fetch_assoc();

ignore_user_abort(true);
header("Content-Type: image/*");
header("Content-Disposition: attachment; filename=\"".$row["RESULT"]."\"");
header("Pragma: public");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header('Content-Length: ' . filesize($file));

readfile($file);
unlink($file);
