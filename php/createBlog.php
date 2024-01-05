<?php
include_once "dbconnect.php"; // Подключение к базе данных

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $blogTitle = isset($_POST['title']) ? mysqli_real_escape_string($link, $_POST['title']) : '';
    $blogTags = isset($_POST['tags']) ? mysqli_real_escape_string($link, $_POST['tags']) : '';
    $blogText = isset($_POST['text']) ? mysqli_real_escape_string($link, $_POST['text']) : '';

    if ($blogTitle && $blogTags && $blogText) {
        // Определение пользователя
        $sessid = $_COOKIE["PHPSESSID"];
        $usernameQuery = mysqli_query($link, "SELECT idUsers, email FROM users WHERE token = '$sessid'");
        $username = mysqli_fetch_assoc($usernameQuery);
        $author = strtok($username["email"], "@");

        // Вставка данных блога в базу данных
        $insertQuery = mysqli_query($link, "INSERT INTO blog (theme, tags, text, author) VALUES ('$blogTitle', '$blogTags', '$blogText', '$author')");

        if ($insertQuery) {
            echo 'success'; // Отправляем успешный ответ клиенту
        } else {
            echo 'error';
        }
    } else {
        echo 'error';
    }
} else {
    echo 'error';
}
?>
