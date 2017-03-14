$(function () {
   
    //动态生成页面高度
    var bodyheight = $(document).height() - 352;
  
  
    $("#body").css("height", bodyheight+110);
   
    //切换主题
    $.ajax({
        url: "/Ajax/index.ashx?action=settheme",
        type: "post",       
        success: function (data) {
           
            if (data=="no") {
                $("body").css("background-image", 'url("/theme/theme1.jpg")');
                $("body").css("background-color", "#ccc");
            }
            if (data == "s1") {
                $("body").css("background-image", 'url("/theme/theme1.jpg")');
                $("body").css("background-color", "#CAD3D0");
            }
            if (data == "s2") {
                $("body").css("background-image", 'url("/theme/theme2.jpg")');
                $("body").css("background-color", "#EAD4AD");
            }
            if (data == "s3") {
                $("body").css("background-image", 'url("/theme/theme3.jpg")');
                $("body").css("background-color", "#412F23");
            }
            if (data == "s4") {
                $("body").css("background-image", 'url("/theme/theme4.jpg")');
                $("body").css("background-color", "#64574F");
            }
            if (data == "s5") {
                $("body").css("background-image", 'url("/theme/theme5.jpg")');
                $("body").css("background-color", "#BEC621");
            }
            if (data == "s6") {
                $("body").css("background-image", 'url("/theme/theme6.jpg")');
                $("body").css("background-color", "#436BA8");
            }
           
            

        }


    });

    //滚动条滚动，body-left向上移动
    $(window).scroll(function () {
       

        var X = parseInt($(document).height()) - 900;

        if ($(window).scrollTop() >= X) {

            $(".body-left").stop(true, false).animate({ "top": -152 }, 800);
            $(".top-fans").stop(true, false).animate({ "top": -52 }, 800);

        }
        else
        {
            $(".body-left").stop(true, false).animate({ "top": 52 }, 800);

          

            if ($(window).scrollTop() >= 1880) {
                $(".top-fans").css("position", "fixed");
                $(".top-fans").stop(true, false).animate({ "top": 52 }, 800);
            }
            else {
                $(".top-fans").css("position", "relative");
            }
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
    
    $("#l-face").click(function () {
        
        $("#x-face").css("display","block");
        $("#x-face").window({
            width: 354,
        
            title:"----- 表情选择--------------------------------------------------------",
            modal: false,
            border: false,
            draggable: false,
            resizable: false,
            collapsible: false,
            minimizable: false,
            maximizable:false

            
          
        });
        $("#x-face").window('move', {
            left: 284,
            top: 252,
        });

    });

    $("#l-img").click(function () {

        $("#upload-img").css("display", "block");

        $("#upload-img").window({
            width: 354,

            title: "----- 图片选择--------------------------------------------------------",
            modal: false,
            border: false,
            draggable: false,
            resizable: false,
            collapsible: false,
            minimizable: false,
            maximizable: false,
            onClose: function () {
                
                $("#divFileProgressContainer").css("display", "none");
                $("#swfu_container_bar_div").css("display", "none");
                $("#thumbnails > ul").html("");
                
                
                
                
                $.ajax({
                    url: "/Ajax/index.ashx?action=delimg",
                    type: "post",
                    data: {
                        imglist:imglist.toString()
                    },
                    beforeSend:function () {
                       
                    },
                    success: function (data, response, status) {
                        if (data=="ok") {
                            var temp = Array();
                            imglist = temp;
                        }

                    }

                  });

            },
            onOpen: function () {
                $("#divFileProgressContainer").css("display", "none");
                $("#swfu_container_bar_div").css("display", "none");
            },



        });
        $("#upload-img").window('move', {
            left: 284,
            top: 252,
        });

        $("#x-face").window('close', true);
       
       

    });
   
    $("#alert-write").click(function () {

        $("#alert-content").css("display","block");
        $("#alert-content ").dialog({
            title: " CC微博",
            width: 500,
          
            modal: true,
        });


    });
    $("#alert-content > button").click(function () {
       
        var count = $("#alert-content-input").val().length;
        
        if (count > 140) {
            $("#alert-content-alert").css("display", "block");
            $("#alert-content-alert").removeClass("alert-success");
            $("#alert-content-alert").addClass("alert-danger");
            $("#alert-content-alert").html("您的微博也太长了吧！");

        }
        else {




        }


      

    });
    $("#alert-content > textarea").focus(function () {
        $("#alert-content-alert").css("display", "none");
    });

    $("#alert-content > textarea").keyup(function () {
      
        var count = $(this).val().length;

        var words = 140 - count;
       
            $("#alert-content-header").html('还可以输入<span id="alert-content-span" style="color:#ff6a00;font-size:18px;"> ' + words + ' </span> 字');
       
       

    });

    $(document).keypress(function (e) {
        if (e.keyCode == 110) {
            $("#alert-content").css("display", "block");
            $("#alert-content ").dialog({
                title: " CC微博",
                width: 500,

                modal: true,
            });

        }
    });



    $("#logoimg").click(function () {

        $('#theme').modal("show");




    });
    
   
    $("#theme").find("ul").find("li").click(function () {
        if ($(this).find("span").css("display")=="block") {
            $(this).find("span").css("display", "none");
            return;
        }

        $("#theme").find("ul").find("li").find("span").css("display", "none");
        $(this).find("span").css("display","block");
    });


    $("#theme-save").click(function () {
        var s1 = $("#s1").css("display");
        var s2 = $("#s2").css("display");
        var s3 = $("#s3").css("display");
        var s4 = $("#s4").css("display");
        var s5 = $("#s5").css("display");
        var s6 = $("#s6").css("display");
        var theme = "";
        if (s1=="none"&&s2=="none"&&s3=="none"&&s4=="none"&&s5=="none"&&s6=="none") {
            return;
        }
        if (s1=="block") {
            theme = "s1";
        }
        if (s2 == "block") {
            theme = "s2";
        }
        if (s3 == "block") {
            theme = "s3";
        }
        if (s4 == "block") {
            theme = "s4";
        }
        if (s5 == "block") {
            theme = "s5";
        }
        if (s6 == "block") {
            theme = "s6";
        }


        $.ajax({
            url: "/Ajax/index.ashx?action=savetheme",
            type: "post",
            data: {
                theme:theme
            },
            beforeSend: function () {

            },
            success: function (data) {
                if (data == "ok") {

                    
                    if (theme=="s1") {
                        $("body").css("background-image", 'url("/theme/theme1.jpg")');                        
                        $("body").css("background-color", "#CAD3D0");
                    }
                    if (theme == "s2") {
                        $("body").css("background-image", 'url("/theme/theme2.jpg")');
                        $("body").css("background-color", "#EAD4AD");
                    }
                    if (theme == "s3") {
                        $("body").css("background-image", 'url("/theme/theme3.jpg")');
                        $("body").css("background-color", "#412F23");
                    }
                    if (theme == "s4") {
                        $("body").css("background-image", 'url("/theme/theme4.jpg")');
                        $("body").css("background-color", "#64574F");
                    }
                    if (theme == "s5") {
                        $("body").css("background-image", 'url("/theme/theme5.jpg")');
                        $("body").css("background-color", "#BEC621");
                    }
                    if (theme == "s6") {
                        $("body").css("background-image", 'url("/theme/theme6.jpg")');
                        $("body").css("background-color", "#436BA8");
                    }

                    $('#theme').modal("hide");

                }
               
            }


        });
        
       


    });

    $("#x-face > ul").find("li").find("img").click(function () {
        var mark = $(this).attr("src");
        var title = $(this).attr("title");
        var text = $("#weibo-content").val();
        var index = $(this).parent().index() + 1;
        $("#weibo-content").val(text + title);

        
            

        
        



    });


   

    $("#logout").click(function () {
       
        $.ajax({
            url: "/Ajax/index.ashx?action=logout",
            type: "post",
            
            success: function (data) {
                if (data=="ok") {
                    location.href = "login.aspx";
                }

            }

        });



    });

    $("#weibo-content").keyup(function () {
        var content = $(this).val();
        var count = 140 - content.length;
        $("#weibo-number").html(count);

        if ($(this).val().length <= 140 && $(this).val().length != 0) {
            $("#weibo-message-alert").removeClass("alert-danger");
            $("#weibo-message-alert").addClass("alert-success");

            $("#weibo-send").prop("disabled",false);
        }
       else{
            
            $("#weibo-message-alert").removeClass("alert-success");
            $("#weibo-message-alert").addClass("alert-danger");
            $("#weibo-send").prop("disabled", true);
        }
        
        



    });

    $("#weibo-huati").click(function() {
        var content = $("#weibo-content").val();

        $("#weibo-content").val(content+"#在这里输入您的话题#")

    });

    $(".top-adver").find("span").click(function () {
        
        $(".top-adver").slideUp(300);
    });


    $("#weibo-public > li").click(function () {
        var title = $(this).attr("title");
       
        $(".cc").find("label").find("span").html(title);
      


    });

    $("#weibo-send").click(function () {
       
       
        
        $.ajax({
            type: "post",
            url: "/ajax/index.ashx?action=sendweibo",
            data: {
                id: $("#id").val(),
                text: $("#weibo-content").val(),
                imgs:imglist.toString()

            },
            success: function (data) {

                if (data=="ok")
                {
                    
                    location.href = "index.aspx";
                }
            }
          
        });



    });

    $(".tu").find("ul").find("li").find("img").click(function () {
   
            var src = $(this).attr("src");
            //$("#alert-pic").css("display", "block");
            $("#alert-pic").slideDown(300);
            $("#alert-pic").find("img").attr("src", src);
       
        
      
       
       
        
    });
    $("#show-close").click(function () {
        $("#alert-pic").slideUp(300);
    });

    $(".weibo-col").click(function () {

        var weiboid = $(this).attr("itemid");
        $("#col-modal").attr("itemid",weiboid)
        $("#col-modal").modal("show");
        

    });

    $(".weibo-zhuan").click(function () {
        
        $("#no-modal").modal("show");
    });

    $(".weibo-nice-li").click(function () {
        
        var weiboid = $(this).prev().prev().prev().attr("itemid");
        var userid = $("#id").val();
        var nicecount = Number($(this).find("span").next().html()) + 1;
        $nice = $(this).find("span").next();

        
        $.ajax({
            type: "post",
            url: "/ajax/index.ashx?action=nice",
            data: {
                weiboid: weiboid,
                userid:userid
            },
            success: function (data) {
                if(data=="ok")
                {
                  
                   $nice.html(nicecount.toString());
                    

                }
                else
                {
                    $("#nonice-modal").modal("show");
                   

                }
            }






        });




    });
   

    $("#col-save").click(function () {

        var weiboid = $("#col-modal").attr("itemid");
        var id = $("#id").val();
        $.ajax({
            url: "/ajax/index.ashx?action=colweibo",
            type: "post",
            data: {
                weiboid: weiboid,
                userid:id
            },
            success: function (data) {
                if(data=="ok")
                {
                    $("#col-modal").modal("hide");
                }
            }



        });


    });

    $(".list").find("ul").children().click(function () {
       
            $("#no-modal").modal("show");
       
       


    });

    $(".weibo-remark").click(function () {
        var weiboid = $(this).parent().find("li").eq(0).attr("itemid");
        location.href = "remark.aspx?weiboid="+weiboid;

    });

    $("#search-button").click(function () {
        
        var content = $("#search-content").val();
        if (content.length==0) {
            return;
        }
        $.ajax({
            url: "/ajax/index.ashx?action=search",
            type: "post",
            data: {
                text:content
            },
            success: function (e) {
                location.href = "search.aspx?words="+e;
            }






        });
    });

  
});