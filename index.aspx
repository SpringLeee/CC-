<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="UI.index" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>CC微博-新鲜事</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
     <script src="bootstrap/js/jquery.js"></script>
    <script type="text/javascript" src="swfupload/swfupload.js"></script>
	<script type="text/javascript" src="swfupload/handlers.js"></script>
	<script type="text/javascript">
	    var swfu;
	    var imglist = Array();
	    window.onload = function () {
	        swfu = new SWFUpload({
	            // Backend Settings
	            upload_url: "upimg.aspx?action=upload",
	            post_params: {

	            },

	            // File Upload Settings
	            file_size_limit: "2 MB",
	            file_types: "*.jpg",
	            file_types_description: "JPG Images",
	            file_upload_limit: 6,    // Zero means unlimited

	            // Event Handler Settings - these functions as defined in Handlers.js
	            //  The handlers are not part of SWFUpload but are part of my website and control how
	            //  my website reacts to the SWFUpload events.
	            swfupload_preload_handler: preLoad,
	            swfupload_load_failed_handler: loadFailed,
	            file_queue_error_handler: fileQueueError,
	            file_dialog_complete_handler: fileDialogComplete,
	            upload_progress_handler: function (file, bytesLoaded) {
	                var percent = Math.ceil((bytesLoaded / file.size) * 100);
	                if (percent>100) {
	                    percent = 100;
	                }
	                
	                $("#swfu_container_bar").css("width",percent+"%");

	            },
	            upload_error_handler: uploadError,
	            upload_success_handler: function (file, serverdata) {

	                imglist.push(serverdata);
                    
	                $li = '<li class="mgid"> <img src="' + serverdata + '"  /></li>';
	                $("#uploadimg-ul").append($li);


	                


	            },
	            upload_complete_handler: uploadComplete,

	            // Button settings
	            button_image_url: "swfupload/images/XPButtonNoText_160x22.png",
	            button_placeholder_id: "spanButtonPlaceholder",
	            button_width: 100,
	            button_height: 30,
	            button_text: ' 请选择图片',
	            button_text_style: '.button { font-family: Helvetica, Arial, sans-serif; font-size: 14pt; } .buttonSmall { font-size: 10pt; }',
	            button_text_top_padding: 5,
	            button_text_left_padding: 15,

	            // Flash Settings
	            flash_url: "swfupload/swfupload.swf",	// Relative to this file
	            flash9_url: "swfupload/swfupload_FP9.swf",	// Relative to this file

	            custom_settings: {
	                upload_target: "divFileProgressContainer"
	            },

	            // Debug Settings
	            debug: false
	        });
	    }
	</script>
    <link rel="shortcut icon" href="images/small.ico" />

</head>
<body>
   <input type="hidden" id="id" value="<%= id %>" />
      <div class="modal fade" id="theme">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
         
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CC微博-选择一个你喜欢的皮肤</h4>
      </div>
      <div class="modal-body">
         
        <ul>
            <li>
                
                <img src="theme/s1.jpg" />
                <span id="s1"  class="glyphicon glyphicon-ok"></span>
               
            </li>
            <li>
                <img src="theme/s2.jpg" />
               <span id="s2"  class="glyphicon glyphicon-ok"></span>
            </li >
            <li>
                <img src="theme/s3.jpg" />
               <span id="s3"  class="glyphicon glyphicon-ok"></span>
            </li>
            <li>
                <img src="theme/s4.jpg" />
               <span id="s4"  class="glyphicon glyphicon-ok"></span>
            </li>
            <li>
                <img src="theme/s5.jpg" />
               <span id="s5"  class="glyphicon glyphicon-ok"></span>
            </li>
            <li>
                <img src="theme/s6.jpg" />
               <span id="s6"  class="glyphicon glyphicon-ok"></span>
            </li>
            
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" style="width:100px" class="btn btn-default" data-dismiss="modal">不选了</button>
        <button id="theme-save" type="button" style="width:100px;" class="btn btn-primary">保存</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->

</div>
     <div id="col-modal" itemid="" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
         
  <div class="modal-dialog modal-sm">
   <div class="modal-content">
      <div class="modal-header">
         
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CC微博</h4>
      </div>
      <div class="modal-body">
         <p style="color:#808080;">
             
            <span class="glyphicon glyphicon-subtitles"></span> 确定要把这条微博加入收藏吗？
         </p>
        
      </div>
      <div class="modal-footer">
       
        <button id="col-save" type="button" style="width:100px;" class="btn btn-primary">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div>
</div>
     <div id="no-modal" itemid="" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
         
  <div class="modal-dialog modal-sm">
   <div class="modal-content">
      <div class="modal-header">
         
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CC微博</h4>
      </div>
      <div class="modal-body">
         <p style="color:#808080;">
             
            <span class="glyphicon glyphicon-subtitles"></span> 
             CC微博提示您:
             <br />
             <br />
            Sorry,CC微博1.0暂时不支持此项功能！
         </p>
        
      </div>
      <div class="modal-footer">
       
        <button type="button" style="width:100px" class="btn  btn-primary " data-dismiss="modal">知道了</button>
      </div>
    </div><!-- /.modal-content -->
  </div>
</div>
      <div id="nonice-modal" itemid="" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
         
  <div class="modal-dialog modal-sm">
   <div class="modal-content">
      <div class="modal-header">
         
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CC微博</h4>
      </div>
      <div class="modal-body">
         <p style="color:#808080;">
             
            <span class="glyphicon glyphicon-subtitles"></span> 
             CC微博提示您:
             <br />
             <br />
            Sorry,请不要重复提交！
         </p>
        
      </div>
      <div class="modal-footer">
       
        <button type="button" style="width:100px" class="btn  btn-primary " data-dismiss="modal">知道了</button>
      </div>
    </div><!-- /.modal-content -->
  </div>
</div>

    <div id="top">

        <div class="top-middle">

            <div class="logo">
                <a href="#">
                    <img id="logoimg" title="点我一下试试！" width="38" height="38" src="images/logoimg.png" />
                </a>
            </div>
          

            <div id="search" class="input-group">
                <input id="search-content" type="text" class="form-control" placeholder="搜索微博，找人">
                <span class="input-group-btn">
                    <button id="search-button"  class="btn btn-default" type="button">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </span>
            </div>

            <ul class="nav nav-pills">
                <li role="presentation">
                    <a href="#" class="on">
                        <span class="glyphicon glyphicon-home"></span>
                        主页
                    </a>
                </li>
                <li role="presentation">
                    <a href="hot.aspx?time=day">
                        <span class="glyphicon glyphicon-search"></span>
                        发现
                    </a>
                </li>
                
                <li style="width:180px" role="presentation">
                    <a href="info.aspx">
                        <span class="glyphicon glyphicon-user"></span>
                        <%= u.nickname %>
                    </a>
                </li>
                <li role="presentation">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                        <span class="glyphicon glyphicon-envelope"></span>
                        消息 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">@我的</a></li>
                        <li><a href="#">评论</a></li>
                        <li><a href="#">赞</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">私信</a></li>
                        <li><a href="#">未关注人私信</a></li>
                        <li><a href="#">群通知</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">消息设置</a></li>
                    </ul>
                </li>
                <li>
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                        <span class="glyphicon glyphicon-cog"></span>
                        设置 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">账号设置</a></li>
                        <li><a href="#">会员中心</a></li>
                        <li><a href="#">V认证</a></li>
                        <li><a href="#">账号安全</a></li>
                        <li><a href="#">隐身设置</a></li>
                        <li><a href="#">消息设置</a></li>
                        <li><a href="#">帮助中心</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a id="logout" href="#">退出</a></li>

                    </ul>

                </li>

            </ul>
        </div>
        <div class="write">

            <button id="alert-write" type="button" class="btn btn-success" data-toggle="tooltip" data-placement="left" title="按一下N键试一下">
                <span class="glyphicon glyphicon-file"></span>

                

            </button>

            <div style="display:none" id="alert-content">
                <div id="alert-content-alert" style="margin:0;padding:10px 0 5px 20px;display:none; font-size:14px" class="alert alert-success" role="alert">微博发布成功！</div>
                <header id="alert-content-header" style="float:right;letter-spacing:1.5px; line-height:30px;font-size:14px;font-weight:bold;margin-right:20px;">
                    还可以输入
                    <span id="alert-content-span" style="color:#ff6a00;font-size:18px;">
                    140
                        </span>
                    字
                </header>
           
                      <textarea id="alert-content-input" style="margin:0 auto 0 auto; width:94%;height:100px;resize:none;"  draggable="false" class="form-control"></textarea>
                <!-- Standard button -->

<button style="width:94%;margin:10px 0 10px 3%;" type="button" class="btn btn-primary">发布</button>

            </div>
        </div>

    </div>



    <div id="body">
       
        <div class="content">

            <div class="body-left">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-home"></span>
                            主页
                            <span class="badge">4</span>
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="message.aspx">
                            <span class="glyphicon glyphicon-envelope"></span>
                            消息
                            <% if (WeiduMessage!=0){%>  
                            <span style="background-color:#ff6a00" class="badge"><%= WeiduMessage %></span>
                             <%  } %>
                            
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-th-large"></span>
                            收藏
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-thumbs-up"></span>
                            赞
                        </a>
                    </li>
                    <li>
                        <hr />
                    </li>
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-magnet"></span>
                            好友圈
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-tasks"></span>
                            群微博
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-heart"></span>
                            特别关注
                        </a>
                    </li>
                    <li>
                        <hr />
                    </li>
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-record"></span>
                            其他
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-record"></span>
                            同学
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-record"></span>
                            朋友
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-record"></span>
                            明星
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-record"></span>
                            网络
                        </a>
                    </li>

                </ul>

            </div>
            <div class="body-mid">
                <div class="write">
                    <div class="cc dropdown">

                        <label title="公开" style="cursor:pointer;font-weight:normal;color:#808080;" class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">

                           <span>公开</span>

                            <i class="caret"></i>
                        </label>


                        <ul id="weibo-public" style="width:50px"  class="menu-ul dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
                            <li title="公开">
                                <span style="color:#f83f3f;float:left;" class="glyphicon glyphicon-globe"></span>
                                公开
                            </li>

                            <li title="好友圈">
                                <span style="color:#ff6a00;" class="glyphicon glyphicon-dashboard"></span>
                                好友圈
                            </li>
                            <li title="自己">
                                <span style="color:#7b31db;" class="glyphicon glyphicon-lock"></span>
                                自己
                            </li>
                            <li title="群可见">
                                <span style="color:#848dd8;" class="glyphicon glyphicon-stats"></span>
                                群可见
                            </li>

                        </ul>

                    </div>

                    <button id="weibo-send" type="button" title="发布" class="send btn btn-primary" disabled="disabled">发布</button>

                    <img src="images/xinxian.jpg" />

                    <a class="top-weibo-detail" href="#">
                        热门微博
                    </a>




                    
                        <div id="weibo-message-alert"  class="top-weibo alert alert-success" role="alert">
                            PS: 还可以输入<span id="weibo-number" style="color:#ff6a00;font-size:16px;margin:0 5px 0 5px;font-weight:bold">140</span>字

                        </div>
                        <%--北京知名艺校被曝集体吸毒，学校发微博致歉(图)--%>
                    
                    
                    <textarea id="weibo-content" draggable="false" class="form-control"></textarea>




                    <ul id="top-list">
                        <li id="l-face"  title="表情">
                            <div id="x-face">
                                <ul>
                                    <li>
                                        <img title="[微笑]" src="face/huanglianwx_thumb.gif">                                        
                                    </li>
                                    <li>
                                        <img title="[嘻嘻]" src="face/tootha_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[哈哈]" src="face/laugh.gif">
                                    </li>
                                    <li>
                                        <img title="[可爱]" src="face/tza_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[可怜]" src="face/kl_thumb.gif">
                                    </li>


                                    <li>
                                        <img title="[挖鼻]" src="face/wabi_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[吃惊]" src="face/cj_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[害羞]" src="face/shamea_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[挤眼]" src="face/zy_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[闭嘴]" src="face/bz_thumb.gif">
                                    </li>


                                    <li>
                                        <img title="[鄙视]" src="face/bs2_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[爱你]" src="face/lovea_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[泪]" src="face/sada_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[偷笑]" src="face/heia_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[亲亲]" src="face/qq_thumb.gif">
                                    </li>


                                    <li>
                                        <img title="[生病]" src="face/sb_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[太开心]" src="face/mb_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[白眼]" src="face/landeln_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[右哼哼]" src="face/yhh_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[左哼哼]" src="face/zhh_thumb.gif">
                                    </li>

                                    <li>
                                        <img title="[嘘]" src="face/x_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[衰]" src="face/cry.gif">
                                    </li>
                                    <li>
                                        <img title="[委屈]" src="face/wq_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[吐]" src="face/t_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[哈欠]" src="face/haqianv2_thumb.gif">
                                    </li>

                                    <li>
                                        <img title="[抱抱]" src="face/bba_thumb.gif">
                                    </li>
                                    
                                    <li>
                                        <img title="[怒]" src="face/angrya_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[疑问]" src="face/yw_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[馋嘴]" src="face/cza_thumb.gif">
                                    </li>
                                    <li>
                                        <img title="[拜拜]" src="face/88_thumb.gif">
                                    </li>

                               



                                </ul>
                            </div>
                                <i class="i1 glyphicon glyphicon-dashboard"></i>
                                表情
                           
                        </li>
                        <li id="l-img" title="图片">
                            <div id="upload-img">
                                <div id="content">
			   
		
	    <div id="swfu_container" >
           
		    <div>
				<span  id="spanButtonPlaceholder"></span>
                <div id="swfu_container-alert" class="alert alert-warning" role="alert">最多选6张图片</div>

		    </div>
             <div id="swfu_container_bar_div" class="progress">
  <div id="swfu_container_bar" class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" >
    
  </div>
</div>
		    <div id="divFileProgressContainer" style="height: 35px;margin-left:10px;"></div>
		    <div id="thumbnails">
                <ul id="uploadimg-ul">
                   
                 
                </ul>

		    </div>
	    </div>
		</div>
                            </div>
                            <i class="i2 glyphicon glyphicon-picture"></i>
                            图片
                        </li>
                        <li title="视频">
                            <i class="i3 glyphicon glyphicon-facetime-video"></i>
                            视频
                        </li>
                        <li id="weibo-huati" title="话题">
                            <i class="i4 glyphicon glyphicon-stats"></i>
                            话题
                        </li>
                        <li title="长微博">
                            <i class="i5 glyphicon glyphicon-file"></i>
                            长微博
                        </li>
                        <li>

                            <div class="dropdown">

                                <label title="其他" style="cursor:pointer;font-weight:normal;color:#808080;" class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <i class="i6 glyphicon glyphicon-tag"></i>
                                    其他

                                </label>


                                <ul style="width:50px" id="menu-write-ul" class="menu-ul dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li title="点评">
                                        <span style="color:#f83f3f;float:left;" class="glyphicon glyphicon-star-empty"></span>
                                        点评
                                    </li>

                                    <li title="定时发">
                                        <span style="color:#ff6a00;" class="glyphicon glyphicon-time"></span>
                                        定时发
                                    </li>
                                    <li title="音乐">
                                        <span style="color:#4cff00;" class="glyphicon glyphicon-music"></span>
                                        音乐
                                    </li>
                                    <li title="投票">
                                        <span style="color:#848dd8;" class="glyphicon glyphicon-stats"></span>
                                        投票
                                    </li>
                                    <li title="微公益">
                                        <span style="color:#4cdde1;" class="glyphicon glyphicon-cloud"></span>
                                        微公益
                                    </li>
                                    <li title="发文件">
                                        <span style="color:#7b31db;" class="glyphicon glyphicon-paperclip"></span>

                                        发文件
                                    </li>
                                </ul>

                            </div>





                        </li>


                    </ul>



                </div>


                <div class="top-adver">
                    <img src="images/top-adv.png" />
                    <span class="glyphicon glyphicon-remove-circle"></span>
                </div>

                <div id="alert-pic" style="display:none;max-width:500px;max-height:400px; position:fixed;top:25%;left:60%;z-index:99; border:3px solid #f83f3f;background-color:white;border-radius:10px;">
                    <div style="position:relative;width:100%;height:100%">
                        <header style="font-size:30px;text-indent:20px; line-height:40px;background-color:#ccc;border-radius:10px 10px 0 0">
                            CC-blog
                            <span id="show-close" class="glyphicon glyphicon-remove-circle" style="float:right;color:white; cursor:pointer; margin-top:5px;margin-right:5px;"></span>
                        </header>
                        <img style="max-width:480px" src="uploadimg/760e7fe3d3e0fc606d2122b7c2e70634.jpg" />
                        
                    </div>
                    
                </div>

                 <div class="top-select">

                    <ul class="nav nav-pills">
                        <li role="presentation"><a href="#">全部</a></li>
                        <li role="presentation"><a href="#">图片</a></li>
                        <li role="presentation"><a href="#">视频</a></li>
                        <li role="presentation"><a href="#">音乐</a></li>
                        <li role="presentation"><a href="#">原创</a></li>
                    </ul>

                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="搜索关注人的微博">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </span>
                    </div>

                </div>

                <%--首页微博绑定--%>
                <% foreach (var item in WeiboList){%>

                     <div class="weibo">
                    <h2>
                         <% 
                                //根据微博查询用户信息
                                BLL.UserService us = new BLL.UserService();
                                Model.User person = new Model.User();                                
                                person =  us.QueryById(item.sendman);
                           %>
                        <a title="<%= person.nickname %>" href="everybody.aspx?personid=<%= person.id %>">
                            <%= person.nickname %>
                        </a>
                        <%for (int i = 0; i < DateTime.Now.Year - u.time.Year + 1; i++){ %>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <%} %>
                    </h2>


                    <p>
                        <%=  Comon.FaceReplace(item.text) %>                        
                    </p>

                   <div class="tu">
                        <ul>
                            <%
                       if (item.images!="")
                       {
                          
                      
                               string[] imgs = item.images.Trim().Split(',');
                                for (int i = 0; i < imgs.Length; i++)
                                {
                                   
                                %>
                            <li>
                                <img src="<%= imgs[i] %>" />
                            </li>
                               <%}
                       } %>
                            
                           
                        </ul>
                    </div>


                

                    <footer><%= item.sendtime %> &nbsp;  &nbsp;CC微博</footer>


                    <div class="foot">

                        <ul>
                            <li class="weibo-col line" itemid="<%= item.id %>">
                                收藏
                                
                            </li>
                            <li class="weibo-zhuan line">
                                转发
                            </li>
                            <li  class="weibo-remark line">
                                评论(
                                <%= item.remark %>
                                )
                            </li>
                            <li class="weibo-nice-li">
                                <span class="glyphicon glyphicon-thumbs-up"></span>(
                                <span class="weibo-nice"><%= item.nice %></span>
                                )
                            </li>
                        </ul>
                    </div>

                    <div class="remark">

                    </div>

                    <div class="face">
                        <a href="everybody.aspx?personid=<%= person.id %>">
                           
                            <img  src="<%= person.face %>" />
                        </a>
                    </div>

                    <div class="list">
                        <span class="glyphicon glyphicon-chevron-down dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></span>


                        <ul class="dropdown-menu dropdown-menu-right">
                            <li>帮上头条</li>
                            <li>屏蔽</li>
                            <li>取消关注</li>
                            <li>举报</li>
                        </ul>


                    </div>

                    


                </div>   

                <% }%>

                


                <div class="page">
   <nav>
  <ul style="font-size:20px;padding-top:5px" class="pager">
    <li  class="previous">
      
        <a href="index.aspx?page=<%= pre %>">
            <span aria-hidden="true">&larr;</span>上一页

        </a></li>
    <li class="nextt" style="float:right"><a href="index.aspx?page=<%= next %>">下一页 <span aria-hidden="true">&rarr;</span></a></li>
  </ul>
</nav>
                </div>




            </div>
            <div class="body-right">
                <div class="person">
                    <div class="person-top">
                        <a href="info.aspx">
                        <img src="user/person-bg.jpg" />
                        </a>
                    </div>
                    <div class="person-down">

                        <h3>
                            <a href="weibo.aspx">
                                <%= u.nickname %>
                            </a>
                             <% for (int i = 0; i < DateTime.Now.Year-u.time.Year+1; i++)
                           {
                             %>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            <%} %>
                            <i class="badge">4</i>
                        </h3>
                        <ul>
                            <li class="border-line">
                                <a href="#">
                                    <dl>
                                        <% BLL.FansService fs = new BLL.FansService();
                                          Response.Write( fs.QueryFansCount(Convert.ToInt32(id)));
                                         %>
                                        <dt>关注</dt>

                                    </dl>
                                </a>
                            </li>
                            <li class="border-line">
                                <a href="#">

                                    <dl>
                                        <%
                                          Response.Write( fs.QueryGzCount(Convert.ToInt32(id)));
                                         %>
                                        <dt>粉丝</dt>
                                    </dl>
                                </a>
                            </li>
                            <li>
                                <a href="weibo.aspx">
                                    <dl>
                                        <%
                                            BLL.WeiboService ws = new BLL.WeiboService();
                                           Response.Write(ws.QueryCount(Convert.ToInt32(id)));
                                         %>
                                        <dt>微博</dt>
                                    </dl>
                                </a>

                            </li>
                        </ul>


                    </div>
                    <div class="person-face">
                        <img width="70" height="70" src="<%= u.face %>" />
                    </div>
                </div>


                <div class="top-songs">
                    <h2>
                        <a href="#">
                            <i class="glyphicon glyphicon-headphones"></i>
                            亚洲新歌排行榜
                        </a>
                    </h2>

                    <ul class="nav nav-pills nav-stacked">
                        <li role="presentation">
                            <a href="#">
                                <span class="badge">1</span>
                                平凡之路-朴树
                                <i class="glyphicon glyphicon-play-circle"></i>
                            </a>
                        </li>
                        <li role="presentation">
                            <a href="#">
                                <span class="badge">2</span>
                                一个人-张艺兴
                                <i class="glyphicon glyphicon-play-circle"></i>
                            </a>
                        </li>
                        <li role="presentation">
                            <a href="#">
                                <span class="badge">3</span>
                                我是大主宰
                                <i class="glyphicon glyphicon-play-circle"></i>
                            </a>
                        </li>
                    </ul>
                    <hr />
                    <p>
                        <a href="#">
                            查看更多&nbsp;>
                        </a>
                    </p>
                </div>


                <div class="top-huati">
                    <h6>
                        <a href="#">
                            <span class="glyphicon glyphicon-fire"></span>
                            热门话题
                        </a>
                    </h6>
                    <hr />
                    <ul>
                        <li>
                            <a href="#">
                                #功夫熊猫手游今日公测#
                            </a>
                            <span>2300万</span>
                        </li>
                        <li>
                            <a href="#">
                                #黄子韬牵手萌萝莉#
                            </a>
                            <span>2300万</span>
                        </li>
                        <li>
                            <a href="#">
                                #论备胎的最高境界#
                            </a>
                            <span>2300万</span>
                        </li>
                        <li>
                            <a href="#">
                                #鹿晗愿望季#
                            </a>
                            <span>2300万</span>
                        </li>
                        <li>
                            <a href="#">
                                #就这一个#
                            </a>
                            <span>2300万</span>
                        </li>
                        <li>
                            <a href="#">
                                #春运抢票大战#
                            </a>
                            <span>2300万</span>
                        </li>

                        <li>
                            <a href="#">
                                #股票热议榜#
                            </a>
                            <span>2300万</span>
                        </li>


                    </ul>
                    <hr />
                    <p>
                        <a href="#">
                            查看更多&nbsp;>
                        </a>
                    </p>
                </div>
                <div class="top-fans">
                    <h6>
                        <a href="#">
                            <span style="color:cornflowerblue;margin-right:4px;" class="glyphicon glyphicon-globe"></span>
                            好友关注动态
                        </a>
                    </h6>
                    <hr style="border:1px solid rgba(128, 128, 128, 0.73);padding:0 ;width:90%; margin:5px auto 0 auto" />
                    
                    <div class="up">
                        <a href="#"> @SouTaeHyun </a>刚刚关注了
                    </div>
                    <div class="down" style="position:relative;">
                        <a href="#">
                            <img  src="images/singer1.jpg" />
                        </a>
                        <a href="#" style="font-size:12px;">
                            陈奕迅
                        </a>
                        
                            <span class="glyphicon glyphicon-star-empty"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                        <button style="position:absolute;top:10px;right:10px;;" type="button" class="btn btn-default ">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 
                        </button>
                    </div>
                    <div class="up">
                        <a href="#"> @SouTaeHyun </a>刚刚关注了
                    </div>
                    <div class="down" style="position:relative;">
                        <a href="#">
                            <img src="images/singer5.jpg" />
                        </a>
                        <a href="#" style="font-size:12px;">
                            陈奕迅
                        </a>

                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <button style="position:absolute;top:10px;right:10px;" type="button" class="btn btn-default ">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </button>
                    </div>
                    <div class="up">
                        <a href="#"> @SouTaeHyun </a>刚刚关注了
                    </div>
                    <div class="down" style="position:relative;">
                        <a href="#">
                            <img src="images/singer2.jpg" />
                        </a>
                        <a href="#" style="font-size:12px;">
                            陈奕迅
                        </a>

                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <button style="position:absolute;top:10px;right:10px;;" type="button" class="btn btn-default ">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </button>
                    </div>
                    <div class="up">
                        <a href="#"> @SouTaeHyun </a>刚刚关注了
                    </div>
                    <div class="down" style="position:relative;">
                        <a href="#">
                            <img src="images/singer3.jpg" />
                        </a>
                        <a href="#" style="font-size:12px;">
                            陈奕迅
                        </a>

                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <button title="关注" style="position:absolute;top:10px;right:10px;" type="button" class="btn btn-default ">
                            <span title="关注" class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </button>
                    </div>


                    <p style="height:40px;line-height:40px">
                        <a  href="#">
                            查看更多&nbsp;>
                        </a>
                    </p>

                </div>

                <div class="top-star">
                    <h6>
                        <a href="#">
                            <span class="glyphicon glyphicon-star"></span>
                            明星势力榜
                        </a>
                    </h6>
                    <hr />
                    <ul>
                        <li>
                            <i class="badge">1</i>
                            <a href="#">
                                <img class="img-circle" src="images/singer1.jpg" />
                                <b>Eason</b>
                            </a>
                            <span>21321</span>


                        </li>
                        <li>
                            <i class="badge">2</i>
                            <a href="#">
                                <img class="img-circle" src="images/singer2.jpg" />
                                <b>张学友</b>
                            </a>
                            <span>21321</span>


                        </li>
                        <li>
                            <i class="badge">3</i>
                            <a href="#">
                                <img class="img-circle" src="images/singer3.jpg" />
                                <b>汪峰</b>
                            </a>
                            <span>21321</span>


                        </li>
                        <li>
                            <i class="badge">4</i>
                            <a href="#">
                                <img class="img-circle" src="images/singer4.jpg" />
                                <b>李荣浩</b>
                            </a>
                            <span>21321</span>


                        </li>
                        <li>
                            <i class="badge">5</i>
                            <a href="#">
                                <img class="img-circle" src="images/singer5.jpg" />
                                <b>张靓颖</b>
                            </a>
                            <span>21321</span>


                        </li>





                    </ul>
                    <hr />
                    <p>
                        <a href="#">
                            查看更多&nbsp;>
                        </a>
                    </p>
                </div>

                <div class="adv">
                    <a href="#">
                        <img width="180" height="250" src="images/adver.jpg" />
                    </a>
                </div>




                <div class="gonggao">
                    <h2>

                        <a href="#">
                            <span class="glyphicon glyphicon-volume-down"></span>
                            - 公告栏 -
                        </a>

                    </h2>
                    <hr />
                    <h6>
                        <a href="#">

                            《​关于色情信息处置标准的公告》
                        </a>
                    </h6>

                    <h6>
                        <a href="#">
                            《首都互联网协会发布坚守七条底线倡议书》
                        </a>
                    </h6>
                </div>

            </div>



        </div>


    </div>
    <div id="footer">
        <div class="up">
            <div class="l1">
                <h4>
                    <a href="#">
                        微博精彩
                    </a>
                </h4>
                <ul>
                    <li>
                        <a href="#">热门微博</a>
                    </li>
                    <li>
                        <a href="#">热门话题</a>
                    </li>
                    <li>
                        <a href="#">名人堂</a>
                    </li>
                    <li>
                        <a href="#">微博会员</a>
                    </li>
                    <li>
                        <a href="#">微相册</a>
                    </li>
                    <li>
                        <a href="#">微游戏</a>
                    </li>
                    <li>
                        <a href="#">微指数</a>
                    </li>

                </ul>
            </div>
            <div class="l2">
                <h4>
                    <a href="#">
                        玩微博
                    </a>
                </h4>

                <img src="images/footer_code.jpg" />
                <a href="#">
                    <span>
                        扫码下载，更多版本戳这里
                    </span>
                </a>
            </div>
            <div class="l3">
                <h4>
                    <a href="#">
                        认证&合作
                    </a>
                </h4>
                <ul>
                    <li>
                        <a href="#">申请认证</a>
                    </li>
                    <li>
                        <a href="#">开放平台</a>
                    </li>
                    <li>
                        <a href="#">企业微博</a>
                    </li>
                    <li>
                        <a href="#">链接网站</a>
                    </li>
                    <li>
                        <a href="#">微博标识</a>
                    </li>
                    <li>
                        <a href="#">广告服务</a>
                    </li>
                    <li>
                        <a href="#">微博商学院</a>
                    </li>

                </ul>
            </div>
            <div class="l4">
                <h4>
                    <a href="#">
                        微博帮助
                    </a>
                </h4>
                <ul>
                    <li>
                        <a href="#">申请认证</a>
                    </li>
                    <li>
                        <a href="#">开放平台</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="down" style="font-size:12px;color:#808080" ;>
            <ul style="margin-left:230px">
                <li>
                    <a href="#">
                        微博客服
                    </a>
                </li>
                <li>
                    <a href="#">
                        意见反馈
                    </a>
                </li>
                <li>
                    <a href="#">
                        舞弊举报
                    </a>
                </li>
                <li>
                    <a href="#">
                        开放平台
                    </a>
                </li>
                <li>
                    <a href="#">
                        微博招聘
                    </a>
                </li>
                <li>
                    <a href="#">
                        新浪网导航
                    </a>
                </li>
                <li>
                    <a href="#">
                        举报处理大厅
                    </a>
                </li>
                <li>
                    <a href="#">
                        京ICP证100780号
                    </a>
                </li>
                <li>
                    <a href="#">
                        互联网药品服务许可证
                    </a>
                </li>
            </ul>

            <ul style="margin-left:170px;">
                <li>
                    <a href="#">
                        Copyright © 2009-2016 WEIBO SpringLee网络技术有限公司
                    </a>
                </li>
                <li>
                    <a href="#">
                        京网文[2014]2046-296号
                    </a>
                </li>
                <li>
                    <a href="#">
                        京ICP备12002058号
                    </a>
                </li>
                <li>
                    <a href="#">
                        增值电信业务经营许可证B2-20140447
                    </a>
                </li>
            </ul>
            <ul>
                <li style="color:white;margin-left:200px">服务热线：4000 960 960（个人/企业）联系站长：QQ 1028789852 TEL：15290218398</li>
            </ul>
        </div>
    </div>




    <div id="line"></div>
    <div id="line1"></div>

    <div id="up">UP</div>
    <div id="down">D</div>

    <div id="music">
        <div class="ctl">
            <span title="上一首" class="pre glyphicon glyphicon-upload"></span>
            <hr />
            <span title="播放" class="play glyphicon glyphicon-play-circle"></span>
            <hr />
            <span title="下一首" class="next glyphicon glyphicon-download"></span>
        </div>

         
        <audio class="mp3" src="music/m1.mp3"  loop="loop" >
            
        </audio>
    </div>


   
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/js.js"></script>


    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />


    <script type="text/javascript" src="js/index.js"></script>
</body>
</html>
