<?php

include_once "dbconnect.php";

$sessid = $_COOKIE["PHPSESSID"];
$message = htmlspecialchars($_POST["message"]);

$usernamequ = mysqli_query($link, "SELECT email, idUsers FROM users WHERE token = '$sessid'");
$username = mysqli_fetch_assoc($usernamequ);
$mail = strtok($username["email"], "@");

$updabout = mysqli_query($link, "INSERT INTO chatmsgs(fromuser, time, text, chat) VALUES (".$username["idUsers"].", NOW(), '$message', 'global')");

if (!$updabout)
    echo "Произошла ошибка при отправке сообщения. Повторите позже.";
else
    echo $mail;
?>