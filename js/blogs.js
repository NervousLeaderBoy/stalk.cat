$(document).ready(function () {
    // Загрузка блогов при загрузке страницы
    loadBlogs();
  
    // Обработчик ввода в поле поиска
    $("#searchInput").on("input", function () {
      loadBlogs();
    });
  
    // Обработчик нажатия клавиши Enter в поле поиска
    $("#searchBoxel").keypress(function (e) {
      if (e.which === 13) { // Код клавиши Enter
        searchByTag();
      }
    });
  
    // Обработчик клика на кнопке "Создание блога"
   /* $("#createBlogBtn").click(function () {
        // Переход на страницу создания блога
        window.location.href = "http://stalk.cat/createBlog.html";
      });
  */
    // Обработчик клика на кнопке "Показать блог" с использованием делегирования
    $('#blogsContainer').on('click', '.showBlogBtn', function () {
      var blogId = $(this).data('blogid');
      window.location.href = 'http://stalk.cat/blog.html?id=' + blogId;
    });
  
    function loadBlogs() {
      $.ajax({
        url: "php/blogs.php",
        type: "GET",
        success: function (data) {
          $("#blogsContainer").html(data);
        },
        error: function () {
          console.log("Ошибка при загрузке блогов.");
        }
      });
    }
  
    function searchByTag() {
      var searchTag = $("#searchBoxel").val().trim().toLowerCase();
  
      // Проверка наличия текста в поле поиска
      if (searchTag === "") {
        loadBlogs(); // Если поле пустое, загружаем все блоги
        return;
      }
  
      // AJAX-запрос для получения блогов по тегу
      $.ajax({
        url: "php/blogs.php?tag=" + searchTag,
        type: "GET",
        success: function (data) {
          $("#blogsContainer").html(data);
        },
        error: function () {
          console.log("Ошибка при загрузке блогов по тегу.");
        }
      });
    }
  });
  