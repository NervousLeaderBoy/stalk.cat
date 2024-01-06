<?php
include_once "dbconnect.php"; // Подключение к базе данных

// Получение текущего пользователя
$sessid = $_COOKIE["PHPSESSID"];
$usernameQuery = mysqli_query($link, "SELECT idUsers, email FROM users WHERE token = '$sessid'");
$currentUserId = 0; // По умолчанию
if ($usernameQuery) {
    $userInfo = mysqli_fetch_assoc($usernameQuery);
    $currentUserId = $userInfo['idUsers'];
}

// Запрос на получение списка пользователей
$queryUsers = mysqli_query($link, "SELECT idUsers, email FROM users WHERE idUsers <> '$currentUserId'");

if ($queryUsers) {
    // Вывод текущего пользователя в начало списка
    echo '<div class="user-item" data-user-id="' . $currentUserId . '">' . strtok($userInfo["email"], "@") . '</div>';

    while ($user = mysqli_fetch_assoc($queryUsers)) {
        $userId = $user['idUsers'];
        $email = strtok($user["email"], "@");
        echo '<div class="user-item" data-user-id="' . $userId . '">' . $email . '</div>';
    }
} else {
    echo "Ошибка при получении списка пользователей из базы данных: " . mysqli_error($link);
}
?>
