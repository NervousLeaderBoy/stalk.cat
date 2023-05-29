<?php
include_once 'dbconnect.php';
$sessid = $_COOKIE["PHPSESSID"];

$charname = $_POST["charname"];
$picture = $_POST["picture"];

$checkchar = mysqli_query($link, "SELECT characters.name FROM characters JOIN users ON characters.user = users.idUsers WHERE token='$sessid'");

if (mysqli_num_rows($checkchar) > 0) {
    $charname = mysqli_fetch_assoc($checkchar);
    echo "У вас уже есть персонаж ".$charname["name"].".";
}
else {   
    $picture = str_replace("data:image/png;base64,", "", $picture); //не xml+svg, как я писала в js, а png
    $picture = base64_decode($picture);
    
    file_put_contents('../images/characters/'.$charname.'.png', $picture);

    $getuserid = mysqli_query($link, "SELECT idUsers FROM users WHERE token='$sessid'");
    $userid = mysqli_fetch_assoc($getuserid);
    $id = $userid['idUsers'];
    $addchar = mysqli_query($link, "INSERT INTO characters(user, name) VALUES($id, '$charname')");

    if (!$addchar)
        echo "Произошла ошибка при сохранении персонажа.\nПовторите попытку позже.";
}

?>