<?php
include_once 'dbconnect.php';
$sessid = $_COOKIE["PHPSESSID"];

$checkchar = mysqli_query($link, "SELECT characters.name FROM characters JOIN users ON characters.user = users.idUsers WHERE token='$sessid'");

if (mysqli_num_rows($checkchar) <= 0) 
    echo "Персонажа нет";

?>