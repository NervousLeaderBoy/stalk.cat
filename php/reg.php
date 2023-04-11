<?php
include_once 'dbconnect.php';

date_default_timezone_set('Europe/Moscow');
$email = htmlspecialchars($_POST['email']);
$password = password_hash($_POST['password'], PASSWORD_DEFAULT);

$sql = "INSERT INTO users(email, password, regdate, lastdate, settings_voicevolume, settings_voice, settings_effects, isadmin, status) VALUES ('$email', '$password', NOW(), NOW(), 100, 1, 1, 0, 'offline')";
if (mysqli_query($link, $sql))
    echo "Регистрация прошла успешно.";
else
    echo "Ошибка регистрации пользователя!\n" . mysqli_error($link) . "\n";
?>