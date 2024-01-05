$(document).ready(function () {
    // Получение идентификатора блога из параметров URL
    var blogId = getParameterByName('id');

    loadBlog();

    function loadBlog() {
        // AJAX-запрос для получения блога по идентификатору
        $.ajax({
            url: 'php/blog.php?id=' + blogId,
            type: 'GET',
            success: function (data) {
                $("#blogContent").html(data);
                $('.comeBack').on('click', function () {
                    // Переход на страницу всех блогов
                    window.location.href = 'http://stalk.cat/blogs.html';
                });

                // Обработчик клика на кнопку "Оставить комментарий"
                $('#addCommentBtn').on('click', function () {
                    addComment();
                });
            },
            error: function () {
                console.error('Ошибка при загрузке блога');
            }
        });
    }

    // Функция для добавления комментария
    function addComment() {
        var commentText = $('#commentText').val();

        // Проверка, что текст комментария не пустой
        if (commentText.trim() === '') {
            alert('Введите текст комментария.');
            return;
        }

        // AJAX-запрос для добавления комментария
        $.ajax({
            url: 'php/addComment.php',
            type: 'POST',
            data: { blogId: blogId, text: commentText },
            dataType: 'json', // Указываем, что ожидаем JSON-ответ
            success: function (data) {
                if (data.status === 'success') {
                    alert('Комментарий успешно добавлен!');
                    // Здесь можно добавить логику обновления комментариев без перезагрузки страницы
                } else {
                    alert('Ошибка: ' + data.message);
                }
            },
            error: function () {
                console.error('Ошибка при добавлении комментария');
            }
        });
    }

    // Функция для получения параметра из URL
    function getParameterByName(name) {
        name = name.replace(/[\[\]]/g, '\\$&');
        var url = window.location.href;
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
        var results = regex.exec(url);

        if (!results) return null;

        return decodeURIComponent(results[2] || '');
    }
});
