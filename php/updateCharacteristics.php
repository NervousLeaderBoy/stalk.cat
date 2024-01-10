<?php

include_once "dbconnect.php";

$sessid = $_COOKIE["PHPSESSID"];

$info = json_decode($_POST["datastr"], true);
$charName = $info["charName"];
$charVal = $info["charValue"];

$updCharQuery = mysqli_query($link, "UPDATE characters 
JOIN users ON characters.user = users.idUsers
SET $charName = $charVal
WHERE users.token = '$sessid'");

if (!$updCharQuery) echo "ошибка изменения параметра";

?>