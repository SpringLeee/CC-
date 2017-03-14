$(function () {

   
    
   
    
    
    var basicbutton = true;
    var callbutton = true;

    $("#basic-button").click(function () {
       

        
        if (basicbutton == true) 
        {
           
            $("#basic-edit").css("z-index", "999");
            basicbutton = false;

            $("#basic-button").html("保存");
            $("#basic-button").removeClass("btn-primary"); 
            $("#basic-button").addClass("btn-success");
        }
        else
        {

            //进行用户信息的记录
            var nickname = $("#input-nickname").val();
            var name = $("#input-name").val();
            var sex = $("#option1").hasClass("active");
            var gay1 = $("#gay1").hasClass("active");
            var gay2 = $("#gay2").hasClass("active");
            var gay = "";
            var love = $("#input-love").val();
            var birthday = $("#birthday").val();
            var blood = $("#xuexing").val();
            var blog = $("#input-blog").val();
            var myself = $("#input-myself").val();

            if (nickname.length == 0 || nickname.length >= 12) {

                $("#input-nickname").parent().next().find("div").css("display", "block");
                $("#input-nickname").parent().next().find("div").html("您的昵称不合法！");
                return;
            }
            else {
                $("#input-nickname").parent().next().find("div").css("display", "none");
              
            }
            if (name.length < 2 || name.length > 4||name=="暂无") {
                $("#input-name").parent().next().find("div").css("display", "block");
                $("#input-name").parent().next().find("div").html("这名字哪里怎么不对劲！");
                return;
            }
            else {
                $("#input-name").parent().next().find("div").css("display", "none");
            }
            if (sex == true) {
                
                sex = 1;
            }
            else {
                
                sex = 2;
            }

            if (gay1==true&&gay2==true) {
                gay = "双";
            }
            if (gay1==false&&gay2==false) {
                gay = "自闭";
            }
            if (gay1==false&&gay2==true) {
                gay = "女";
            }
            if (gay1==true&&gay2==false) {
                gay = "男";
            }
            var now = new Date();
            var date = new Date(birthday);
            if (date >= now) {
                $("#birthday").parent().next().find("div").css("display", "block");
                $("#birthday").parent().next().find("div").html("您这生日有点怪啊！");
                return;

            }
           
           
            $.ajax({
                url: "/ajax/info.ashx?action=updatebasic",
                type: "post",
                data: {
                    nickname: nickname,
                    name: name,
                    sex: sex,
                    gay: gay,
                    love: love,
                    birthday: birthday,
                    blood: blood,
                    blog: blog,
                    myself: myself,
                    id:$("#id").val()
                },
                success: function (data) {
                    if (data != "ok") {
                        return;
                    } else {
                        location.href = "info.aspx";
                    }
                }



            });
           

            $("#basic-edit").css("z-index", "9");
            basicbutton = true;

            $("#basic-button").html("编辑");
            $("#basic-button").removeClass("btn-success");
            $("#basic-button").addClass("btn-primary");

            

    
        }
           
        });

    $("#call-button").click(function () {



        if (callbutton == true) {

            $("#call-edit").css("z-index", "999");
            callbutton = false;

            $("#call-button").html("保存");
            $("#call-button").removeClass("btn-primary");
            $("#call-button").addClass("btn-success");
        }
        else {

            var email = $("#input-email").val();
            var qq = $("#input-qq").val();
            var msn = $("#input-msn").val();

            $.ajax({
                url: "/ajax/info.ashx?action=updatecall",
                type: "post",
                data: {
                    email: email,
                    qq: qq,
                    msn:msn,
                    id: $("#id").val()
                },
                success: function (data) {
                    if (data != "ok") {
                        return;
                    } else {
                        location.href = "info.aspx";
                    }
                }



            });
            

        }














    });
   

  

 

    //音乐播放--------------------------

     var musiclist = 1;
    $(".play").click(function () {

        var audio = $(".mp3")[0];

        if (audio.paused)
          {
            audio.play();
            $(".play").removeClass("glyphicon-play-circle");
            $(".play").addClass("glyphicon-off");
            $(".play").attr("title", "暂停");
          }
        else
          {
            audio.pause();
            $(".play").removeClass("glyphicon-off");
            $(".play").addClass("glyphicon-play-circle");
           
            $(".play").attr("title", "播放");
          }
       


    });


    $(".pre").click(function () {
        musiclist--;
        
        if (musiclist==0) {
            musiclist = 7;
        }
        
        var source = "music/m" + musiclist + ".mp3";
        $(".mp3").attr("src", source);
        $(".mp3")[0].play();
        $(".play").removeClass("glyphicon-play-circle");
        $(".play").addClass("glyphicon-off");
    });

    $(".next").click(function () {
        musiclist++;
        
        if (musiclist == 8) {
            musiclist = 1;
        }
       
        var source = "music/m" + musiclist + ".mp3";
        $(".mp3").attr("src", source);
        $(".mp3")[0].play();
        $(".play").removeClass("glyphicon-play-circle");
        $(".play").addClass("glyphicon-off");


    });

    //------------------------------------
    

    $("#userface").click(function () {
        $("#modal-face").modal("show");
    });


  




});