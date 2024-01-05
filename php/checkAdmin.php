<?php
include_once "dbconnect.php"; // Подключение к базе данных

// Проверка статуса администратора
$isAdmin = false; // По умолчанию предполагаем, что пользователь не администратор

$sessid = $_COOKIE["PHPSESSID"];
$usernameQuery = mysqli_query($link, "SELECT isadmin FROM users WHERE token = '$sessid'");
if ($usernameQuery) {
    $userInfo = mysqli_fetch_assoc($usernameQuery);
    $isAdmin = $userInfo['isadmin'] == 1; // Пользователь администратор, если isadmin = 1
}

echo $isAdmin ? '1' : '0';
?>
