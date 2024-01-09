// Ждем, пока документ полностью загрузится
$(document).ready(function () {
    // Переменная для хранения id текущего пользователя
    var currentUserId;
    var recipientUserId;

    // Загрузка id текущего пользователя при загрузке страницы
    $.ajax({
        url: "php/checkID.php",
        type: "GET",
        success: function (data) {
            currentUserId = data;

            // Загрузка списка пользователей при загрузке страницы
            loadUserList();

        },
        error: function () {
            console.log("Ошибка при загрузке id текущего пользователя.");
        }
    });

    // Функция для загрузки списка пользователей
    function loadUserList() {
        $.ajax({
            url: "php/loadUsersList.php",
            type: "GET",
            success: function (data) {
                $("#userList").html(data);

                // Добавляем обработчик клика на каждое имя пользователя
                $(".user-item").click(function () {
                    // Получаем идентификатор пользователя из data-атрибута
                    var userId = $(this).data("user-id");

                    console.log("Clicked on user with ID: " + userId);

                    // Обновляем recipientUserId
                    recipientUserId = userId;
                    console.log("Recipient user ID updated to: " + recipientUserId);

                    // Загружаем чат для выбранного пользователя
                    loadChat(userId);
                });
                
                if (localStorage.getItem('recipientUserId') !== null) {
                    // Объект существует, можно получить его значение
                    recipientUserId = localStorage.getItem('recipientUserId');
                    localStorage.removeItem('recipientUserId');
                    console.log('recipientUserId:', recipientUserId);
                } else {
                    console.log('Объект не существует в localStorage');
                }

                // Если текущий пользователь не выбран, загружаем чат для текущего пользователя
                if (!recipientUserId) {
                    console.log("Loading chat for current user ID: " + currentUserId);
                    loadChat(currentUserId);
                }
                else loadChat(recipientUserId);
            },
            error: function () {
                console.log("Ошибка при загрузке списка пользователей.");
            }
        });
    }

    // Функция для загрузки чата с определенным пользователем
    function loadChat(userId) {
        $.ajax({
            url: 'php/loadChat.php',
            type: 'GET',
            data: { userId: userId },
            success: function (data) {
                // Обработка успешного ответа от сервера
                console.log('Чат загружен успешно для пользователя с ID: ' + userId);
                $("#chat").html(data); // Вставить полученный чат в блок #messages
            },
            error: function (xhr, status, error) {
                // Обработка ошибки
                console.log('Ошибка при загрузке чата для пользователя с ID ' + userId + ': ' + error);
            }
        });
    }

    // Обработчик клика на кнопку отправки сообщения
    $("#sendMessageBtn").click(function () {
        // Получаем текст сообщения из textarea
        var messageText = $("#messageText").val();
        // Проверяем, что текст сообщения не пустой
        if (messageText) {
            // Отправляем сообщение на сервер
            $.ajax({
                url: 'php/sendMessage.php',
                type: 'POST',
                data: { senderId: currentUserId, recipientId: recipientUserId, text: messageText },
                success: function (response) {
                    // Обработка успешной отправки сообщения
                    console.log('Сообщение отправлено успешно.');
                    loadChat(recipientUserId);
                    // Здесь можно добавить обновление чата или других действий после успешной отправки
                },
                error: function (xhr, status, error) {
                    // Обработка ошибки отправки сообщения
                    console.log('Ошибка при отправке сообщения.');
                    console.log(xhr.responseText); // Выводим детали ошибки в консоль
                }
            });

            // Очищаем поле ввода сообщения после отправки
            $("#messageText").val('');
        } else {
            // Выводим предупреждение, если текст сообщения пустой
            alert("Введите текст сообщения.");
        }
    });

    
});
