<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="remark.aspx.cs" Inherits="UI.remark" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>CC微博-新鲜事</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/remark.css">
    <link rel="shortcut icon" href="images/small.ico" />

</head>
<body>
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
            <div class="person">
                <a href="#">
                    <img style="width:60px;height:60px;border-radius:30px;margin-top:10px;margin-left:20px;margin-right:20px; float:left"  src="<%= per.face %>" />
                </a>
                <b style="line-height:40px;">
                    <a href="#">
                        <%= per.nickname %>
                        <input type="hidden" id="pid" value="<%=per.id %>" />
                         <input type="hidden" id="uid" value="<%=u.id %>" />
                        <input type="hidden" id="uface" value="<%= u.face %>" />
                        <input type="hidden" id="unickname" value="<%= u.nickname %>" />

                         <%for (int i = 0; i < DateTime.Now.Year - per.time.Year + 1; i++){ %>
                        <span style="color:#ff6a00" class="glyphicon glyphicon-star"></span>
                        <%} %>
                    </a>
                </b>
                <p>
                    <%= per.myself %>
                </p>

                <button id="guanzhu" type="button" class="btn btn-primary">
                    
                    <span style="display:none;" class="glyphicon glyphicon-plus"></span>
                    <span class="glyphicon glyphicon-ok"></span>
                          关注</button>
                
            </div>

            <div class="weibo">
               
                <p>
                   <%= Comon.FaceReplace(W.text) %>
                    
                </p>

                

                <ul class="tu">

                     <%
                       if (W.images!="")
                       {
                          
                      
                               string[] imgs = W.images.Trim().Split(',');
                                for (int i = 0; i < imgs.Length; i++)
                                {
                                   
                                %>
                            <li>
                                <img src="<%= imgs[i] %>" />
                            </li>
                               <%}
                       } %>
                   
                </ul>

                <!--<video style="width:500px;margin:20px 0 20px 20px"  controls="controls" src="video/v1.mp4"></video>-->

                <time style="display:block;margin-left:20px"><%= W.sendtime %></time>

                <ul class="list">
                    <li class="border">
                        收藏
                    </li>
                    <li class="border">
                        转发
                    </li>
                    <li class="border">
                        评论(<%=W.remark %>)
                    </li>
                    <li>
                        <span class="glyphicon glyphicon-thumbs-up">(<%= W.nice %>)
                        </span>
                    </li>
                </ul>

                <footer>

                    <div class="chat">
                        <input id="weibo-content" style="width:460px;margin-left:10px; float:left" type="email" class="form-control">
                        <img id="l-face" style="margin:0 10px 0 10px;cursor:pointer" src="face/tootha_thumb.gif">
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
                        <button id="send" itemid="<%= W.id %>" style="width:80px" type="button" class="btn btn-primary">发送</button>

                        <ul id="remark-list">
                           <%  foreach (var item in List)
                               {
                                   BLL.UserService us = new BLL.UserService();
                                   Model.User user = new Model.User();
                                   user = us.QueryById(item.man);
                                   
                                 %>  
                             
                            <li>
                                <a href="#">
                                    <img class="face" width="40" height="40" src="<%= user.face %>" />
                                </a>
                                <p>
                                    <a href="everybody.aspx?personid=<%= user.id %>"><%= user.nickname %></a>：
                                    <%= Comon.FaceReplace(item.text) %>
                                </p>
                                <time style="display:inline-block;color:#808080; margin-left:60px;"><%= item.time %></time>

                            </li>
                           <%  } %>
                        </ul>
                       
                        <nav style="padding-bottom:5px;padding-left:10px;padding-right:10px;">
                  <ul class="pager">
                    <li style="margin-right:350px;"><a href="remark.aspx?weiboid=<%= Request["weiboid"] %>&page=<%= pre %>"><span aria-hidden="true">&larr;</span>上一页</a></li>
                    <li ><a href="remark.aspx?weiboid=<%= Request["weiboid"] %>&page=<%= next %>">下一页<span aria-hidden="true">&rarr;</span></a></li>
                  </ul>
                </nav>
                      
                    </div>

                  
                    
                </footer>

                


            </div>


        </div>
        <div class="right">
            <div class="hot">
                <h2>热门微博推荐</h2>
                <ul>
                    <% foreach (var item in ListWeibo)
                       {
                           BLL.UserService us = new BLL.UserService();
                           Model.User user = new Model.User();
                           user = us.QueryById(item.sendman);
                          %> 
                       
                    <li>
                        <img style="width:80px;height:80px;float:left;margin-right:10px;" src="<%= user.face %>" />
                        <p>
                            <a href="remark.aspx?weiboid=<%= item.id %>">
                                <%= Comon.FaceReplace(item.text) %>
                            </a>
                        </p>

                        <span style="position:absolute;bottom:5px;right:5px;font-size:12px;">
                            来自
                            <a href="everybody.aspx?personid=<%= user.id %>"><%= user.nickname %></a>
                        </span>
                    </li>
                   <%} %>
                </ul>

            </div>

            <div class="adv">
              <header style="height:30px;background-color:#ff6a00;line-height:30px;color:white;text-indent:20px;font-weight:bold;border-radius:6px 6px 0 0">淘宝网 wwww.taobao.com</header>

                <div style=" margin:0 auto 0 auto;" id="carousel-example-generic" class="carousel" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                     
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active thumbnail">
                            <img src="images/movi_1.png" alt="...">

                        </div>
                        <div class="item thumbnail">
                            <img src="images/movi_2.png" alt="...">

                        </div>
                        <div class="item thumbnail">
                            <img src="images/movi_3.png" alt="...">

                        </div>
                       

                    </div>


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
                        Copyright © 2009-2015 WEIBO 北京微梦CC网络技术有限公司
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
                <li style="color:white;margin-left:200px">服务热线：4000 960 960（个人/企业）服务时间9:00-21:00 4000 980 980（广告主）服务时间9:00-18:00 （按当地市话标准计算）</li>
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


    <script src="bootstrap/js/jquery.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/js.js"></script>
    <script type="text/javascript" src="js/remark.js"></script>

</body>
</html>
