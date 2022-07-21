var headerText = `<div>

<header>
        <div class = "header-img"></div>
     
        <div>
            <table class = "headtable"> <tr>
                <td align = "center"><a class = "headline" href = "about" > О сайте </a></td> 
                <td align = "center"><a class = "headline" href = "reg" > Регистрация </a></td>
                <td align = "center"><a class = "headline" href = "login" > Вход </a></td>
                <td align = "center"><a class = "headline" href = "404" > Забыл пароль? </a></td>
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
      <div style="align: left; margin-left:20px; display: inline-block;">(c) 2022 - </div> <div style="align: center; display: inline-block;"><a onclick = "contacts();">Контакты</a></div><div style="display: inline-block;">|</div><div style = "display: inline-block;"></div><a href = "about.html">О сайте</a></div>
</div>`

function setFooter() {
  var footer = document.createElement("div");
  footer.innerHTML = footerText;
  document.body.insertAdjacentElement('beforeend', footer);
}

setFooter();

function contacts(){
  window.location.href = "https://vk.com/atomicprettyboy";
}
