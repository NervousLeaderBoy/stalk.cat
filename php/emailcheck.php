<?php
include_once 'dbconnect.php';

$email = htmlspecialchars($_POST['email']);

$emailexists = mysqli_query($link, "SELECT * FROM users WHERE email='$email'");
if (mysqli_num_rows($emailexists) <= 0) {
    echo "Email свободен.";
} else {
    echo "Пользователь с такой почтой уже существует в базе данных.";
}
?>