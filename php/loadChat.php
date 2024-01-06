<?php
if (isset($_GET['userId'])) {
    include_once "dbconnect.php"; // Подключение к базе данных

    $userId = mysqli_real_escape_string($link, $_GET['userId']);

    // Запрос на получение чата с выбранным пользователем
    $queryChat = mysqli_query($link, "SELECT * FROM messages WHERE (from_user = $userId OR to_user = $userId) ORDER BY time ASC");

    if ($queryChat) {
        while ($message = mysqli_fetch_assoc($queryChat)) {
            $messageText = $message['text'];
            $fromUser = $message['from_user'];
            $time = date('Y-m-d H:i:s', strtotime($message['time']));
            $alignClass = ($fromUser == $userId) ? 'left' : 'right';
            
            echo '<div class="message ' . $alignClass . '">';
            echo '<span class="message-time">' . $time . '</span>';
            echo '<p>' . $messageText . '</p>';
            echo '</div>';
        }
    } else {
        echo "Ошибка при получении чата из базы данных: " . mysqli_error($link);
    }
}
?>
