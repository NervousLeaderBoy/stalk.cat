// Ваш скрипт (например, в файле script.js)
$(document).ready(function () {
    // Загрузка новостей при загрузке страницы
    loadNews();

    // Функция для загрузки новостей
    function loadNews() {
        $.ajax({
            url: "php/loadNews.php",
            type: "GET",
            success: function (data) {
                $("#newsContainer").html(data);
            },
            error: function () {
                console.log("Ошибка при загрузке новостей.");
            }
        });
    }

    // После загрузки формы проверяем, является ли пользователь администратором
    $.ajax({
        url: "php/checkAdmin.php",
        type: "GET",
        success: function (isAdmin) {
            if (isAdmin === "1") {
                // Если пользователь администратор, показываем форму
                $("#newsForm").css("display", "block");
            }
        },
        error: function () {
            console.log("Ошибка при проверке статуса администратора.");
        }
    });

    // Обработчик клика на кнопку "Создать новость"
    $("#createNewsBtn").click(function () {
        // Получаем текст новости из поля ввода
        var newsText = $("#newsText").val();

        // Проверяем, что поле не пустое
        if (newsText) {
            // Отправляем текст новости на сервер для создания
            $.ajax({
                url: "php/createNews.php",
                type: "POST",
                data: { newsText: newsText },
                success: function (data) {
                    // Обновляем список новостей после создания новости
                    loadNews();
                    // Очищаем поле ввода
                    $("#newsText").val('');
                    console.log(data);
                },
                error: function () {
                    console.log("Ошибка при создании новости.");
                }
            });
        } else {
            alert("Пожалуйста, введите текст новости.");
        }
    });
});
