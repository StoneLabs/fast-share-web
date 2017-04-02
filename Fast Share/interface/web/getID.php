<?php
require_once "../nocch.php";
require_once "../iflnk.php";
require_once "../dbcfg.php";

$qry = 'CALL getFileID();'; //Get user data
$res = $link->prepare($qry);
if ($res == false)
    retJSON(false, "Mysqli querry returned in ERROR state\n".$link->errno.'-'.$link->error, "");

$res->execute();
$res = $res->get_result();

$nrow = $res->num_rows;
if( $nrow != 1 ) //Check result
    retJSON(false, "db error - could not grab upload id", "");

$row = $res->fetch_assoc();

retJSON(true, "", $row["KEY"]);