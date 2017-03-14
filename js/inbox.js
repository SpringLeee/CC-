$(function () {


    ////动态生成页面高度
    //var bodyheight = $(document).height() - 352;
    //$("#body").css("height", bodyheight + 320);


    ////滚动条滚动，body-left向上移动
    //$(window).scroll(function () {
       

    //    var X = parseInt($(document).height()) - 900;

    //    if ($(window).scrollTop() >= X) {

    //        $(".body-left").stop(true, false).animate({ "top": -152 }, 800);
    //        $(".top-fans").stop(true, false).animate({ "top": -52 }, 800);

    //    }
    //    else
    //    {
    //        $(".body-left").stop(true, false).animate({ "top": 52 }, 800);

          

    //        if ($(window).scrollTop() >= 1880) {
    //            $(".top-fans").css("position", "fixed");
    //            $(".top-fans").stop(true, false).animate({ "top": 52 }, 800);
    //        }
    //        else {
    //            $(".top-fans").css("position", "relative");
    //        }
    //    }
       


       


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
    


});