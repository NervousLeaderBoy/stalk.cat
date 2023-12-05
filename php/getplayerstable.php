﻿<?php
include_once "dbconnect.php";

$getusersonline = mysqli_query($link, "SELECT characters.name, users.regdate, users.lastdate, users.status FROM characters JOIN users ON users.idUsers = characters.user");
$usersarr = mysqli_fetch_array($getusersonline);

echo "<table class='playerstable'>
<thead>
<tr>
    <td>Имя игрока</td>
    <td>Дата регистрации</td>
    <td>Последний заход</td>
    <td>Статус на сайте</td>
</tr>
</thead>
<tbody>";

for ($i = 0; $i < mysqli_num_rows($getusersonline); $i++) {
    echo "<tr>";
    for ($j = 0; $j < mysqli_num_fields($getusersonline); $j++) {
        if ($usersarr[$j] != "online") echo "<td>".$usersarr[$j]."</td>";
        else echo "<td class='online'>".$usersarr[$j]."</td>";
    }
    $usersarr = mysqli_fetch_array($getusersonline);
    echo "</tr>";
}

echo "</tbody>
</table>";
?>