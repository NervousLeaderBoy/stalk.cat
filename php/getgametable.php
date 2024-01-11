<?php
include_once "dbconnect.php";

$sessid = $_COOKIE["PHPSESSID"];

$getcharpos = mysqli_query($link, "SELECT location
FROM characters
JOIN users ON users.idUsers = characters.user
WHERE characters.user = users.idUsers
AND users.token = '$sessid'");
$charposarr = mysqli_fetch_assoc($getcharpos);

if ($charposarr) {

    $locationid = $charposarr["location"];
    
    $getlocationimage = mysqli_query($link, "SELECT
    name, background
    FROM locations
    WHERE idLocation = $locationid");
    $locimg = mysqli_fetch_array($getlocationimage);
    
    $getlocationchars = mysqli_query($link, "SELECT idUsers, characters.name, positionX, positionY, health, infection, hunger, thirst, energy, strength, endurance, characters.hunting, healing, reputation, users.isadmin, users.about, users.token
    FROM characters
    JOIN locations ON locations.idLocation = characters.location
    JOIN users ON users.idUsers = characters.user
    WHERE locations.idLocation = $locationid
    ORDER BY positionY, positionX");
    
    $getlocationtransitions = mysqli_query($link, "SELECT location_to, transitionPosX, transitionPosY, locations.name
    FROM locations_transitions
    JOIN locations ON locations.idLocation = locations_transitions.location_to
    WHERE location_from = $locationid
    ORDER BY transitionPosY, transitionPosX");

    $getcharinfo = mysqli_query($link, "SELECT health, infection, hunger, thirst, energy, strength, endurance, hunting, healing, reputation
    FROM characters
    JOIN users ON users.idUsers = characters.user
    WHERE characters.user = users.idUsers
    AND users.token = '$sessid'");
    $charinfoarr = mysqli_fetch_assoc($getcharinfo);
    $charinforus = ["Здоровье", "Заражение", "Голод", "Жажда", "Энергия", "Сила", "Выносливость", "Охота", "Врачевание", "Репутация"]; 

    echo "<div class='row'>
    <div class='charInfo'>
        <div id='mapAndNotes' class='charInfoBlock'>
            <div class = 'tabrow'>
                <div id='miniMap' class='tab'>Карта</div>
                <div id='notes' class='tab active'>Заметки</div>
            </div>
            <div class='tabContent'>У меня пока ещё нет карты этой местности</div>
        </div>
        <div class='charInfoBlock'>
            <h1>Параметры</h1>
            <table class='charInfoTable'>
                <tbody>";

    $counter = 0;
    foreach ($charinfoarr as $key => $value) {
        if ($counter < 5) {
            echo "<tr>
            <td colspan='10'>$charinforus[$counter]</td>
            </tr>
            <tr id=$key title=$value>";
            
            for ($i = 0; $i < 100; $i+=10) {
                if ($i < $value) echo "<td class='filled'></td>";
                else echo " <td></td>";
            }
            echo "</tr>";
        }
        $counter++;
    }
    echo "</tbody>
        </table>
    </div>
    <div id='charSkills' class='charInfoBlock'>
        <h1>Навыки</h1>
        <table class='charInfoTable'>
            <tbody>";

    $counter = 0;
    foreach ($charinfoarr as $key => $value) {
        if ($counter >= 5) {
            echo "<tr>
            <td colspan='10'>$charinforus[$counter]</td>
            </tr>
            <tr id=$key title=$value>";
            
            for ($i = 0; $i < 100; $i+=10) {
                if ($i < $value) echo "<td class='filled'></td>";
                else echo " <td></td>";
            }
            echo "</tr>";
        }
        $counter++;
    }
    echo "</tbody>
        </table>
    </div>
    </div>";

    echo "<div id='game'>";

    echo "<h1 id='locname'>".ucfirst($locimg[0])."</h1>";
        
    echo "<table class='gametable' style='background-image: url(../images/locations/$locimg[1]); background-position: -225px -20px'>
    <tbody>";
        
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
                unset($trinfo["transitionPosX"], $trinfo["transitionPosY"]);
                $trinfo = json_encode($trinfo);
                echo "<td class='occupied transition' data-info='$trinfo'>".ucfirst($loctransitions["name"])."</td>";
                if ($getlocationtransitions) $loctransitions = mysqli_fetch_assoc($getlocationtransitions);
            }
            else if ($loccharsarr && $j == $loccharsarr["positionX"] && $i == $loccharsarr["positionY"]) {
                $info = $loccharsarr;
                unset($info["token"], $info["positionX"], $info["positionY"]);
                if (mb_strlen($info["about"]) > 130) $info["about"] = substr($info["about"], 0, 130)."...";
                if ($loccharsarr["token"] == $sessid) {
                    unset($info["idUsers"], $info["isadmin"]);
                    $info = json_encode($info);
                    echo "<td><img id='char' src='../images/characters/".$loccharsarr["name"].".png' title='".$loccharsarr["name"]."' data-info='$info'></td>";
                }
                else {
                    unset($info["health"], $info["infection"], $info["hunger"], $info["thirst"], $info["energy"], $info["strength"], $info["endurance"], $info["hunting"], $info["healing"], $info["reputation"]);
                    $info["isadmin"] = ($info["isadmin"]) ? "Старшина" : "Рядовой";
                    $info = json_encode($info);
                    echo "<td class='occupied'><img class='other player' src='../images/characters/".$loccharsarr["name"].".png' title='".$loccharsarr["name"]."' data-info='$info'></td>";
                }
                
                if ($getlocationchars) $loccharsarr = mysqli_fetch_assoc($getlocationchars);
            }
            else echo "<td></td>";
        }
        echo "</tr>";
    }

    echo "</tbody>
    </table>
    </div>";

    echo "<div class='othersInfo'>
    <h2 id='otherName'>Мамихлапинатопай имя котика хы</h2>
    <div>
        <img id='otherPic' src='../images/defaultpic.png' title='other pic'>
    </div>
    <div id='otherInfo'>описание персонажа или предмета</div>
    <div id='otherType'>роль персонажа или тип предмета</div>
    <div id='otherCharacteristics'>
    </div>
    <div id='otherPlayerActions'>
        <input type='button' id='otherPlayerProfile' class='buttonsimple' value='Профиль'>
        <input type='button' id='otherPlayerPM' class='buttonsimple' value='Написать'>
    </div>
    <div id='itemsActions'>
        <input type='button' id='itemActionEquip' class='buttonsimple' value='Надеть'>
        <input type='button' id='itemActionEat' class='buttonsimple' value='Съесть'>
        <input type='button' id='itemActionUse' class='buttonsimple' value='Применить'>
        <input type='button' id='itemActionCharge' class='buttonsimple' value='Зарядить'>
        <input type='button' id='itemActionThrow' class='buttonsimple' value='Выбросить'>
    </div>
    <div id='preyActions'>
        <input type='button' id='PreyActionHunt' class='buttonsimple' value='Охотиться'>
        <input type='button' id='PreyActionAttack' class='buttonsimple' value='Атаковать' disabled>
    </div>
    <input type='button' id='othersInfoClose' class='buttonsimple' value='Закрыть'>
    </div>";

    echo "</div>";

    echo "<div class='row'>
    <div class='waitingBench'>";

    if ($waiting) {
        $chararr = $waiting;
        unset($chararr["idUsers"], $chararr["token"], $chararr["positionX"], $chararr["positionY"], $chararr["name"], $chararr["about"], $chararr["isadmin"]);
        $charinfo = json_encode($chararr);

        echo "<img id='char' src='../images/characters/".$waiting["name"].".png' title='".$waiting["name"]."' width='50px' height='50px' data-info='$charinfo'>";
       
    }
    
    echo "</div>";
    echo "<table class='inventory'><tbody>";

    $getuseritems = mysqli_query($link, "SELECT items.name, items.image, items.description, items.type
    FROM `items`
    JOIN character_inventories ON character_inventories.item = items.idItems
    JOIN characters ON characters.idCharacters = character_inventories.character2
    JOIN users ON characters.user = users.idUsers
    WHERE users.token = '$sessid'");

    $counter = 0;
    $locpreyarr = mysqli_fetch_assoc($getuseritems);
    while ($locpreyarr) {
        $getpreydropinfo =  mysqli_query($link, "SELECT `subject`, `influence_value`
        FROM `items_characteristics`
        JOIN items ON items.idItems = items_characteristics.Items_idItems
        WHERE items.name = '".$locpreyarr['name']."'");

        $preydroparr =  mysqli_fetch_assoc($getpreydropinfo);
        $preydropinfo = array();
        while ($preydroparr) {
            $preydropinfo[] = $preydroparr;
            $preydroparr =  mysqli_fetch_assoc($getpreydropinfo);
        }

        $preypic = $locpreyarr['image'];
        unset($locpreyarr['image']);
        $preyinfo = json_encode($locpreyarr);
        $preydropinfo = json_encode($preydropinfo);

        echo "<td><img class='other item' src='../images/items/$preypic' data-info='$preyinfo' data-influence='$preydropinfo'></td>";
        
        $counter++;
        $locpreyarr = mysqli_fetch_assoc($getuseritems);
    }

    for ($i = $counter; $i < 11; $i++)
        echo "<td></td>";
    echo "</tbody></table>";

    echo "</div>";

    echo "<div id='msg'></div>";
}
?>