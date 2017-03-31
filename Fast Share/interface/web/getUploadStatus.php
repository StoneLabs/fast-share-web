<?php
require_once "../nocch.php";
require_once "../iflnk.php";
require_once "../dbcfg.php";

if (!isset($_POST['key'])) //Check for post arguments
    retJSON(false, "Invalid arguments");

$key = $_POST['key'];

$qry = 'CALL getUploadStatus(?);'; //Get user data
$res = $link->prepare($qry);
if ($res == false)
    retJSON(false, "Mysqli querry returned in ERROR state\n".$link->errno.'-'.$link->error);


$res->bind_param('s', $key);
$res->execute();
$res = $res->get_result();

$nrow = $res->num_rows;
if( $nrow != 1 ) //Check result
    retJSON(false, "db error - could not grab upload id");

$row = $res->fetch_assoc();

retJSON(true, "", $row["RESULT"]);

