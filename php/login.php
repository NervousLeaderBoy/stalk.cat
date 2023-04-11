<?php
include_once 'dbconnect.php';

$email = htmlspecialchars($_POST['email']);
$pass = password_hash($_POST['password'], PASSWORD_DEFAULT);

session_start();

$sessid = session_id();
$logupdate = mysqli_query($conn, "UPDATE users SET lastdate=NOW(), token='$sessid', status='online' WHERE username='$email'");

if (!$logupdate) {
    echo "Ошибка входа!";
}
else{
    $_SESSION['email'] = $_POST['email'];
}
?>