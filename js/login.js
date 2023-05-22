pasreg = /(?=.{8,}$)(?=.*[\d])(?=.*[A-zА-яЁё])(?=.*[a-zа-яё])(?=.*[A-ZА-ЯЁ]).*/;
mailreg = /^[a-zA-Z\d][a-zA-Z\d._-]{1,}@[a-z\d]{2,}\.[a-z]{2,}$/;

var pass = document.querySelector("#pass");
var mail = document.querySelector("#mail");
var frm = document.querySelector("#login");
var send = document.querySelector("#in");

var s1 = document.querySelector("#s1");
var s2 = document.querySelector("#s2");

send.addEventListener("click", emailcheck);
send.addEventListener("click", validation2);
send.addEventListener("click", inwalk);

frm.addEventListener("submit", function (e) { e.preventDefault(); });

// window.addEventListener('beforeunload', function() {
//   this.localStorage.setItem('email', this.document.getElementById('mail').value);
// })

function inwalk() {
    if (pass.validity.valid && mail.validity.valid) {
        var aj = $.ajax({
            url: "php/login.php",
            type: "POST",
            data: $('form').serialize(),
            dataType: "text",
        })

        aj.done(function (response) {
            if (response == "Пользователь с такой почтой не найден") {
                s1.innerHTML = response;
                s2.innerHTML = "";
            }
            else if (response == "Неверный пароль") {
                s1.innerHTML = "";
                s2.innerHTML = response;
            }
            else if (response == "Ошибка входа.") {
                alert(response + "\nОбновите страницу и попробуйте снова. Если ошибка не исправляется, обратитесь к администратору.");
                s1.innerHTML = s2.innerHTML = "";
            }
            else {
                s1.innerHTML = s2.innerHTML = "";
                location.replace("profile.html");
            }
        })
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