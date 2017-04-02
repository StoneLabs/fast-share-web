<?php
require_once "../nocch.php";
require_once "../iflnk.php";
require_once "../dbcfg.php";

if (!isset($_GET['key'])) //Check for post arguments
    retJSONRC(false, "Invalid arguments!", "");

if (!preg_match("/^[a-f0-9]{32}$/i", $_GET['key']))
    retJSONRC(false, "Illigal arguments!", "");


$key = $_GET['key'];

if (count($_FILES) != 1)
	retJSONRC(false, "No file uploaded!", "");
else
{
	$target_file = array_values($_FILES)[0];
	$target_path = "./../../images/".basename($key);

	if ($target_file["error"] == UPLOAD_ERR_OK)
    {
        $qry = 'CALL getUploadStatus(?);'; //Get user data
        $res = $link->prepare($qry);
        if ($res == false)
            retJSONRC(false, "Mysqli querry returned in ERROR state\n".$link->errno.'-'.$link->error, "");

        $res->bind_param('s', $key);
        $res->execute();
        $res = $res->get_result();

        $nrow = $res->num_rows;
        if( $nrow != 1 ) //Check result
            retJSONRC(false, "Invalid key!", "");

        $row = $res->fetch_assoc();

        if ($row["RESULT"] == 0)
            if (move_uploaded_file($target_file['tmp_name'], $target_path))
            {
                $qry = 'CALL setUploadStatus(?, ?);'; //Get user data
                $res = $link->prepare($qry);
                if ($res == false)
                    retJSONRC(false, "Mysqli querry returned in ERROR state\n".$link->errno.'-'.$link->error, "");

                $res->bind_param('ss', $key, $target_file['name']);
                $res->execute();
                retJSONRC(true, "", "");
            }
            else
                retJSONRC(false, "There was an unexpected error moving the file!", "");
        else
            retJSONRC(false, "File already uploaded!", "");
    }
	else
		retJSONRC(false, "There was an error uploading the file, please try again!", "");
}