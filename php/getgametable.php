<?php
include_once "dbconnect.php";

$sessid = $_COOKIE["PHPSESSID"];

$getcharpos = mysqli_query($link, "SELECT location FROM characters JOIN users ON users.idUsers = characters.user WHERE characters.user = users.idUsers AND users.token = '$sessid'");
$charposarr = mysqli_fetch_assoc($getcharpos);
if ($charposarr) {

    $locationid = $charposarr["location"];
    
    $getlocationimage = mysqli_query($link, "SELECT name, background FROM locations WHERE idLocation = $locationid");
    $locimg = mysqli_fetch_array($getlocationimage);
    
    $getlocationchars = mysqli_query($link, "SELECT characters.name, positionX, positionY, health, infection, hunger, thirst, energy, strength, endurance, characters.hunting, healing, reputation, users.token FROM characters JOIN locations ON locations.idLocation = characters.location JOIN users ON users.idUsers = characters.user WHERE locations.idLocation = $locationid ORDER BY positionY, positionX");
    
    $getlocationtransitions = mysqli_query($link, "SELECT location_to, transitionPosX, transitionPosY, locations.name FROM locations_transitions JOIN locations ON locations.idLocation = locations_transitions.location_to WHERE location_from = $locationid ORDER BY transitionPosY, transitionPosX");
    
    echo "<center>";
    
    echo "<h1 id='locname'>".ucfirst($locimg[0])."</h1>";
    
    echo "<div id='msg'></div>";
    
    echo "<table class='gametable' style='background-image: url(../images/locations/$locimg[1])'>
    <thead>
    </thead>
    <tbody>";
    
    // if ($getlocationchars) {
        //         $loccharsarr = mysqli_fetch_assoc($getlocationchars);
        
        //         print_r($loccharsarr);
        //     echo ($loccharsarr["name"]);
        // }
        
        if ($getlocationchars) $loccharsarr = mysqli_fetch_assoc($getlocationchars);
        if ($getlocationtransitions) $loctransitions = mysqli_fetch_assoc($getlocationtransitions);

    for ($i = 0; $i < 11; $i++) {
        echo "<tr>";
        while ($loccharsarr && ($loccharsarr["positionX"] < 0 || $loccharsarr["positionY"] < 0)) {
            if ($loccharsarr["token"] == $sessid) $waiting = $loccharsarr;
            if ($getlocationchars) $loccharsarr = mysqli_fetch_assoc($getlocationchars);
        }
        for ($j = 0; $j < 11; $j++) {
            if ($loctransitions && $j == $loctransitions["transitionPosX"] && $i == $loctransitions["transitionPosY"]) {
                $trinfo = $loctransitions;
                unset($trinfo["transitionPosX"], $trinfo["transitionPosY"], $trinfo["positionY"]);
                $trinfo = json_encode($trinfo);
                echo "<td class='occupied transition' data-info='$trinfo'>К локации \"".$loctransitions["name"]."\"</td>";
                if ($getlocationtransitions) $loctransitions = mysqli_fetch_assoc($getlocationtransitions);
            }
            else if ($loccharsarr && $j == $loccharsarr["positionX"] && $i == $loccharsarr["positionY"]) {
                $info = $loccharsarr;
                unset($info["token"], $info["positionX"], $info["positionY"]);
                if ($loccharsarr["token"] == $sessid) {
                    $info = json_encode($info);
                    echo "<td><img id='char' src='../images/characters/".$loccharsarr["name"].".png' title='".$loccharsarr["name"]."' width='50px' data-info='$info'></td>";
                }
                else {
                    unset($info["strength"], $info["endurance"], $info["hunting"], $info["healing"]);
                    $info = json_encode($info);
                    echo "<td class='occupied'><img class='other' src='../images/characters/".$loccharsarr["name"].".png' title='".$loccharsarr["name"]."' width='50px' data-info='$info'></td>";
                }
                
                if ($getlocationchars) $loccharsarr = mysqli_fetch_assoc($getlocationchars);
            }
            else echo "<td></td>";
        }
        echo "</tr>";
    }

    echo "</tbody>
    </table>";


    echo "<div class='waitingbench'>";
    if ($waiting) {
        $chararr = $waiting;
        unset($chararr["token"], $chararr["positionX"], $chararr["positionY"], $chararr["name"]);
        $charinfo = json_encode($chararr);
        echo "<img id='char' src='../images/characters/".$waiting["name"].".png' title='".$waiting["name"]."' width='50px' data-info='$charinfo'></div>";
    }

    echo "</center>";
}
?>