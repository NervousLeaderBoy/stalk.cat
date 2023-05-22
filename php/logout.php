<?php
include_once 'dbconnect.php';
$sessid = $_COOKIE["PHPSESSID"];

$logout = mysqli_query($link, "UPDATE users SET token=NULL, status='offline' WHERE token='$sessid'");

setcookie('PHPSESSID', $sessid, 1, '/');

if (!$logout) echo "Произошла ошибка при выходе из аккаунта";
else echo "Вы успешно вышли из аккаунта";

?>