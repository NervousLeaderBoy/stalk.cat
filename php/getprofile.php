<?php
include_once "dbconnect.php";

$sessid = $_GET['userId'];

$getuserinfoq = mysqli_query($link, "SELECT idUsers, regdate, lastdate, about FROM users WHERE idUsers='$sessid'");
$getusercharname = mysqli_query($link, "SELECT characters.name FROM characters JOIN users ON users.idUsers = characters.user WHERE idUsers='$sessid'");

$getuserinfo = mysqli_fetch_assoc($getusercharname);
if (!$getuserinfo) $getuserinfo["name"] = "";
if (mysqli_num_rows($getuserinfoq) > 0) $getuserinfo = array_merge($getuserinfo, mysqli_fetch_assoc($getuserinfoq));

echo "<div class='wrapper'>";
echo "<div class='row'>";
if ($getuserinfo["name"] == "") {
    echo "<img src='../images/defaultpic.png' title='Здесь будет изображение персонажа' width='250px'>";
    $getuserinfo["name"] = "Здесь будет имя персонажа";
}
else echo "<img class='userpic' src='../images/characters/".$getuserinfo["name"].".png' title='".$getuserinfo["name"]."' width='250px'>";

$name = $getuserinfo["name"];
$userId = $getuserinfo["idUsers"];  // Используем $getuserinfo["idUsers"] вместо array_shift

$regdate = new DateTime($getuserinfo["regdate"]);
$lastdate = new DateTime($getuserinfo["lastdate"]);
$interval = date_diff($regdate, $lastdate);

$getuserinfo["regdate"] = $interval->format("%y г, %m мес, %d д, %h ч");

$cols = ["Имя", "Id", "Время в игре"];

echo "<table class='usertable'><tbody>";

for ($i = 0; $i < 3 ; $i++) {
    echo "<tr>";
    echo "<td>".$cols[$i]."</td>";
    echo "<td>".array_shift($getuserinfo)."</td>";
    echo "</tr>";
}

echo "</tbody></table>";
echo "</div>";

if ($name != "Здесь будет имя персонажа") {
    echo "<div class='row'>";
    echo "<form>";
    echo "<textarea name='about' placeholder='Игрок пока не рассказал о себе...' disabled maxlength='5000'>".$getuserinfo["about"]."</textarea>";
    echo "</form>";
    echo "</div>";
}

// Добавляем кнопку с data-атрибутом
echo "<div class='row'>";
echo "<div class='button-container'>";
echo "<button class='profile-button' data-user-id='".$userId."'>Перейти к Личным Сообщениям</button>";
echo "</div>";
echo "</div>";
echo "</div>";
?>
