$(function () {


   

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
    var pid = $("#pid").val();
    $.ajax({
        url: "/ajax/everybody.ashx?action=checkguanzhu",
        type: "post",
        data: {
            uid: uid,
            pid: pid,

        },
        success: function (data) {
            if (data == "ok") {
              $("#guanzhu").html('<span class="glyphicon glyphicon-ok"></span> 取消关注');

            }
            else {
                $("#guanzhu").html(' <span class="glyphicon glyphicon-plus"></span> 关注');
            }

        }

    });


    $("#guanzhu").click(function () {

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

                        $("#guanzhu").html(' <span class="glyphicon glyphicon-plus"></span> 关注');

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

                        $("#guanzhu").html('<span class="glyphicon glyphicon-ok"></span> 取消关注');

                    }
                }

            });

        }




    });

    $("#l-face").click(function () {

        $("#x-face").css("display", "block");
        $("#x-face").window({
            width: 354,

            title: "----- 表情选择--------------------------------------------------------",
            modal: false,
            border: false,
            draggable: false,
            resizable: false,
            collapsible: false,
            minimizable: false,
            maximizable: false



        });
        $("#x-face").window('move', {
            left: 400,
            top: 360,
        });

    });

    $("#x-face > ul").find("li").find("img").click(function () {
        var mark = $(this).attr("src");
        var title = $(this).attr("title");
        var text = $("#weibo-content").val();
        var index = $(this).parent().index() + 1;
        $("#weibo-content").val(text + title);


    });

    $("#send").click(function () {
        var text = $("#weibo-content").val();
        if (text.length==0) {
            return;
        }
        var id = $("#uid").val();
        var weiboid = $(this).attr("itemid");
        var text = $("#weibo-content").val();
        $("#weibo-content").val("");
        $.ajax({
            type: "post",
            url: "/ajax/remark.ashx?action=send",
            data: {
                id: id,
                weiboid: weiboid,
                text:text

            },
            success: function (e) {
                if(e!="")
                {
                    var facetext = e.split("&")[0];
                    var time = e.split("&")[1];
                    var uface = $("#uface").val();
                    var unickname = $("#unickname").val();
                   
                    
                    var $li = $('<li><a href="#"> <img class="face" src="' + uface + '" /></a><p><a href="#">' + unickname + '</a>：' + facetext + '</p><time style="display:inline-block;color:#808080; margin-left:60px;">'+time+'</time> </li>');
                    $li.css("display", "none");
                    $("#remark-list").prepend($li);
                    $li.slideDown(500);
                }
            }





        });


    });

   

});