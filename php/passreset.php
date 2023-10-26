<?php
include_once 'dbconnect.php';

date_default_timezone_set('Europe/Moscow');
$email = htmlspecialchars($_POST['email']);
$password = password_hash(htmlspecialchars($_POST['password']), PASSWORD_DEFAULT);

$sql = "UPDATE users SET password = '$password' WHERE email = '$email'";
if (mysqli_query($link, $sql))
    echo "Пароль успешно изменён.\n<a href='../login.html'>На главную</a>";
else
    echo "Ошибка изменения пароля!\n" . mysqli_error($link) . "\n";
?>