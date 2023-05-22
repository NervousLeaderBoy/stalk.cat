var body = document.querySelector("body");

body.onbeforeunload = function () {
  var aj = $.ajax({
    url: "php/onclose.php",
  })

  aj.done(function (response) {
    alert(response);
  })
}