var headerText = `<div>

<header>
        <div class = "header-img"></div>
     
        <div>
            <table class = "headtable"> <tr>
                <td align = "center"><a class = "headline" href = "about nologin.html" > О сайте </a></td> 
                <td align = "center"><a class = "headline" href = "reg.html" > Регистрация </a></td>
                <td align = "center"><a class = "headline" href = "login.html" > Вход </a></td>
                <td align = "center"><a class = "headline" href = "404.html" > Забыл пароль? </a></td>
            </tr></table>
        </div>
    
</header>
</div>`;

function setdeader() {
  var header =  document.createElement("div");
  header.innerHTML = headerText ;
  document.body.insertAdjacentElement('afterbegin', header );
}

setdeader();

var footerText = `<div>
<div class = "footer"> 
      (c) 2022 - <a onclick = "contacts();">Контакты</a> | <a href = "about.html">О сайте</a> | <a href = "about nologin.html">Главная</a>
</div>`

function setFooter() {
  var footer = document.createElement("div");
  footer.innerHTML = footerText;
  document.body.insertAdjacentElement('beforeend', footer);
}

setFooter();