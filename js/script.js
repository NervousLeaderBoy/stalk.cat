var headerText = `<div>

<header>
        <div class = "header-img"></div>
        <div>
      
            <table class = "headtable"> <tr>
                <td align = "center"><a class = "headline" href = "profile.html" > Профиль </a></td> 
                <td align = "center"><a class = "headline" href = "about.html" > О сайте </a></td>
                <td align = "center"><a class = "headline" href = "players.html" > Игроки </a></td>
                <td align = "center"><a class = "headline" href = "game.html" > Игровая </a></td>
                <td align = "center"><a class = "headline" href = "chat.html" > Чат </a></td>
                <td align = "center"><a class = "headline" href = "pm.html" > Лс </a></td>
                <td align = "center"><a class = "headline" href = "blogs.html" > Блоги </a></td>
                <td align = "center"><a class = "headline" href = "news.html" > Новости </a></td>
                <td align = "center"><a class = "headline" onclick = "logout();"> Выход</a></td>
            </tr></table>
        </div>
    
</header>
</div>`;

function setHeader() {
  var header =  document.createElement("div");
  header.innerHTML = headerText ;
  document.body.insertAdjacentElement('afterbegin', header );
}

setHeader();

var footerText =  `<div>
<div class = "footer"> 
      (c) 2023 - <a onclick = "contacts();">Контакты</a> | <a href = "about.html">О сайте</a> | <a href = "about nologin.html">Главная</a>
</div>`

function setFooter() {
  var footer = document.createElement("div");
  footer.innerHTML = footerText;
  document.body.insertAdjacentElement('beforeend', footer);
}

setFooter();

function logout(){
  var logoutvar = confirm("Вы точно хотите выйти?");
    if (logoutvar) {
        var logoutaj = $.ajax({
            type: "POST",
            url: "../php/logout.php"
        })

        logoutaj.done(function (response) {
            alert(response);
            window.location.href = "about nologin.html";
        })
  }
}

function contacts(){
  window.location.href = "https://vk.com/atomicprettyboy";
}




