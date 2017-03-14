$(function () {

    var timer;
    var my = $("#uid").val();
    var you = $("#pid").val();
    var uface = $("#uface").val();
    timer=  setInterval(get, 3000);
    
    function get() {
       
        $.ajax({
            url: "/ajax/chat.ashx?action=get",
            type: "post",
            data: {
                my: my,
                you:you
            },
            success: function (data) {
                var $you = $(' <li><img class="face" src="'+uface+'" /><p>' + data + '</p></li>');

                $you.css("display", "none");
                $("#chatcontent").append($you);
                $(".qq")[0].play();
                $you.fadeIn(1000, function () {
                    $(".content").scrollTop(99999);
                });


            }
        });
    }
   


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
    
    //表情选择
    $("#biaoqing").click(function () {

        
        if ( $("#x-face").css("display")=="block") {
            $('#x-face').window('close');
            $("#x-face").css("display","none");
            return;
        }

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
            maximizable: false,
            onClose: function () {
                $("#x-face").css("display", "none");
            },
            


        });
        $("#x-face").window('move', {
            left: 525,
            top: 480,
        });

    });

    //添加表情
    $("#x-face > ul").find("li").find("img").click(function () {
        
        var mark = $(this).attr("src");
        var title = $(this).attr("title");
        var text = $("#content").val();
        var index = $(this).parent().index() + 1;
        $("#content").val(text + title);

 });

    //发送信息
    $("#send").click(function () {
       

        var text = $("#content").val();
        var pface = $("#pface").val();
        var uid = $("#uid").val();
        var pid = $("#pid").val();
       
        if (text.length == 0) {
           
            return;
        }

        clearInterval(timer);

        $.ajax({
            type: "post",
            url: "/ajax/chat.ashx?action=send",
            data: {
                text: text,
                uid: uid,
                pid:pid
            },

            success: function (data) {

             
                var $my = $('<li><img style="float:right" class="face" src="'+uface+'" /> <p style="float:right">' + data + '</p></li>');
                

                $my.css("display", "none");
                $("#chatcontent").append($my);
                $my.show(1000, function () {
                    $(".content").scrollTop(99999);
                });
                $("#content").val("");

                timer = setInterval(get,3000);
            }


        });
       
       
       
      
       

    });


    $(document).keypress(function (e) {
        if (e.keyCode==13) {
            var text = $("#content").val();
            var pface = $("#pface").val();
            var uid = $("#uid").val();
            var pid = $("#pid").val();

            if (text.length == 0) {

                return;
            }

            clearInterval(timer);

            $.ajax({
                type: "post",
                url: "/ajax/chat.ashx?action=send",
                data: {
                    text: text,
                    uid: uid,
                    pid: pid
                },

                success: function (data) {


                    var $my = $('<li><img style="float:right" class="face" src="' + uface + '" /> <p style="float:right">' + data + '</p></li>');


                    $my.css("display", "none");
                    $("#chatcontent").append($my);
                    $my.show(1000, function () {
                        $(".content").scrollTop(99999);
                    });
                    $("#content").val("");

                    timer = setInterval(get, 3000);
                }


            });


        }
    });


});