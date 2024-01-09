<?php
if (isset($_GET['userId'])) {
    include_once "dbconnect.php"; // Подключение к базе данных

    $userId = mysqli_real_escape_string($link, $_GET['userId']);
    $sessid = $_COOKIE["PHPSESSID"];
    $usernameQuery = mysqli_query($link, "SELECT idUsers FROM users WHERE token = '$sessid'");
    $currentUserId = 0; // По умолчанию
    if ($usernameQuery) {
        $userInfo = mysqli_fetch_assoc($usernameQuery);
        $currentUserId = $userInfo['idUsers'];
    }
    // Запрос на получение чата с выбранным пользователем
    $queryChat = mysqli_query($link, "SELECT * FROM messages WHERE ((from_user = $userId AND to_user = $currentUserId) OR (from_user = $currentUserId AND to_user = $userId)) ORDER BY time ASC");

    if ($queryChat) {
        while ($message = mysqli_fetch_assoc($queryChat)) {
            $messageText = $message['text'];
            $fromUser = $message['from_user'];
            $time = date('Y-m-d H:i:s', strtotime($message['time']));
            $class = ($fromUser == $userId) ? 'left' : 'right';
            if ($message['from_user'] == $message['to_user']) $class = 'left';
            echo '<div class="msg '.$class.'">';
            echo '<span class="message-time">' . $time . '</span>';
            echo '<p>' . $messageText . '</p>';
            echo '</div>';
        }
    } else {
        echo "Ошибка при получении чата из базы данных: " . mysqli_error($link);
    }
}
?>
