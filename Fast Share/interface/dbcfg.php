<?php

define ("DB_HOST", "ni18061_5.vweb10.nitrado.net"); // set database host

define ("DB_USER", "ni18061_5sql1"); // set database user

define ("DB_NAME", "ni18061_5sql1"); // set database name

define ("DB_PASS", "3c50b38af6723177ef727f61c97bea90"); // set database password

$link = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME) or die("Couldn't make connection."); //establish connection
if ($link->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error; //Log error
}

?>