<?php

function retJSON($success, $error, $data)
{
    $ret["success"] = $success;
    $ret["error"] = $error;
    $ret["data"] = $data;

    exit(json_encode($ret));
}