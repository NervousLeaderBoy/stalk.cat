<?php
include_once 'dbconnect.php';

$email = htmlspecialchars($_POST['email']);
$pass = $_POST['password'];

$getuserandpass = mysqli_query($link, "SELECT email, password FROM users WHERE email='$email'");
if (mysqli_num_rows($getuserandpass) <= 0) echo "Пользователь с такой почтой не найден";
else {
    $passhash = mysqli_fetch_assoc($getuserandpass)["password"];
    if (password_verify($pass, $passhash)) {
        
        session_start();
        $sessid = session_id();
        $expire = 30 * 24 * 3600; // месяц
        setcookie("PHPSESSID", $sessid, time() + $expire);

        $logupdate = mysqli_query($link, "UPDATE users SET lastdate=NOW(), token='$sessid', status='online' WHERE email='$email'");
        
        if (!$logupdate) echo "Ошибка входа.";
        
        session_destroy();
    } 
    else echo "Неверный пароль";
}
?>