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





    $("#name-login").click(function () {
        var checked= $("#name-checked:checked").val();
        var name = $("#name").val();
        var pwd = $("#name-pwd").val();

        if (name==""||pwd=="")
        {
            $("#name-alert").removeClass("alert-info");
            $("#name-alert").addClass("alert-danger");
            $("#name-span").html(" PS： 咱能不能认真一点！");
        }
        else
        {
            $.ajax({
                url: "/Ajax/login.ashx?action=namelogin",
                type: "post",
                data: {
                    nickname: $("#name").val(),
                    pwd: $("#name-pwd").val(),
                    checked:checked
                },
                beforeSend:function () {
                  
                },
                success: function (data, response, status) {
                    if (data == "ok") {
                        location.href = "index.aspx";
                    }
                    else {
                        $("#name-alert").removeClass("alert-info");
                        $("#name-alert").addClass("alert-danger");
                        $("#name-span").html(" PS： 用户名或密码错误！");
                    }
                }





            });

        }




    });

    $("#name").focus(function () {
        $("#name-alert").removeClass("alert-danger");
        $("#name-alert").addClass("alert-info");
        $("#name-span").html("PS： 密码区分大小写");

    });

    $("#name-pwd").focus(function () {
        $("#name-alert").removeClass("alert-danger");
        $("#name-alert").addClass("alert-info");
        $("#name-span").html("PS： 密码区分大小写");
    });

    $("#email-login").click(function () {


        var checked = $("#email-checked:checked").val();
        var email = $("#email").val();
        var emailcode = $("#email-code").val();
        if (email==""||emailcode=="") {

            $("#email-alert").removeClass("alert-info");
            $("#email-alert").addClass("alert-danger");
            $("#email-span").html(" PS： 咱能不能认真一点！");
            return;
        }

        var pattern = /^([a-zA-Z0-9_\.\-]+)@([a-zA-Z0-9_\.\-]+)\.([a-zA-Z]{2,4})$/;
        var cc = $("#email").val();
        var emailtest = pattern.test(cc);
        if (emailtest==false) {
            $("#email-alert").removeClass("alert-info");
            $("#email-alert").addClass("alert-danger");
            $("#email-span").html(" PS： 你他丫的这是在逗我！");
            return;
        }

        $.ajax({
            url: "/Ajax/login.ashx?action=login",
            type: "post",
            data: {
                email: $("#email").val(),
                emailcode: $("#email-code").val(),
                checked:checked

            },
            success: function (data) {
                if (data == "errorcode") {

                    $("#email-alert").removeClass("alert-info");
                    $("#email-alert").addClass("alert-danger");
                    $("#email-span").html(" PS： 嗯哼,验证码哪里不对！");
                    return;
                }
                if (data=="nouser") {
                    $("#email-alert").removeClass("alert-info");
                    $("#email-alert").addClass("alert-danger");
                    $("#email-span").html(" PS： 嗯哼，邮箱怎么登陆不上！");
                    return;
                }
                if (data=="ok") {
                    
                    location.href = "index.aspx";
                }


            }

          });



    });

    $("#email").focus(function () {

        $("#email-alert").removeClass("alert-danger");
        $("#email-alert").addClass("alert-info");
        $("#email-span").html("PS： 扫描二维码可快速登陆");
    });

    $("#email-code").focus(function () {

        $("#email-alert").removeClass("alert-danger");
        $("#email-alert").addClass("alert-info");
        $("#email-span").html("PS： 扫描二维码可快速登陆");
    });
    var mark = 0;
    $("#send").click(function () {
        


        var pattern = /^([a-zA-Z0-9_\.\-]+)@([a-zA-Z0-9_\.\-]+)\.([a-zA-Z]{2,4})$/;
        var cc = $("#email").val();
        var emailtest = pattern.test(cc);
        if (cc=="") {
            $("#email-alert").removeClass("alert-info");
            $("#email-alert").addClass("alert-danger");
            $("#email-span").html(" PS： 你他丫的这是在逗我！");
            return;
        }


        if (emailtest==true) {

           

            $.ajax({
                url: "/Ajax/login.ashx?action=sendcode",
                type: "post",
                data: {
                    email: $("#email").val()

                },
                success: function (data) {
                    if (data == "yes") {


                        $("#send").attr("disabled", "disabled");
                        $("#send").removeClass("btn-info");
                        $("#send").addClass("btn-danger");

                        mark++;
                        if (mark >= 3) {
                            var timeid = setInterval(time, 1000);
                            var t = 999;
                            function time() {

                                t--;
                                $("#send").html("请" + t + "秒后重试");
                                if (t == 0) {
                                    clearInterval(timeid);

                                    $("#send").removeAttr("disabled");
                                    $("#send").removeClass("btn-danger");
                                    $("#send").addClass("btn-info");
                                    $("#send").html("获取邮箱验证码");
                                }
                            }
                        }
                        else {
                            var timeid = setInterval(time, 1000);
                            var t = 60;
                            function time() {

                                t--;
                                $("#send").html("请" + t + "秒后重试");
                                if (t == 0) {
                                    clearInterval(timeid);

                                    $("#send").removeAttr("disabled");
                                    $("#send").removeClass("btn-danger");
                                    $("#send").addClass("btn-info");
                                    $("#send").html("获取邮箱验证码");
                                }
                            }
                        }


                        
                    }
                    else {

                        $("#email-alert").removeClass("alert-info");
                        $("#email-alert").addClass("alert-danger");
                        $("#email-span").html(" PS： 未知原因，邮件未发送！");
                    }
                }
            });




        }



    });



});