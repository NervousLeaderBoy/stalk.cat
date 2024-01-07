<?php
include_once "dbconnect.php"; // Подключение к базе данных

// Получение данных от клиента
$senderId = isset($_POST['senderId']) ? mysqli_real_escape_string($link, $_POST['senderId']) : '';
$recipientId = isset($_POST['recipientId']) ? mysqli_real_escape_string($link, $_POST['recipientId']) : '';
$messageText = isset($_POST['text']) ? mysqli_real_escape_string($link,  nl2br(htmlspecialchars($_POST['text']), ENT_QUOTES)) : '';

// Проверка наличия всех необходимых данных
if ($senderId !== '' && $recipientId !== '' && $messageText !== '') {
    // Дата и время сообщения
    $dateTime = date('Y-m-d H:i:s');

    // Запрос на добавление сообщения в базу данных
    $query = mysqli_query($link, "INSERT INTO messages (from_user, to_user, time, text) VALUES ('$senderId', '$recipientId', '$dateTime', '$messageText')");

    if ($query) {
        // Ответ клиенту об успешной отправке
        echo json_encode(array('status' => 'success'));
    } else {
        // Ошибка запроса
        echo json_encode(array('status' => 'error', 'message' => 'Ошибка при выполнении запроса: ' . mysqli_error($link)));
    }
} else {
    // Некорректные данные от клиента
    echo json_encode(array('status' => 'error', 'message' => 'Некорректные данные'));
}
?>
