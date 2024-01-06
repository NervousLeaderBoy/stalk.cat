<?php
include_once "dbconnect.php"; // Подключение к базе данных

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $blogId = isset($_POST['blogId']) ? intval($_POST['blogId']) : 0;
    $commentText = isset($_POST['text']) ? mysqli_real_escape_string($link,  nl2br(htmlspecialchars($_POST['text']), ENT_QUOTES)) : '';

    if ($blogId > 0 && $commentText !== '') {
        $date = date('Y-m-d H:i:s');

        // Определение пользователя
        $sessid = $_COOKIE["PHPSESSID"];
        $usernameQuery = mysqli_query($link, "SELECT idUsers FROM users WHERE token = '$sessid'");
        
        if ($usernameQuery) {
            $username = mysqli_fetch_assoc($usernameQuery);
            $fromuser = $username['idUsers'];

            if ($fromuser !== '') {
                // Запрос на добавление комментария
                $query = mysqli_query($link, "INSERT INTO comments (`blog`, `text`, `fromuser`, `date`) VALUES ('$blogId', '$commentText', '$fromuser', '$date')");

                if ($query) {
                    // Комментарий успешно добавлен
                    echo json_encode(array('status' => 'success'));
                } else {
                    // Ошибка запроса
                    echo json_encode(array('status' => 'error', 'message' => 'Ошибка при выполнении запроса: ' . mysqli_error($link)));
                }
            } else {
                // Некорректные данные
                echo json_encode(array('status' => 'error', 'message' => 'Некорректные данные: отсутствует идентификатор пользователя'));
            }
        } else {
            // Ошибка запроса для определения пользователя
            echo json_encode(array('status' => 'error', 'message' => 'Ошибка при выполнении запроса для определения пользователя: ' . mysqli_error($link)));
        }
    } else {
        // Некорректные данные
        echo json_encode(array('status' => 'error', 'message' => 'Некорректные данные: отсутствует идентификатор блога или текст комментария'));
    }
} else {
    // Недопустимый метод запроса
    echo json_encode(array('status' => 'error', 'message' => 'Недопустимый метод запроса'));
}
?>
