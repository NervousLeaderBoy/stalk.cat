window.onbeforeunload = function () {
  var aj = $.ajax({
    url: "php/onclose.php",
  })
}