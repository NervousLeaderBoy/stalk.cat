<?php
include_once "dbconnect.php"; // Подключение к базе данных

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $isAdmin = false; // По умолчанию предполагаем, что пользователь не администратор

    // Проверка статуса администратора
    $sessid = $_COOKIE["PHPSESSID"];
    $usernameQuery = mysqli_query($link, "SELECT isadmin FROM users WHERE token = '$sessid'");
    if ($usernameQuery) {
        $userInfo = mysqli_fetch_assoc($usernameQuery);
        $isAdmin = $userInfo['isadmin'] == 1; // Пользователь администратор, если isadmin = 1
    }

    if ($isAdmin) {
        $newsText = isset($_POST['newsText']) ? mysqli_real_escape_string($link,  nl2br(htmlspecialchars($_POST['newsText']), ENT_QUOTES)) : '';

        if ($newsText !== '') {
            $date = date('Y-m-d H:i:s');
            
            // Запрос на добавление новости
            $query = mysqli_query($link, "INSERT INTO news (newsDate, newsText) VALUES ('$date', '$newsText')");
            
            if ($query) {
                // Новость успешно добавлена
                echo json_encode(array('status' => 'success'), JSON_UNESCAPED_UNICODE);
            } else {
                // Ошибка запроса
                echo json_encode(array('status' => 'error', 'message' => 'Ошибка при выполнении запроса: ' . mysqli_error($link)), JSON_UNESCAPED_UNICODE);
            }
        } else {
            // Некорректные данные
            echo json_encode(array('status' => 'error', 'message' => 'Некорректные данные'), JSON_UNESCAPED_UNICODE);
        }
    } else {
        // Пользователь не является администратором
        echo json_encode(array('status' => 'error', 'message' => 'Недостаточно прав для создания новости'), JSON_UNESCAPED_UNICODE);
    }
} else {
    // Недопустимый метод запроса
    echo json_encode(array('status' => 'error', 'message' => 'Недопустимый метод запроса'), JSON_UNESCAPED_UNICODE);
}
?>
