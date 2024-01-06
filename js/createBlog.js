$(document).ready(function () {
    // Обработка отправки формы создания блога
    $("#createBlogForm").submit(function (event) {
        event.preventDefault(); // Предотвращаем отправку формы по умолчанию

        // Получаем значения полей формы
        var blogTitle = $("#blogTitle").val();
        var blogTags = $("#blogTags").val();
        var blogText = $("#blogText").val();

        // Проверяем, что все поля заполнены
        if (blogTitle && blogTags && blogText) {
            // AJAX-запрос для отправки блога на сервер
            $.ajax({
                url: "php/createBlog.php",
                type: "POST",
                data: {
                    title: blogTitle,
                    tags: blogTags,
                    text: blogText
                },
                success: function (data) {
                    // Обработка успешного ответа от сервера
                    console.log(data); // Выводим ответ в консоль (можно заменить на другие действия)
                    alert("Блог успешно создан!");
                    window.location.href = 'http://stalk.cat/blogs.html';
                },
                error: function () {
                    // Обработка ошибки
                    console.log("Ошибка при отправке блога на сервер");
                }
            });
        } else {
            alert("Пожалуйста, заполните все поля формы.");
        }
    });
});
