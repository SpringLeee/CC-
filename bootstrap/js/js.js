$(function () {
 
    var upid;
    var downid;
    var sid;
    var ssid;

    sid = setInterval(s, 20);
    ssid = setInterval(ss, 20);

  
   

 

function s() {
    
        var data = $("#line").width();  
        $("#line").width(data + 5);
        
    if (data >= 660)
    {
        clearInterval(sid);
    }
   
   
}
function ss() {

    var data = $("#line1").width();
    $("#line1").width(data + 5);
   
    if (data >= 660) {
       
        clearInterval(ssid);
    }
}

function up()
{
    
    if ($(window).scrollTop() <= 15)
    {
        clearInterval(upid);
     
    }

    $(window).scrollTop($(window).scrollTop() - 30);
    
    
}
function down()
{
    if ($(window).scrollTop()+675 >= document.body.scrollHeight)
    {
      

       clearInterval(downid);
    
    }

    $(window).scrollTop($(window).scrollTop() + 30);
    

}

$("#up").click(function () {

    clearInterval(upid);
    clearInterval(downid);
  upid  =   setInterval(up,1);
   
});
$("#down").click(function () {

    clearInterval(upid);
    clearInterval(downid);
    downid = setInterval(down,1);
    
});

$("#btn").click(function () {
    $("#mp3")[0].play();
    $.ajax({

        type : "post",
        url: "go.php",
        data: { user: $("#search").val() },
        timeout: 10,
        beforeSend: function () {
            
            $("#send").fadeIn(1000);
        },
        success: function (data) {
            
            if (data=="ok") {
                alert("异步成功");
            }
            if (data=="no") {
                alert("no");
            }
          
        },

        error: function () {
            alert("异步失败");
        }

    });
   



});



	
});