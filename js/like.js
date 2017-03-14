$(function () {
   
    $("li").draggable({

        proxy: "clone",
        revert: true,
        onBeforeDrag: function (e) {
            $(this).css("opacity","0.2");
         
        },
        onStopDrag: function (e) {
            $(this).css("opacity", "1");
        },

    });

    var array = [];
    $("ul").droppable({
        
        accept: "li",
        onDrop: function (e, source) {
           
           


            $(this).append(source);
            $("ul").css("background", "white");
            
            
            if ($(this).attr("id")=="toul") {
                var id = $(source).attr("id");
                array.push(id);
                
                
               

            }

            if ($(this).attr("id") == "moveul") {

                var id = $(source).attr("id");
                array.splice(array.indexOf("id"), 1)
                

            }
           
            



        },
        onDragEnter: function (e, source) {
            $(this).css('background', 'rgba(135, 153, 222, 0.5)');
           
        },
        onDragLeave: function (e, source) {
            $("ul").css("background", "white");
           
        },



    });


    $("#submit").click(function () {

        $.ajax({
            url: "/Ajax/like.ashx?type=update",
            type: "post",
            data: {
                array: array.toString(),
                id:$("#id").val()
            },
            beforeSend: function () {

            },
            success: function (data, response, status) {

                if (data == "error") {
                    location.href = "register.aspx";
                   
                }
                else {
                    location.href = "login.aspx";
                }

            }




        });
      });



  

});