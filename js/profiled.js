$(document).ready(function() {
    // Используем делегирование событий для родительского элемента
    $(document).on('click', '.profiled', function() {
        // Получаем user-id из атрибута элемента
        var userId = $(this).attr('data-user-id');
        
        // Перенаправляем пользователя на страницу viewProfile.html с параметром userId
        window.location.href = 'viewProfile.html?userId=' + userId;
    });
});
