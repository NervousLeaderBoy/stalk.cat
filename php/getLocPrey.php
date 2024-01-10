<?php

include_once "dbconnect.php";

$locName = $_GET["loc"];

$locprey = mysqli_query($link, "SELECT prey.name, image, description, minHuntingLevel, fleeRate, health, attack, spawnRate
FROM prey
JOIN prey_spawn_locations ON prey_spawn_locations.prey = prey.idPrey
JOIN locations ON locations.idLocation = prey_spawn_locations.location
WHERE locations.name = '$locName'");

$allInfo = [];
$locpreyarr = mysqli_fetch_assoc($locprey);
while ($locpreyarr) {
    $getpreydropinfo =  mysqli_query($link, "SELECT item, spawnRate FROM prey_spawn_items
    JOIN prey ON prey_spawn_items.prey = prey.idPrey
    WHERE prey.name = '".$locpreyarr['name']."'");

    $preydroparr =  mysqli_fetch_assoc($getpreydropinfo);
    $preydropinfo = array();
    while ($preydroparr) {
        $preydropinfo[] = $preydroparr;
        $preydroparr = mysqli_fetch_assoc($getpreydropinfo);
    }

    $preyinfo = $locpreyarr;
    $preyinfo["drop"] = $preydropinfo;

    $allInfo[] = $preyinfo;
    
    $locpreyarr = mysqli_fetch_assoc($locprey);
}
echo json_encode($allInfo);


?>