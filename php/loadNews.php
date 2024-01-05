<!-- loadNews.php -->
<?php
include_once "dbconnect.php"; // Подключение к базе данных

// Запрос на получение новостей
$queryNews = mysqli_query($link, "SELECT * FROM news ORDER BY newsDate DESC");

if ($queryNews) {
    while ($news = mysqli_fetch_assoc($queryNews)) {
        echo '<div>';
        echo '<div style="margin: 10px; font-family: Jura;">' . date('Y-m-d H:i:s', strtotime($news['newsDate'])) . '</div>';
        echo '<div style="background-color: #EDEFF1; border-radius: 10px; margin: 10px; padding: 10px; font-family: Ruda;">' . $news['newsText'] . '</div>';
        echo '<div></div>';
        echo '</div>';
    }
} else {
    echo "Ошибка при получении новостей из базы данных.";
}
?>

