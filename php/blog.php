<?php
include_once "dbconnect.php"; // Подключение к базе данных

// Получение идентификатора блога из параметров GET-запроса
$blogId = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($blogId > 0) {
    // Запрос на получение блога из базы данных
    $queryBlog = mysqli_query($link, "SELECT * FROM blog WHERE idBlog = $blogId");

    if ($queryBlog) {
        $blog = mysqli_fetch_assoc($queryBlog);

        // HTML-код блога
        echo '<div class="formtext">';
        echo '<div class="blogEntry" style="background-color: #d9d9d9; padding: 20px;">';
        echo '<div style="display: flex; justify-content: space-between;">';
        echo '<div class="blogTitle">' . $blog['theme'] . '</div>';
        $userId = $blog['author'];
        $userQuery = mysqli_query($link, "SELECT email FROM users WHERE idUsers = $userId");
        $user = mysqli_fetch_assoc($userQuery);
        $email = strtok($user["email"], "@");
        echo '<div>' . $email . '</div>';
        echo '</div><hr align="center" size="1" color="#ff0000" />';
        echo '<div class="blogTags">' . $blog['tags'] . '</div><hr align="center" size="1" color="#ff0000" />';
        echo '<div class="blogText">' . $blog['text'] . '</div>';
        echo '<button class="buttonsimple comeBack" data-blogid="' . $blog['idBlog'] . '">Вернуться обратно</button>';
        echo '</div></div>';
    } else {
        // Обработка ошибки запроса
        echo "Ошибка при получении блога из базы данных.";
    }

    // Запрос на получение комментариев к блогу
    $queryComments = mysqli_query($link, "SELECT * FROM comments WHERE blog = $blogId");
    $totalComments = mysqli_num_rows($queryComments);

    // Вывод комментариев
    if ($totalComments > 0) {
        echo '<h3 id="commentsHeading"> Комментарии (' . $totalComments . ') </h3>';
        echo '<div id="commentsContent">';
        while ($comment = mysqli_fetch_assoc($queryComments)) {
            echo '<div class="formtext">';
            echo '<div class="blogEntry" style="background-color: #d9d9d9; margin-bottom: 10px; padding: 20px;">';
            echo '<div style="display: flex; justify-content: space-between;">';
            $userId = $comment['fromUser'];
            $userQuery = mysqli_query($link, "SELECT email FROM users WHERE idUsers = $userId");
            $user = mysqli_fetch_assoc($userQuery);
            $email = strtok($user["email"], "@");
            echo '<div>' . $email . '</div>';
            echo '<div>' . $comment['date'] . '</div>';
            echo '</div><hr align="center" size="1" color="#ff0000" />';
            echo '<div>' . $comment['text'] . '</div>';
            echo '</div></div>';
        }
        echo '</div>';
        echo '<hr align="center" size="1" color="#ff0000" />';
    } else {
        echo '<h3 id="commentsHeading" padding-left="10px"> Комментарии (0) </h3>';
        echo '<hr align="center" size="1" padding-left="10px" color="#ff0000" />';
    }

    // Оставить комментарий
    echo '<div>';
    echo '<textarea id="commentText" maxlength="1000" style="margin: 10px; padding: 10px;" placeholder="Текст комментария..."></textarea>';
    echo '</div>';
    echo '<div>';
    echo '<button class="buttonsimple" id="addCommentBtn">Оставить комментарий</button>';
    echo '</div>';
} else {
    // В случае, если не передан корректный идентификатор блога
    echo "Некорректный идентификатор блога.";
}
?>
