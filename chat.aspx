<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chat.aspx.cs" Inherits="UI.chat" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>CC微博-新鲜事</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/chat.css">
    <link rel="shortcut icon" href="images/small.ico" />

</head>
<body>
    <input type="hidden" id="perface" value="<%= per.face %>" />
    <input type="hidden" id="uface" value="<%= u.face%>" />
    <input type="hidden" id="pid" value="<%= per.id %>" />
      <input type="hidden" id="uid" value="<%= u.id %>" />
    <div id="top">

        <div class="top-middle">

            <div class="logo">
                <a href="#">
                    <img id="logoimg" width="38" height="38" src="images/logoimg.png" />
                </a>
            </div>

            <div id="search" class="input-group">
                <input type="text" class="form-control" placeholder="搜索微博，找人">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </span>
            </div>

            <ul class="nav nav-pills">
                <li role="presentation">
                    <a href="index.aspx" class="on">
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
                
                <li role="presentation">
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
                        <li><a href="#">退出</a></li>

                    </ul>

                </li>

            </ul>
        </div>
        <div class="write">

            <button type="button" class="btn btn-success" data-toggle="tooltip" data-placement="left" title="按一下N键试一下">
                <span class="glyphicon glyphicon-file"></span>



            </button>
        </div>

    </div>



    <div id="body">
        <div class="left">
            <button type="button" class="btn btn-primary">
                我的消息箱
                <span class="glyphicon glyphicon-cog"></span>
            </button>


            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" style="background-color:rgba(255, 255, 255, 0.5);border-radius:5px;"><a href="#">@我的</a></li>
                <li role="presentation"><a href="#">评论</a></li>
                <li role="presentation"><a href="#">赞</a></li>
                <li role="presentation"><a href="#">私信</a></li>
                <li role="presentation"><a href="#">未关注人私信</a></li>
                <li role="presentation"><a href="#">群通知</a></li>
                <li role="presentation"><a href="#">订阅消息</a></li>
            </ul>


        </div>
        
        <div class="mid">

            <div id="chat">
                <header>
                    <span style="margin-left:20px;color:#6170ba" class="glyphicon glyphicon-arrow-left"></span>
                   
                   <b style="font-weight:bold;margin-left:20px;">
                    与&nbsp;
                       <%= per.nickname %>
                      &nbsp; 对话中
                   </b>

                    <div class="list">
                        <span class="glyphicon glyphicon-chevron-down dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></span>


                        <ul class="dropdown-menu dropdown-menu-right">
                            <li>删除对话</li>
                            <li>屏蔽私信</li>
                            <li>加入黑名单</li>
                        </ul>
                    </div>
                </header>

                <div class="content">
                    <ul id="chatcontent">
                        
                       
                    </ul>

                </div>

                <footer>

                    <input id="content" type="text" class="form-control" placeholder="你想说的话...">
                    <img id="biaoqing" src="face/tootha_thumb.gif" title="表情">

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
                    <button id="send" type="button" class="btn btn-primary">发送</button>

                </footer>



            </div>


        </div>

        <div class="right">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="搜索我的联系人">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </span>
            </div>
            <header>

                我的好友，联系人
            </header>

            <ul>
               
                    <% foreach (var item in Flist)
                       {
                          
                          
                         %> 
                         <li>
                             
                             <% BLL.UserService us = new BLL.UserService();
                               Model.User user = us.QueryById(item.fans);  %> 
                             <a  style="color:black" href="chat.aspx?personid=<%=user.id %>">
                              <img src="<%= user.face %>" />
                              <b><%= user.nickname %></b>
                         </a>    
                 </li>
                    <%   } %>
                   
                
                
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

         
        <audio class="mp3" src="music/m1.mp3"  loop="loop" > </audio>
         <audio class="qq" src="music/qq.mp3"  > </audio>
    </div>


    <script src="bootstrap/js/jquery.js"></script>
     <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />

    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/js.js"></script>
    <script type="text/javascript" src="js/chat.js"></script>

</body>
</html>
