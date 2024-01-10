gettable();
var calledParallax = false;
var energyTimeout, preyTimeout;

function gettable() {

    var game = document.querySelector(".gamewrapper");
    
    var getgametable = $.ajax({
        type: "GET",
        url: "../php/getgametable.php",
        dataType: "text",
    })
    
    getgametable.done(function (response) {
        game.innerHTML = response;
        
        //////////////////////////////////////////////////////////// TRANSITIONS
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
        
        //////////////////////////////////////////////////////////// PLAYER POSITION
        var char = document.getElementById("char");
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

        var tdlist = document.querySelectorAll(".gametable > tbody td");
        
        for (let i = 0; i < tdlist.length, elem = tdlist[i]; i++) {
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
            
            updpos.done(function (response) {
                if (response != "") alert(response);
            })
        }

        //////////////////////////////////////////////////////////// PLAYER CHARACTERISTICS
        var playerCharacteristics = JSON.parse(JSON.stringify($("#char").data("info")));
        // alert(jsontest.name);
        // for (var k in jsontest) alert(k + " " + jsontest[k]);//setCharacteristics(k, jsontest[k]);
        
        function setCharacteristics(characteristicName, chacteristicValue) {
            if (chacteristicValue < 0 || chacteristicValue > 100) return;
            else {
                playerCharacteristics[characteristicName] = chacteristicValue;
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
                let char = {
                    charName: characteristicName,
                    charValue: chacteristicValue
                }
                let upd = $.ajax({
                    type: "POST",
                    url: "../php/updateCharacteristics.php",
                    data: {
                        datastr: JSON.stringify(char)
                    },
                    success: function (data) {
                        if (data!="") alert(data);
                    }
                })
            }
        }

        clearInterval(energyTimeout);
        energyTimeout = setTimeout(restoreEnergy, 5000);

        function restoreEnergy() {
            setCharacteristics("energy", +playerCharacteristics.energy + 1);
            energyTimeout = setTimeout(restoreEnergy, 5000);
        }
        

        //////////////////////////////////////////////////////////// OTHERS INFO

        var otherBlock = document.querySelector(".othersInfo");
        otherBlock.style.visibility = "hidden";

        var othersInfoClose = document.querySelector("#othersInfoClose");
        othersInfoClose.addEventListener("click", function () {
            otherBlock.style.visibility = "hidden";
        })

        var otherName = document.querySelector("#otherName");
        var otherPic = document.querySelector("#otherPic");
        var otherInfo = document.querySelector("#otherInfo");
        var otherType = document.querySelector("#otherType");
        var otherCharacteristics = document.querySelector("#otherCharacteristics");


        var otherPlayerActions = document.querySelector("#otherPlayerActions");
        otherPlayerActions.style.display = "none";
        var otherPlayerProfileBtn = document.querySelector("#otherPlayerProfile");
        var otherPlayerPMBtn = document.querySelector("#otherPlayerPM");
        
        var itemsActions = document.querySelector("#itemsActions");
        itemsActions.style.display = "none";
        var itemActionEquip = document.querySelector("#itemActionEquip");
        var itemActionEat = document.querySelector("#itemActionEat");
        var itemActionUse = document.querySelector("#itemActionUse");
        var itemActionCharge = document.querySelector("#itemActionCharge");
        var itemActionThrow = document.querySelector("#itemActionThrow");
        
        var preyActions = document.querySelector("#preyActions");
        var PreyActionHunt = document.querySelector("#PreyActionHunt");
        var PreyActionAttack = document.querySelector("#PreyActionAttack");

        var itemsTypes = { "equipable": "Снаряжение", "edible": "Съедобно", "artifact": "Артефакт", "medicine": "Лекарство", "weapon": "Оружие", "supplies": "Боеприпас", "misc": "Другое", "tool": "Инструмент" };

        var others = document.querySelectorAll(".other");
        others.forEach(element => {
            showInfo(element);
        })

        function showInfo(element) {
            element.addEventListener("click", function () {
                let otherAttributes = JSON.parse(element.getAttribute("data-info"));
                otherName.innerHTML = otherAttributes.name;
                otherPic.setAttribute("src", element.getAttribute("src"));

                if (element.getAttribute("class").includes("player")) {
                    otherInfo.innerHTML = otherAttributes.about;
                    otherType.innerHTML = otherAttributes.isadmin;

                    otherCharacteristics.style.display = "none";
                    otherPlayerActions.style.display = "block";
                    itemsActions.style.display = "none";
                    preyActions.style.display = "none";
                    
                    otherPlayerProfileBtn.onclick = function () {
                        window.open('viewProfile.html?userId=' + otherAttributes.idUsers, '_blank').focus();
                    }
                    otherPlayerPMBtn.onclick = function() {
                        localStorage.setItem('recipientUserId', otherAttributes.idUsers);
                        window.open('pm.html', '_blank').focus();
                    }
                }
                else if (element.getAttribute("class").includes("item")) {
                    otherInfo.innerHTML = otherAttributes.description;
                    otherType.innerHTML = itemsTypes[otherAttributes.type];
                    
                    otherCharacteristics.style.display = "block";
                    otherPlayerActions.style.display = "none";
                    itemsActions.style.display = "block";
                    preyActions.style.display = "none";
                    
                    let itemsActionsObject = itemsActions.children;
                    for (let i = 0; i < itemsActions.childElementCount; i++) {
                        itemsActionsObject[i].style.display = "none";
                    }
                    itemActionThrow.style.display = "inline-block";
                    
                    if (otherAttributes.type == "equipable") itemActionEquip.style.display = "inline-block";
                    else if (otherAttributes.type == "edible") itemActionEat.style.display = "inline-block";
                    else if (otherAttributes.type == "supplies") itemActionCharge.style.display = "inline-block";
                    else itemActionUse.style.display = "inline-block";
                }
                else if (element.getAttribute("class").includes("prey")) {
                    otherInfo.innerHTML = otherAttributes.description;
                    otherType.innerHTML = "Добыча";
                    
                    otherCharacteristics.style.display = "block";
                    otherPlayerActions.style.display = "none";
                    itemsActions.style.display = "none";
                    preyActions.style.display = "block";
                    
                    otherCharacteristics.innerHTML = "Здоровье: " + otherAttributes.health + "\n";


                    if (hunting && huntingAt == element) {
                        PreyActionHunt.value = "Убежать";
                        PreyActionAttack.disabled = false;
                    }
                    else {
                        PreyActionHunt.value = "Охотиться"
                        PreyActionAttack.disabled = true;
                    }

                    PreyActionHunt.onclick = function () {
                        if (PreyActionHunt.value == "Охотиться") {
                            if (!hunting) {
                                startHunt(element);
                                if (hunting) {
                                    PreyActionHunt.value = "Убежать";
                                    PreyActionAttack.disabled = false;
                                }
                            }
                            else alert("Сначала закончите охоту на текущую добычу (" + JSON.parse(huntingAt.getAttribute("data-info")).name + ")");
                        }
                        else {
                            stopHunt();
                            PreyActionHunt.value = "Охотиться"
                            PreyActionAttack.disabled = true;
                        }
                    }

                    PreyActionAttack.onclick = function () {
                        attack();
                    }
                }

                otherBlock.style.visibility = "visible";
            })
        }

        //////////////////////////////////////////////////////////// PREY
        
        var locPreyData;

        var getPrey = $.ajax({
            type: "GET",
            url: "../php/getLocPrey.php",
            data: {
                loc: locname.toLowerCase()
            },
            success: function (data) {
                if (data != "[]") {
                    locPreyData = JSON.parse(data);
                    preyTimeout = setTimeout(spawnPrey, 1000);
                }
            }
        })

        clearInterval(preyTimeout);
        var preyNum = 0;

        function spawnPrey() {
            if (preyNum < 5) {

                let tdlist = document.querySelectorAll(".gametable > tbody td:not(.occupied)");
                
                let prey = weightBasedChoice(locPreyData, "spawnRate");
                let preyItem = "";
                
                if (prey.drop != "") {
                    if (Object.keys(prey.drop).length == 1) preyItem = prey.drop[0];
                    else preyItem = weightBasedChoice(prey.drop, "spawnRate");
                }
                
                delete prey.spawnRate;
                delete prey.drop;
                // for (var k in prey) console.log(k + ": " + prey[k]);
                let preyPic = document.createElement("img");
                preyPic.setAttribute("class", "other prey");
                preyPic.setAttribute("src", "../images/prey/" + prey.image);
                preyPic.setAttribute("data-info", JSON.stringify(prey));

                let spawnAt = tdlist[Math.floor(Math.random() * tdlist.length)];
                spawnAt.setAttribute("class", "occupied");
                spawnAt.appendChild(preyPic);
                
                showInfo(preyPic);
                
                preyNum++;
            }

            //https://stackoverflow.com/a/34656970
            var min = 5, max = 10;
            var rand = Math.floor(Math.random() * (max - min + 1) + min); //Generate Random number between min - max (secs)
            preyTimeout = setTimeout(spawnPrey, rand * 1000);
        }

        var hunting = false;
        var huntingAt = "";
        var huntingAtAttrs = "";

        function startHunt(prey) {
            if (playerCharacteristics.energy <= 0) alert("Нет энергии для охоты!");
            else {
                hunting = true;
                huntingAt = prey;
                huntingAtAttrs = JSON.parse(prey.getAttribute("data-info"));
                huntingAt.parentElement.setAttribute("class", "occupied hunting");
            }
        }
        
        function stopHunt() {
            hunting = false;
            if (huntingAt != "") {
                huntingAt.parentElement.setAttribute("class", "occupied");
                huntingAt = huntingAtAttrs = "";
            }
        }

        function attack() {
            if (hunting && huntingAt != "" && huntingAtAttrs != "") {
                // flee rate...
                if (playerCharacteristics.energy <= 0) alert("Нет энергии для охоты");
                else if (playerCharacteristics.health <= 0) alert("Нет здоровья");
                else {
                    huntingAtAttrs.health -= playerCharacteristics.strength;
                    setCharacteristics("energy", playerCharacteristics.energy - 5);
                    huntingAt.setAttribute("data-info", JSON.stringify(huntingAtAttrs));
                    if (huntingAtAttrs.health <= 0) {
                        huntingAt.parentElement.removeAttribute("class");
                        huntingAt.remove();
                        huntingAt = huntingAtAttrs = "";
                        preyNum--;
                        stopHunt();
                        otherBlock.style.visibility = "hidden";
                    }
                    else {
                        takeDamage();
                    }
                    otherCharacteristics.innerHTML = "Здоровье: " + huntingAtAttrs.health + "\n";
                }
            }
            else alert("Нет цели для атаки");
        }

        function takeDamage() {
            if (huntingAtAttrs.attack > 0) {
                alert(huntingAtAttrs.name + " атакует в ответ!");
                setCharacteristics("health", playerCharacteristics.health - huntingAtAttrs.attack);
                console.log(playerCharacteristics.health);
            }
        }

        // https://stackoverflow.com/a/55671924
        function weightBasedChoice(list, weightName) {
            let i;
            let weights = [+list[0][weightName]]; // чтобы было число, а не строка
            let preyNum = Object.keys(list).length;
        
            for (i = 1; i < preyNum; i++)
                weights[i] = (+list[i][weightName] + weights[i - 1]);
            
            let random = Math.random() * weights[weights.length - 1];
            
            for (i = 0; i < weights.length; i++)
                if (weights[i] > random) break;
            
            // иначе возвращает только ссылку на list[i], и такие штуки, как delete, удаляют и из него
            return structuredClone(list[i]);
        }

        //////////////////////////////////////////////////////////// PARALLAX
        if (!calledParallax) {
            calledParallax - true;
            let bg = document.querySelector('.gametable');
            window.addEventListener('mousemove', function(e) {
                let x = e.clientX / window.innerWidth;
                let y = e.clientY / window.innerHeight;

                let targetX = (x * 415) - 415;
                let targetY = (y * 30) - 30;

                let curPos = bg.style.backgroundPosition.split("px");
                let oldX = curPos[0];
                let oldY = curPos[1];
                // console.log(oldX + " " + oldY);
                
                bg.style.backgroundPosition = targetX + 'px ' + targetY + 'px';
            });
        }


        
    })
}