$(function () {




    $("#nickname").keyup(function () {
        $("#nickname-warring > span").css("display", "none");
        $("#nickname-warring > label").css("display", "none");
    });
    $("#nickname").focus(function () {
        $("#nickname-warring > span").css("display", "none");
        $("#nickname-warring > label").css("display", "none");
    });

    $("#nickname").blur(function () {

        var count = $(this).val().length;
        if (count < 4 || count > 10)
        {
            $("#nickname-warring > span").css("color", "red");
            $("#nickname-warring > span").css("display", "inline-block");
            $("#nickname-warring > label").css("display", "inline-block");
            $("#nickname-warring > label").html("昵称不合法！");

            $("#nickname-info > label").html("未完成");
            $("#nickname-info > span").removeClass("glyphicon-ok-sign");
            $("#nickname-info > span").addClass("glyphicon-info-sign");
            $("#nickname-info > span").css("color", "#ff6a00");

        }
        else
        {
            $.ajax({
                url: "/Ajax/person.ashx?type=checknickname",
                type: "post",
                data: {
                    nickname: $("#nickname").val()

                },

                success: function (data, response, status) {
                    
                    if (data == "yes") {
                        $("#nickname-warring > span").css("color", "red");
                        $("#nickname-warring > span").css("display", "inline-block");
                        $("#nickname-warring > label").css("display", "inline-block");
                        $("#nickname-warring > label").html("昵称已存在！");

                        $("#nickname-info > label").html("未完成");
                        $("#nickname-info > span").removeClass("glyphicon-ok-sign");
                        $("#nickname-info > span").addClass("glyphicon-info-sign");
                        $("#nickname-info > span").css("color", "#ff6a00");
                    }
                    else {
                        $("#nickname-warring > span").css("display", "none");
                        $("#nickname-warring > label").css("display", "none");

                        $("#nickname-info > span").css("color", "green");
                        $("#nickname-info > span").removeClass("glyphicon-info-sign");
                        $("#nickname-info > span").addClass("glyphicon-ok-sign");
                        $("#nickname-info > label").html("完成！");

                    }


                }



            });


           
            
           
        }



    });

    $("#birthday").blur(function () {

        var date = new Date($("#birthday").val());
        var now = new Date();
        if (date < now) {

            $("#date-warring > span").css("display", "none");
            $("#date-warring > label").css("display", "none");

            $("#date-info > span").css("color", "green");
            $("#date-info > span").removeClass("glyphicon-info-sign");
            $("#date-info > span").addClass("glyphicon-ok-sign");
            $("#date-info > label").html("完成！");


            

        }
        else {
            
            $("#date-warring > span").css("color", "red");
            $("#date-warring > span").css("display", "inline-block");
            $("#date-warring > label").css("display", "inline-block");
            $("#date-warring > label").html("日期不合法！");

            $("#date-info > label").html("未完成");
            $("#date-info > span").removeClass("glyphicon-ok-sign");
            $("#date-info > span").addClass("glyphicon-info-sign");
            $("#date-info > span").css("color", "#ff6a00");

        }



    });

    $("#city").blur(function () {


        var province = $("#province").val();
        var city = $("#city").val();
        if (city == "请选择城市名"||city=="") {
            $("#city-warring > span").css("color", "red");
            $("#city-warring > span").css("display", "inline-block");
            $("#city-warring > label").css("display", "inline-block");
            $("#city-warring > label").html("请正确的选择地址！");

            $("#city-info > label").html("未完成");
            $("#city-info > span").removeClass("glyphicon-ok-sign");
            $("#city-info > span").addClass("glyphicon-info-sign");
            $("#city-info > span").css("color", "#ff6a00");
        }
        else {

            $("#city-warring > span").css("display", "none");
            $("#city-warring > label").css("display", "none");

            $("#city-info > span").css("color", "green");
            $("#city-info > span").removeClass("glyphicon-info-sign");
            $("#city-info > span").addClass("glyphicon-ok-sign");
            $("#city-info > label").html("完成！");


        }




    });


    $("#submit").click(function () {
        
        var a = $("#nickname-info > span").hasClass("glyphicon-ok-sign");
        var b = $("#date-info > span").hasClass("glyphicon-ok-sign");       
        var c = $("#city-info > span").hasClass("glyphicon-ok-sign");
       
        

        if (a == true && b == true & c == true) {
            
            $.ajax({
                url: "/Ajax/person.ashx?type=update",
                type: "post",
                data: {
                    id: $("#id").val(),
                    nickname: $("#nickname").val(),
                    birthday:$("#birthday").val(),
                    sex: $("input[type='radio']:checked").val(),
                    address:$("#province").val()+"-"+$("#city").val()

                },
                beforeSend:function () {
                  
                },
                success: function (data, response, status) {

                    if (data == "error") {
                        location.href = "register.aspx";
                    }
                    else {
                        location.href = "like.aspx?id=" + data;
                    }
                   

                }


            });



        }
        





    });

  

   

});