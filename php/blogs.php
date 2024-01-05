<?php
include_once "dbconnect.php";

$searchTag = isset($_GET['tag']) ? mysqli_real_escape_string($link, $_GET['tag']) : '';

// Запрос на получение блогов из базы данных по тегу
$query = mysqli_query($link, "SELECT * FROM blog WHERE tags LIKE '%$searchTag%'");

if (!$query) {
    die("Ошибка в SQL-запросе: " . mysqli_error($link));
}

$totalBlogs = mysqli_num_rows($query);
// Вывод блогов с использованием цикла for
for ($i = 0; $i < $totalBlogs; $i++) {
    $blog = mysqli_fetch_assoc($query);

    echo '<div class="formtext">';
    echo '<div class="blogEntry" style="background-color: #d9d9d9; margin-bottom: ' . ($i < $totalBlogs - 1 ? '10px' : '0') . '; padding: 20px;">';
    echo '<div style="display: flex; justify-content: space-between;">';
    echo '<div class="blogTitle">' . $blog['theme'] . '</div>';
    $userId = $blog['author'];
    $userQuery = mysqli_query($link, "SELECT email FROM users WHERE idUsers = $userId");
    $user = mysqli_fetch_assoc($userQuery);
    $email = strtok($user["email"], "@");
    echo '<div>' . $email . '</div>';
    echo '</div><hr align="center" size="1" color="#ff0000" />';
    echo '<div class="blogTags">' . $blog['tags'] . '</div><hr align="center" size="1" color="#ff0000" />';
    echo '<div class="blogText">' . substr($blog['text'], 0, 1000) . '...</div>';
    echo '<button class="buttonsimple showBlogBtn" data-blogid="' . $blog['idBlog'] . '">Показать блог</button>';
    echo '</div></div>';
    echo '</div></div>';
}
?>
