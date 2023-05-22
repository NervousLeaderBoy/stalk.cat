<?php

include_once "dbconnect.php";

$posinfo = json_decode($_POST["datastr"], true);

$char = $posinfo["char"];
$loc = $posinfo["loc"];
$posx = $posinfo["posx"];
$posy = $posinfo["posy"];

$getlocid = mysqli_query($link, "SELECT idLocation FROM locations WHERE name = '$loc'");
$locid = mysqli_fetch_array($getlocid);

$updpos = mysqli_query($link, "UPDATE characters SET location = $locid[0], positionX = $posx, positionY = $posy WHERE name = '$char'");

if (!$updpos) echo "Ошибка сохранения положения";

?>