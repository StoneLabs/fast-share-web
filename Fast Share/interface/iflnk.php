<?php

function retJSON($success, $error, $data)
{
    $ret["success"] = $success;
    $ret["error"] = $error;
    $ret["data"] = $data;

    exit(json_encode($ret));
}
function retJSONRC($success, $error, $data)
{
    http_response_code($success ? 200 : 400);
    retJSON($success, $error, $data);
}