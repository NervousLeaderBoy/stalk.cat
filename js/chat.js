// Ждем, пока документ полностью загрузится
$(document).ready(function () {
    // Загрузка списка пользователей при загрузке страницы
    loadUserList();

    // Функция для загрузки списка пользователей
    function loadUserList() {
        $.ajax({
            url: "php/loadUsersList.php", // Замените на ваш путь к серверному скрипту
            type: "GET",
            success: function (data) {
                $("#userList").html(data);

                // Добавляем обработчик клика на каждое имя пользователя
                $(".user-item").click(function () {
                    // Получаем идентификатор пользователя из data-атрибута
                    var userId = $(this).data("user-id");

                    // Загружаем чат для выбранного пользователя
                    loadChat(userId);
                });
            },
            error: function () {
                console.log("Ошибка при загрузке списка пользователей.");
            }
        });
    }

    // Функция для загрузки чата с определенным пользователем
    function loadChat(userId) {
        $.ajax({
            url: 'php/loadChat.php', // Путь к серверному скрипту для загрузки чата
            type: 'GET',
            data: { userId: userId },
            success: function (data) {
                // Обработка успешного ответа от сервера
                $("#chat").html(data); // Вставить полученный чат в блок #chat
            },
            error: function () {
                // Обработка ошибки
                console.log('Ошибка при загрузке чата.');
            }
        });
    }
    
});
