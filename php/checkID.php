<?php
include_once "dbconnect.php"; // Подключение к базе данных

// Получение текущего пользователя
$sessid = $_COOKIE["PHPSESSID"];
$usernameQuery = mysqli_query($link, "SELECT idUsers FROM users WHERE token = '$sessid'");
$currentUserId = 0; // По умолчанию
if ($usernameQuery) {
    $userInfo = mysqli_fetch_assoc($usernameQuery);
    $currentUserId = $userInfo['idUsers'];
}

// Отправляем id текущего пользователя в ответе
echo $currentUserId;
?>
