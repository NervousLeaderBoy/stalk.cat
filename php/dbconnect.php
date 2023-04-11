<?php
$host = 'localhost'; //адрес сервера
$user = 'root'; //имя пользователя
$userpassword = 'root'; //пароль
$db_name = 'stalkcat'; //имя базы данных
$link = mysqli_connect($host, $user, $userpassword, $db_name);
if (!$link) {
    echo "Соединение не установлено! " . PHP_EOL;
    echo "Код ошибки: ", mysqli_connect_errno() . PHP_EOL;
    echo "Текст ошибки: ", mysqli_connect_error() . PHP_EOL;
    exit;
}
?>