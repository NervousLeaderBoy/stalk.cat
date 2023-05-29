gettable();
function gettable() {

    var game = document.getElementById("game");
    
    var getgametable = $.ajax({
        type: "GET",
        url: "../php/getgametable.php",
        dataType: "text",
    })
    
    getgametable.done(function(response) {
        game.innerHTML = response;
        
        var msgdiv = document.getElementById("msg");
        var transitlist = document.querySelectorAll(".transition");
        transitlist.forEach(element => {
            element.addEventListener("click", function () {
                let conf = confirm("Вы действительно хотите перейти к локации " + $(element).data("info").name + "?");
                if (conf) {
                    posinfo.loc = $(element).data("info").name;
                    posinfo.posx = -1;
                    posinfo.posy = -1;
                    let changelocaj = $.ajax({
                        type: "POST",
                        url: "../php/updatepos.php",
                        data: {
                            datastr: JSON.stringify(posinfo)
                        }
                    })
                    
                    changelocaj.done(function (response) {
                        if (response != "") alert(response);
                        else gettable();
                    })
                }
            })
        })
        
        var tdlist = document.querySelectorAll(".gametable > tbody td");
        var lng = tdlist.length;
        
        var char = document.getElementById("char");
        // alert($("#char").data("info").token);
        var posx = -1, posy = -1;
        
        var locname = document.getElementById("locname").innerHTML;
        
        var posinfo = {
            char: char.getAttribute("title"),
            loc: locname.toLowerCase(),
            posx: posx,
            posy: posy
        };
        
        function brd() {
            this.focus();
            if (this.getAttribute("class") == null || (this.getAttribute("class") != null && !this.getAttribute("class").includes("occupied"))) {
                this.appendChild(char);
                this.setAttribute("class", "occupied");
                posx = $(this).closest("td").index();
                posy = $(this).closest("tr").index();
                
                posinfo.posx = posx;
                posinfo.posy = posy;
                updPos();
            }
        }
        
        function unbrd() {
            this.blur();
            let intid = setInterval(() => {
                if (!this.firstChild) {
                    this.removeAttribute("class");
                    clearInterval(intid);
                }
            }, 100);
        }
        
        for (var i = 0; i<lng, elem = tdlist[i]; i++) {
            elem.setAttribute("tabindex", "1");
            elem.addEventListener("focus", brd);
            elem.addEventListener("blur", unbrd);
        }
        
        function updPos() {
            var updpos = $.ajax({
                type: "POST",
                url: "../php/updatepos.php",
                data: {
                    datastr: JSON.stringify(posinfo)
                }
            })
            
            updpos.done(function(response) {
                if (response!="") alert(response);
            })
        }
    })
    
}