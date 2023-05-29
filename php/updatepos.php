<?php

include_once "dbconnect.php";

$posinfo = json_decode($_POST["datastr"], true);

$char = $posinfo["char"];
$loc = $posinfo["loc"];
$posx = $posinfo["posx"];
$posy = $posinfo["posy"];

$getprevloc = mysqli_query($link, "SELECT locations.name FROM locations JOIN characters ON characters.location = locations.idLocation WHERE characters.name  = '$char'");
$prevlock = mysqli_fetch_array($getprevloc);

$getlocid = mysqli_query($link, "SELECT idLocation FROM locations WHERE name = '$loc'");
$locid = mysqli_fetch_array($getlocid);

if ($prevlock[0] == $loc)
    $updpos = mysqli_query($link, "UPDATE characters SET location = $locid[0], positionX = $posx, positionY = $posy WHERE name = '$char'");
else
    $updpos = mysqli_query($link, "UPDATE characters SET location = $locid[0], positionX = -1, positionY = -1 WHERE name = '$char'");

if (!$updpos) echo "Ошибка сохранения положения";

?>