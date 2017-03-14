$(function () {

    //Jquery UI 邮箱自动补全
    $("#email").autocomplete({
        autoFocus: true,
        delay: 0,
        source: function (request, response) {
            var hosts = ['qq.com', '163.com', '139.com', '263.com', 'gmail.com', 'hotmail.com'], //起始
            term = request.term, //获取输入值
            ix = term.indexOf('@'), //@
            name = term, //用户名
            host = '', //域名
            result = []; //结果
            //结果第一条是自己输入
            result.push(term);
            if (ix > -1) { //如果有@的时候
                name = term.slice(0, ix); //得到用户名
                host = term.slice(ix + 1); //得到域名
            }
            if (name) {
                //得到找到的域名
                var findedHosts = (host ? $.grep(hosts, function (value, index) {
                    return value.indexOf(host) > -1;
                }) : hosts),
                //最终列表的邮箱
                findedResults = $.map(findedHosts, function (value, index) {
                    return name + '@' + value;
                });
                //增加一个自我输入
                result = result.concat(findedResults);
            }
            response(result);
        },
    });



   



    $("#email").blur(function () {

        var pattern = /^([a-zA-Z0-9_\.\-]+)@([a-zA-Z0-9_\.\-]+)\.([a-zA-Z]{2,4})$/;
        var cc = $('#email').val();
        var emailtest = pattern.test(cc);

        if (emailtest == true) {

            $.ajax({
                url: "/Ajax/findpass.ashx?action=checkemail",
                type: "post",
                data: {
                    email: $("#email").val()

                },

                success: function (data, response, status) {
                    if (data == "yes") {

                        $("#email-message > i").removeClass("glyphicon-info-sign");
                        $("#email-message > i").addClass("glyphicon-ok");
                        $("#email-message > i").css("color", "green");
                        $("#email-message > i").css("font-size", "20px");
                        $("#email-message > label").css("display", "none");
                        $("#email-message > i").css("display", "inline-block");
                    }
                    else {

                        $("#email-message > i").removeClass("glyphicon-ok");
                        $("#email-message > i").addClass("glyphicon-info-sign");
                        $("#email-message > i").css("color", "red");
                       
                       
                        $("#email-message > label").css("display", "inline-block");
                        $("#email-message > label").html("嗯？邮箱未找到！");
                    }

                }
            });


        }
        else {
            $("#email-message > i").removeClass("glyphicon-ok");
            $("#email-message > i").addClass("glyphicon-info-sign");
            $("#email-message > i").css("color", "red");
            $("#email-message > i").css("font-size", "12px");
            $("#email-message > i").css("display", "inline-block");
            $("#email-message > label").css("display", "inline-block");
            $("#email-message > label").html("邮箱格式错误，请重试！");
        }

    });

    $("#send").click(function () {
        if ($("#email-message > i").hasClass("glyphicon-ok")) {
            $("#send").attr("disabled", "disabled");
            $("#send").removeClass("btn-info");
            $("#send").addClass("btn-danger");


            var timeid = setInterval(time, 1000);
            var t = 60;
            function time() {
                t--;
                $("#send").html("亲," + t + "秒后重试");
                if (t == 0) {
                    clearInterval(timeid);

                    $("#send").removeAttr("disabled");
                    $("#send").removeClass("btn-danger");
                    $("#send").addClass("btn-info");
                    $("#send").html("获取邮箱验证码");
                }
            }
           

            $.ajax({
                url: "/Ajax/findpass.ashx?action=sendcode",
                type: "post",
                data: {
                    email: $("#email").val()

                },
                success: function (data) {
                    if (data=="yes") {

                       

                    }


                }

            });

        }



    });

   

    $("#emailcode").blur(function () {
        if ($("#email-message > i").hasClass("glyphicon-ok")) {

         
                $.ajax({
                    url: "/Ajax/findpass.ashx?action=checkcode",
                    type: "post",
                    data: {
                        code: $(this).val()
                    },
                    success: function (data) {
                        if (data == "yes") {
                           
                            $("#emailcode-message > i").removeClass("glyphicon-info-sign");
                            $("#emailcode-message > i").addClass("glyphicon-ok");
                            $("#emailcode-message > i").css("color", "green");
                            $("#emailcode-message > i").css("font-size", "20px");
                            $("#emailcode-message > label").css("display", "none");
                        }
                        else {
                            $("#emailcode-message > i").removeClass("glyphicon-ok");
                            $("#emailcode-message > i").addClass("glyphicon-info-sign");
                            $("#emailcode-message > i").css("color", "red");
                            $("#emailcode-message > i").css("font-size", "12px");
                            $("#emailcode-message > i").css("display", "inline-block");
                            $("#emailcode-message > label").css("display", "inline-block");
                            $("#emailcode-message > label").html("邮箱验证码不正确！");
                        }
                    }



                });
            


        }



    });

    $("#pwd1").keyup(function () {
       
        if ($("#email-message > i").hasClass("glyphicon-ok") && $("#emailcode-message > i").hasClass("glyphicon-ok")) {
            
            var pwd1 = $(this).val().length;
            if (6 <= pwd1&&pwd1<=10) {
                
                $("#pwd1-message > i").removeClass("glyphicon-info-sign");
                $("#pwd1-message > i").addClass("glyphicon-ok");
                $("#pwd1-message > i").css("color", "green");
                $("#pwd1-message > i").css("font-size", "20px");
                $("#pwd1-message > label").css("display", "none");
            }
            else {
                $("#pwd1-message > i").removeClass("glyphicon-ok");
                $("#pwd1-message > i").addClass("glyphicon-info-sign");
                $("#pwd1-message > i").css("color", "cornflowerblue");
                $("#pwd1-message > i").css("font-size", "12px");
                $("#pwd1-message > label").css("display", "inline-block");
                $("#pwd1-message > label").html("6-10位，不带标点符号");
            }


        }


    });

    $("#pwd1").blur(function () {

        var pwd1 = $(this).val().length;
        if (6 <= pwd1 && pwd1 <= 10) {

            $("#pwd1-message > i").removeClass("glyphicon-info-sign");
            $("#pwd1-message > i").addClass("glyphicon-ok");
            $("#pwd1-message > i").css("color", "green");
            $("#pwd1-message > i").css("font-size", "20px");
            $("#pwd1-message > label").css("display", "none");
        }
        else {
            $("#pwd1-message > i").removeClass("glyphicon-ok");
            $("#pwd1-message > i").addClass("glyphicon-info-sign");
            $("#pwd1-message > i").css("color", "red");
            $("#pwd1-message > i").css("font-size", "12px");
            $("#pwd1-message > label").css("display", "inline-block");
            $("#pwd1-message > label").html("密码格式不合法！");
        }
      


    });

    $("#pwd2").keyup(function () {
        var pwd1 = $("#pwd1").val();
        var pwd2 = $("#pwd2").val();
        
        if (pwd1 == pwd2) {
           
            $("#pwd2-message > i").removeClass("glyphicon-info-sign");
            $("#pwd2-message > i").addClass("glyphicon-ok");
            $("#pwd2-message > i").css("color", "green");
            $("#pwd2-message > i").css("font-size", "20px");
            $("#pwd2-message > label").css("display", "none");
        }
        else {
            $("#pwd2-message > i").removeClass("glyphicon-ok");
            $("#pwd2-message > i").addClass("glyphicon-info-sign");
            $("#pwd2-message > i").css("color", "red");
            $("#pwd2-message > i").css("font-size", "12px");
            $("#pwd2-message > label").css("display", "inline-block");
            $("#pwd2-message > label").html("两次输入的密码不一致");
        }

    });
    $("#pwd2").blur(function () {
        var pwd1 = $("#pwd1").val();
        var pwd2 = $("#pwd2").val();
        if (pwd1 == pwd2) {
            $("#pwd2-message > i").removeClass("glyphicon-info-sign");
            $("#pwd2-message > i").addClass("glyphicon-ok");
            $("#pwd2-message > i").css("color", "green");
            $("#pwd2-message > i").css("font-size", "20px");
            $("#pwd2-message > label").css("display", "none");
        }
        else {
            $("#pwd2-message > i").removeClass("glyphicon-ok");
            $("#pwd2-message > i").addClass("glyphicon-info-sign");
            $("#pwd2-message > i").css("color", "red");
            $("#pwd2-message > i").css("font-size", "12px");
            $("#pwd2-message > label").css("display", "inline-block");
            $("#pwd2-message > label").html("两次输入的密码不一致");
        }

    });

    $("#submit").click(function () {
        if ($("#email-message > i").hasClass("glyphicon-ok") && $("#emailcode-message > i").hasClass("glyphicon-ok") && $("#pwd1-message > i").hasClass("glyphicon-ok") && $("#pwd2-message > i").hasClass("glyphicon-ok")) {
            var email = $("#email").val();
            var pwd = $("#pwd1").val();
            $.ajax({
                url: "/Ajax/findpass.ashx?action=submit",
                type: "post",
                data: {
                    email: $("#email").val(),
                    pwd:$("#pwd1").val()

                },

                success: function (data) {
                    if (data == "ok") {
                        $('#myModal').modal('show');
                    }
                    else {
                        alert("no");

                    }

                }




            });


        }



    });

 

});