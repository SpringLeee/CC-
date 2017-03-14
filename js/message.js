$(function () {



    //});

 

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
    
    $(".chat").click(function () {
        var userid = $(this).attr("itemid");
        location.href = "chat.aspx?personid="+userid;
    });
    $("#read").click(function () {
        $("#read-modal").modal("show");
    });

    $("#read-ok").click(function () {

        var id = $("#id").val();
        $.ajax({
            type: "post",
            url: "/ajax/message.ashx?action=allread",
            data: {
                id:id
            },
            success: function (e) {
                if(e=="ok")
                {
                    $("#allreadp").html('<span style="color:green;font-size:24px"  class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;&nbsp;操作成功！');
                    setTimeout(function () {
                       
                        $("#read-modal").modal("hide");
                        $("#allreadp").html('<span  class="glyphicon glyphicon-subtitles"></span> 确定要把消息都设置成已读吗？');
                    },1000);
                   
                }
            }






        });

    });
    $("#del").click(function () {
        $("#del-modal").modal("show");
    });
    $("#del-ok").click(function () {

        var id = $("#id").val();
        $.ajax({
            type: "post",
            url: "/ajax/message.ashx?action=alldel",
            data: {
                id: id
            },
            success: function (e) {
                if (e == "ok") {
                    $("#alldelp").html('<span style="color:green;font-size:24px"  class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;&nbsp;操作成功！');
                    setTimeout(function () {

                        $("#del-modal").modal("hide");
                        $("#allreadp").html('<span  class="glyphicon glyphicon-subtitles"></span> 确定要把删除所有信息吗？');
                    }, 1000);

                }
            }






        });

    });


});