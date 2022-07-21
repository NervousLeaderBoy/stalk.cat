let logged;

var headerText = `<div>
<header>
        <div class = "header-img"></div>
        <div>
      
            <table class = "headtable"> <tr>
                <td align = "center"><a class = "headline" href = "profile" > Профиль </a></td> 
                <td align = "center"><a class = "headline" href = "404 copy" > О сайте </a></td>
                <td align = "center"><a class = "headline" href = "players" > Игроки </a></td>
                <td align = "center"><a class = "headline" href = "404 copy" > Игровая </a></td>
                <td align = "center"><a class = "headline" href = "chat" > Чат </a></td>
                <td align = "center"><a class = "headline" href = "404 copy" > Лс </a></td>
                <td align = "center"><a class = "headline" href = "404 copy" > Блоги </a></td>
                <td align = "center"><a class = "headline" href = "news" > Новости </a></td>
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
      <div style="align: left; margin-left:20px; display: inline-block;">(c) 2022 - </div> <div style="align: center; display: inline-block;"><a onclick = "contacts();">Контакты</a></div><div style="display: inline-block;">|</div><div style = "display: inline-block;"></div><a href = "about.html">О сайте</a></div>
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
    window.location.href = "index";
    false;
  }
}

function contacts(){
  window.location.href = "https://vk.com/atomicprettyboy";
}




