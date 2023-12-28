gettable();
function gettable() {

    var game = document.querySelector(".gamewrapper");
    
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

        var charInfo = $("#char").data("info");
        // это чтобы вручную не вызывать функцию установки характеристик 10 раз
        // alert($("#char").data("info").token);
        // alert(JSON.stringify(charInfo));
        // alert(typeof (JSON.parse(JSON.stringify(charInfo))));
        var jsontest = JSON.parse(JSON.stringify(charInfo));

        // jsontest.forEach(function (value, key) {
        //     alert(key + " " + value);
        // })

        setCharacteristics("health", charInfo.health);
        setCharacteristics("infection", charInfo.infection);
        setCharacteristics("hunger", charInfo.hunger);
        setCharacteristics("thirst", charInfo.thirst);
        setCharacteristics("energy", charInfo.energy);
        
        setCharacteristics("strength", charInfo.strength);
        setCharacteristics("endurance", charInfo.endurance);
        setCharacteristics("hunting", charInfo.hunting);
        setCharacteristics("healing", charInfo.healing);
        setCharacteristics("reputation", charInfo.reputation);


        
        function setCharacteristics(characteristicName, chacteristicValue) {
            let characteristicRow = document.getElementById(characteristicName);
            let val = chacteristicValue;
            for (let i = 0; i < characteristicRow.childElementCount; i++) {
                let tableCells = characteristicRow.children;
                if (val > 0) {
                    tableCells[i].setAttribute("class", "filled");
                    val -= 10;
                }
                else tableCells[i].removeAttribute("class");
            }
        }
        
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