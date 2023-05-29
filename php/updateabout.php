<?php

include_once "dbconnect.php";

$sessid = $_COOKIE["PHPSESSID"];
$about = htmlspecialchars($_POST["about"]);

$updabout = mysqli_query($link, "UPDATE users SET about = '$about' WHERE token = '$sessid'");
if (!$updabout)
    echo "Произошла ошибка при сохранении. Повторите позже.";
else
    echo "\"О себе\" успешно сохранено";

?>