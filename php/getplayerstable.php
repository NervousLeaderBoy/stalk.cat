<?php
include_once "dbconnect.php";

$sessid = $_COOKIE["PHPSESSID"];

$getusersonline = mysqli_query($link, "SELECT characters.name, users.regdate, users.lastdate, users.status FROM characters JOIN users ON users.idUsers = characters.user WHERE users.token <> '$sessid' OR users.token IS NULL");
$getuseridsonline = mysqli_query($link, "SELECT users.idUsers FROM characters JOIN users ON users.idUsers = characters.user WHERE users.token <> '$sessid' OR users.token IS NULL");
$usersarr = mysqli_fetch_array($getusersonline);
$useridsarr = mysqli_fetch_array($getuseridsonline);

echo "<div class='wrapper'>";

echo "<div class='row'>";
echo "<input id='searchBox' placeholder='Поиск'>";
echo "<input type='checkbox' id='online'><label for='online'>Сейчас на сайте</label>";
echo "</div>";

echo "<div class='row'>";

echo "<table class='playerstable'>
<thead>
<tr>
    <td>Имя игрока</td>
    <td>Дата регистрации</td>
    <td>Последний заход</td>
    <td>Статус на сайте</td>
</tr>
</thead>
</table>";

echo "<table class='playerstable'>
<thead style='visibility:collapse'>
<tr>
    <td>Имя игрока</td>
    <td>Дата регистрации</td>
    <td>Последний заход</td>
    <td>Статус на сайте</td>
</tr>
</thead>
<tbody id='players'>";

for ($i = 0; $i < mysqli_num_rows($getusersonline); $i++) {
    echo "<tr class='profiled' data-user-id='".$useridsarr['idUsers']."'>";
    for ($j = 0; $j < mysqli_num_fields($getusersonline); $j++) {
        if ($usersarr[$j] != "online") {
            echo "<td>".$usersarr[$j]."</td>";
        } else {
            echo "<td class='online'>".$usersarr[$j]."</td>";
        }
    }
    $usersarr = mysqli_fetch_array($getusersonline);
    $useridsarr = mysqli_fetch_array($getuseridsonline);
    echo "</tr>";
}

echo "</tbody>
</table>";
echo "</div>";
echo "</div>";

?>