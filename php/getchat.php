<?php
include_once "dbconnect.php";

$getchatmsgs = mysqli_query($link, "SELECT text, email, time FROM chatmsgs JOIN users ON users.idUsers = chatmsgs.fromuser");
$msgsarr = mysqli_fetch_array($getchatmsgs);
$msgsarr[1] = strtok($msgsarr[1], "@");

echo "<div class='wrapper'>";
echo "<div class='row'>";

echo "<div>";
echo "<table class='playerstable'>
<thead>
<tr>
    <td>Сообщение</td>
    <td>Имя отправителя</td>
    <td>Время отправки</td>
</tr>
</thead>
</table>";

echo "<table class='playerstable'>
<thead style='visibility:collapse'>
<tr>
    <td>Сообщение</td>
    <td>Имя отправителя</td>
    <td>Время отправки</td>
</tr>
</thead>
<tbody>";

for ($i = 0; $i < mysqli_num_rows($getchatmsgs); $i++) {
    echo "<tr>";
    for ($j = 0; $j < mysqli_num_fields($getchatmsgs); $j++) {
        echo "<td>".$msgsarr[$j]."</td>";
    }
    $msgsarr = mysqli_fetch_array($getchatmsgs);
    $msgsarr[1] = strtok($msgsarr[1], "@");
    echo "</tr>";
}

echo "</tbody>
</table>";
echo "</div>";
echo "</div>";

echo "<div class='row'>";
echo "<form>";
echo "<textarea name='message' placeholder='Ваше сообщение' minlength='1' maxlength='200'></textarea>";
echo "<input type='submit' class='buttonsimple' value='Отправить'>";
echo "</form>";
echo "</div>";
echo "</div>";

?>