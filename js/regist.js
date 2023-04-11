pasreg = /(?=.{8,}$)(?=.*[\d])(?=.*[A-zА-яЁё])(?=.*[a-zа-яё])(?=.*[A-ZА-ЯЁ]).*/;
mailreg = /^[a-zA-Z\d][a-zA-Z\d._-]{1,}@[a-z\d]{2,}\.[a-z]{2,}$/;

var pass = document.querySelector("#pass1");
var pass2 = document.querySelector("#pass2");
var mail = document.querySelector("#mail");
var s1 = document.querySelector("#s1");
var s2 = document.querySelector("#s2");
var s3 = document.querySelector("#s3");
var send = document.querySelector("#reg");
var frm = document.querySelector("#regist");

pass.addEventListener("change", validation2);
pass.addEventListener("change", passmatch);
pass2.addEventListener("change", passmatch);
mail.addEventListener("change", emailcheck);

send.addEventListener("click", validation2);
send.addEventListener("click", passmatch);
send.addEventListener("click", emailcheck);
send.addEventListener("click", register);

frm.addEventListener("submit", function (e) { e.preventDefault(); });

function validation2() {
  if (pass.value == "" || pass.value == "NULL" || pass.value == 0) {
    pass.setCustomValidity('Введите пароль');
    pass.style.borderColor = "rgb(249, 139, 139)";
    pass.style.background = "linear-gradient(rgba(255, 255, 255, .5), rgba(249, 139, 139, .5))";
    s2.innerHTML = "Введите пароль";
  }

  else if (pasreg.test(pass.value) == false) {
    pass.setCustomValidity('Пароль должен содержать от 8 символов, одну заглавную и строчную букву, одну цифру');
    pass.style.borderColor = "rgb(249, 139, 139)";
    pass.style.background = "linear-gradient(rgba(255, 255, 255, .5), rgba(249, 139, 139, .5))";
    s2.innerHTML = "Пароль должен содержать от 8 символов, одну заглавную и строчную букву, одну цифру";
  }

  else {
    pass.setCustomValidity('');
    pass.style.borderColor = "rgb(116, 252, 118)";
    pass.style.background = "linear-gradient(rgba(255, 255, 255, .5), rgba(116, 252, 118, .5))";
    s2.innerHTML = "";
  }
}

function passmatch() {
  if (pass2.value == "" || pass2.value == "NULL" || pass2.value == 0) {
    pass2.setCustomValidity('Повторите пароль');
    pass2.style.borderColor = "rgb(249, 139, 139)";
    pass2.style.background = "linear-gradient(rgba(255, 255, 255, .5), rgba(249, 139, 139, .5))";
    s3.innerHTML = "Повторите пароль";
  }

  else if (pasreg.test(pass.value) == false) {
    pass2.setCustomValidity('Введите пароль в соответствии с форматом');
    pass2.style.borderColor = "rgb(249, 139, 139)";
    pass2.style.background = "linear-gradient(rgba(255, 255, 255, .5), rgba(249, 139, 139, .5))";
    s3.innerHTML = "Введите пароль в соответствии с форматом";
  }

  else if (pasreg.test(pass.value) == true) {

    if (pass.value != pass2.value) {
      pass2.setCustomValidity('Пароли не совпадают');
      pass2.style.borderColor = "rgb(249, 139, 139)";
      pass2.style.background = "linear-gradient(rgba(255, 255, 255, .5), rgba(249, 139, 139, .5))";
      s3.innerHTML = "Пароли не совпадают";
    }

    else {
      pass2.setCustomValidity('');
      pass2.style.borderColor = "rgb(116, 252, 118)";
      pass2.style.background = "linear-gradient(rgba(255, 255, 255, .5), rgba(116, 252, 118, .5))";
      s3.innerHTML = "";
    }
  }
}

function emailcheck() {
  if (mail.value == "" || mail.value == "NULL" || mail.value == 0) {
    mail.setCustomValidity('Введите адрес почты');
    mail.style.borderColor = "rgb(249, 139, 139)";
    mail.style.background = "linear-gradient(rgba(255, 255, 255, .5), rgba(249, 139, 139, .5))";
    s1.innerHTML = "Введите адрес почты";
  }

  else if (mailreg.test(mail.value) == false) {
    mail.setCustomValidity('Введите корректный почтовый адрес');
    mail.style.borderColor = "rgb(249, 139, 139)";
    mail.style.background = "linear-gradient(rgba(255, 255, 255, .5), rgba(249, 139, 139, .5))";
    s1.innerHTML = "Введите корректный почтовый адрес";
  }

  else {
    mail.setCustomValidity('');
    mail.style.borderColor = "rgb(116, 252, 118)";
    mail.style.background = "linear-gradient(rgba(255, 255, 255, .5), rgba(116, 252, 118, .5))";
    s1.innerHTML = "";
  }
}

function register() {
  if (pass.validity.valid && pass2.validity.valid && mail.validity.valid) {
    var aj2 = $.ajax({
      url: "php/reg.php",
      type: "POST",
      data: $('form').serialize(),
      dataType: "text",
    })

    aj2.done(function (response) {
      if (response == "Регистрация прошла успешно.") {
        alert(response);
        location.replace("login.html");
      }
      else {
        alert(response + "\nОбновите страницу и попробуйте снова. Если ошибка не исправляется, обратитесь к администратору.");
      }
    })
  }
}