<?php
include_once "dbconnect.php"; // Подключение к базе данных

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $blogTitle = isset($_POST['title']) ? mysqli_real_escape_string($link, $_POST['title']) : '';
    $blogTags = isset($_POST['tags']) ? mysqli_real_escape_string($link, $_POST['tags']) : '';
    $blogText = isset($_POST['text']) ? mysqli_real_escape_string($link,  nl2br(htmlspecialchars($_POST['text']), ENT_QUOTES)) : '';

    if ($blogTitle && $blogTags && $blogText) {
        // Определение пользователя
        $sessid = $_COOKIE["PHPSESSID"];
        $authorQuery = mysqli_query($link, "SELECT idUsers FROM users WHERE token = '$sessid'");
        $author = mysqli_fetch_assoc($authorQuery);
        $author =  $author['idUsers'];

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
