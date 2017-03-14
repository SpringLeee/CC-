$(function () {





    ////滚动条滚动，body-left向上移动
    $(window).scroll(function () {
       

        

        if ($(window).scrollTop() >= 1420)
        {
            $(".friend").css("position", "fixed");
            $(".friend").stop(true, false).animate({ "top": 52 }, 800);
            $(".friend").css("width", "300px")
          

        }
        else
        {
            $(".friend").css("position", "static");
            
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
    
    var uid = $("#uid").val();
    var pid = $("#id").val();
    $.ajax({
        url: "/ajax/everybody.ashx?action=checkguanzhu",
        type: "post",
        data: {
            uid: uid,
            pid: pid,

        },
        success: function (data) {
            if (data == "ok") {
                $("#guanzhu-button").html('<span style="color:#ffffff;font-size:12px" class="glyphicon  glyphicon-ok "></span>  取消关注');

            }
            else {
                $("#guanzhu-button").html('<span style="color:#ffffff;font-size:12px" class="glyphicon  glyphicon-plus "></span>  关注');
            }

        }

    });


    $("#fa").click(function () {
        var id = $("#id").val();
        location.href = "chat.aspx?personid="+id;
    });


    $("#guanzhu-button").click(function () {
       
        var is = $(this).find("span").hasClass("glyphicon-ok");
       
        if (is == true) {
            $.ajax({
                url: "/ajax/everybody.ashx?action=canelguanzhu",
                type: "post",
                data: {
                    uid: uid,
                    pid: pid,

                },
                success: function (data) {
                    if (data == "ok") {
                       
                        $("#guanzhu-button").html('<span style="color:#ffffff;font-size:12px" class="glyphicon  glyphicon-plus "></span>关注');
                      
                    }
                }

            });
        }
        else {
            $.ajax({
                url: "/ajax/everybody.ashx?action=guanzhu",
                type: "post",
                data: {
                    uid: uid,
                    pid: pid,

                },
                success: function (data) {
                    if (data == "ok") {
                        
                        $("#guanzhu-button").html('<span style="color:#ffffff;font-size:12px" class="glyphicon  glyphicon-ok "></span>取消关注');
                       
                    }
                }

            });

        }

       
        

    });

});