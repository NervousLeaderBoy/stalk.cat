<?php
include_once 'dbconnect.php';

$charname = htmlspecialchars($_POST['charname']);

$qr = mysqli_query($link, "SELECT name FROM characters WHERE name='$charname'");

if (mysqli_num_rows($qr) <= 0) echo "Имя свободно";
else echo "Имя занято";
?>