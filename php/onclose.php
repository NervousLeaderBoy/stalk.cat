<?php
include_once 'dbconnect.php';
$sessid = session_id();
echo $sessid;
$sql = "UPDATE users SET status='offline' WHERE token='$sessid'";
if (!mysqli_query($link, $sql)) echo "Произошла ошибка выхода!";
?>