//--------------------------------------------
//      Name    Js公用库  
//      Author  Spring Lee
//      Date    2015-11-9
//--------------------------------------------



//控制页面上下滚动，直接调用方法即可.
    function UpDown() {

        var upid;
        var downid;
        var div_up = $('<div id="up">UP</div>');
        var div_down = $('<div id="down">Down</div>');

        $("body").append(div_up);
        $("body").append(div_down);

        $("#up").css({
            "position": "fixed",
            "height": "40px",
            "width": "40px",
            "top": "80%",
            "right": "3%",
            "background-color": "green",
            "font-size": "24px",
            "color": "#FFFFFF",
            "line-height": "40px",
            "text-align": "center",
            "font-weight": "bold",
            "border": "2px solid white",
            "cursor": "pointer",
            "z-index": "99"

        });
        $("#down").css({
            "position": "fixed",
            "height": "40px",
            "width": "40px",
            "top": "86%",
            "right": "3%",
            "background-color": "green",
            "font-size": "18px",
            "color": "#FFFFFF",
            "line-height": "40px",
            "text-align": "center",
            "font-weight": "bold",
            "border": "2px solid white",
            "cursor": "pointer",
            "z-index": "99"

        });

        function up() {

            if ($(window).scrollTop() <= 50) {
                clearInterval(upid);

            }

            $(window).scrollTop($(window).scrollTop() - 45);


        }
        function down() {
            if ($(window).scrollTop() + 675 >= document.body.scrollHeight) {


                clearInterval(downid);

            }

            $(window).scrollTop($(window).scrollTop() + 45);


        }

        $("#up").click(function () {

            clearInterval(upid);
            clearInterval(downid);
            upid = setInterval(up, 1);

        });
        $("#down").click(function () {

            clearInterval(upid);
            clearInterval(downid);
            downid = setInterval(down, 1);

        });

    }


//顶部伸展白线 直接调用
    function TopLine() {

        var sid = setInterval(s, 20);
        var ssid = setInterval(ss, 20);

        var topleft = $('<div id="lineleft"></div>');
        var topright = $('<div id="lineright"></div>');

        $("body").append(topleft);
        $("body").append(topright);
       
        $("#line").css({

        "position": "fixed",
        "top": "0px",
        "background-color": "#FFFFFF",
        "height": "3px",
        "width":"1px",
        "left": "623px",
        "z-index": "99"


        });
        $("#line1").css({
        "position": "fixed",
        "top": "0px",
        "background-color": "#FFFFFF",
        "height": "3px",
        "width":"1px",
        "right": "623px",
        "z-index": "99"

        });

        function s() {

            var data = $("#lineleft").width();
            $("#lineleft").width(data + 5);

            if (data >= 630) {
                clearInterval(sid);
            }


        }
        function ss() {

            var data = $("#lineright").width();
            $("#lineright").width(data + 5);

            if (data >= 633) {

                clearInterval(ssid);
            }
        }

      




    }























