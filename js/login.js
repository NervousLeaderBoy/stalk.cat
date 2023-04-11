var pass = document.querySelector("#pass");
var mail = document.querySelector("#mail");
var frm = document.querySelector("#login");
var send = document.querySelector("#in");

send.addEventListener("click", inwalk);

frm.addEventListener("submit", function (e) { e.preventDefault(); });

window.addEventListener('beforeunload', function() {
  this.localStorage.setItem('email', this.document.getElementById('mail').value);
})

function inwalk() {
  if (pass.validity.valid && mail.validity.valid) {
    var aj = $.ajax({
      url: "php/login.php",
      type: "POST",
      data: $('form').serialize(),
      dataType: "text",
    })

    aj.done(function (response) {
      if (response == "Ошибка входа!") {
        alert(response + "\nОбновите страницу и попробуйте снова. Если ошибка не исправляется, обратитесь к администратору.");
      }
      else {
        location.replace("profile.html");
      }
    })
  }
}