<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hot.aspx.cs" Inherits="UI.hot" %>



<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>CC微博-新鲜事</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/hot.css">
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

    <div id="logo">
        
    </div>

   <div id="body">
       <div class="left">
           <ul class="nav nav-pills nav-stacked">
               <li role="presentation" class="active"><a href="#">热门微博</a></li>
               <li role="presentation"><a href="#">微话题</a></li>
               <li role="presentation"><a href="#">找人</a></li>
               <li role="presentation"><a href="#">电影</a></li>
               <li role="presentation"><a href="#">听歌</a></li>
               <li role="presentation"><a href="#">股票</a></li>
               <li role="presentation"><a href="#">博客</a></li>
               <li role="presentation"><a href="#">视频</a></li>
               <li role="presentation"><a href="#">旅游</a></li>
               <li role="presentation"><a href="#">购物</a></li>
               <li role="presentation"><a href="#">直播</a></li>
               <li role="presentation"><a href="#">新闻</a></li>
           </ul>

       </div>

       <div class="mid">
           <div class="mid-top">
              <span>
                   <a href="#" style="float:left;margin-left:20px;">
                       热门微博排行榜
                   </a>
               </span>
               <span>
                   <a href="http://weibo.com/p/1001603803679256876641" style="float:right;margin-right:20px;">
                       热门微博管理规范（试行版）
                   </a>
               </span>
           </div>

           <div class="mid-list">
               <ul>
                   <li>
                       <a href="hot.aspx?time=day" <% if (Request["time"] == "day") { Response.Write("style="+'"'+"color:#ff6a00;"+'"'); } %> >24小时</a>
                   </li>
                   <li>
                       <a href="hot.aspx?time=hour" <% if (Request["time"] == "hour") { Response.Write("style="+'"'+"color:#ff6a00;"+'"'); } %>>1小时</a>
                   </li>
                   <li>
                       <a href="hot.aspx?time=week" <% if (Request["time"] == "week") { Response.Write("style="+'"'+"color:#ff6a00;"+'"'); } %>>周榜</a>
                   </li>
                   <li>
                       <a href="hot.aspx?time=month" <% if (Request["time"] == "month") { Response.Write("style="+'"'+"color:#ff6a00;"+'"'); } %>>月榜</a>
                   </li>
               </ul>
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
  <ul style="font-size:20px;padding-top:3px;padding-left:10px;padding-right:10px" class="pager">
    <li   class="previous">
      
        <a href="hot.aspx?time=<%= Request["time"] %>&page=<%= pre %>">
            <span aria-hidden="true">&larr;</span>上一页

        </a></li>
    <li class="nextt" style="float:right"><a href="hot.aspx?time=<%= Request["time"] %>&page=<%= next %>">下一页 <span aria-hidden="true">&rarr;</span></a></li>
  </ul>
</nav>
           </div>

       </div>



       <div class="right">
           <div class="list">
               <header>热门微博分类</header>
               <hr />
               <ul class="nav nav-pills">

                   <li role="presentation"><a href="#">微话题</a></li>
                   <li role="presentation"><a href="#">找人</a></li>
                   <li role="presentation"><a href="#">电影</a></li>
                   <li role="presentation"><a href="#">听歌</a></li>
                   <li role="presentation"><a href="#">股票</a></li>
                   <li role="presentation"><a href="#">博客</a></li>
                   <li role="presentation"><a href="#">视频</a></li>
                   <li role="presentation"><a href="#">旅游</a></li>
                   <li role="presentation"><a href="#">购物</a></li>
                   <li role="presentation"><a href="#">直播</a></li>
                   <li role="presentation"><a href="#">新闻</a></li>
                   <li role="presentation"><a href="#">微话题</a></li>
                   <li role="presentation"><a href="#">找人</a></li>
                   <li role="presentation"><a href="#">电影</a></li>
                   <li role="presentation"><a href="#">听歌</a></li>
                   <li role="presentation"><a href="#">股票</a></li>
                   <li role="presentation"><a href="#">博客</a></li>
                   <li role="presentation"><a href="#">视频</a></li>
                   <li role="presentation"><a href="#">旅游</a></li>
                   <li role="presentation"><a href="#">购物</a></li>
                   <li role="presentation"><a href="#">直播</a></li>
                   <li role="presentation"><a href="#">新闻</a></li>
               </ul>
           </div>
           <div class="adv">

               <div style=" margin:0 auto 0 auto;" id="carousel-example-generic" class="carousel" data-ride="carousel">
                   <!-- Indicators -->
                   <ol class="carousel-indicators">
                       <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                       <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                       <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                       <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                   </ol>

                   <!-- Wrapper for slides -->
                   <div class="carousel-inner" role="listbox">
                       <div class="item active thumbnail">
                           <img src="images/hot-adv1.jpg" alt="...">

                       </div>
                       <div class="item thumbnail">
                           <img src="images/hot-adv2.jpg" alt="...">

                       </div>
                       <div class="item thumbnail">
                           <img src="images/hot-adv3.jpg" alt="...">

                       </div>
                       <div class="item thumbnail">
                           

                               <img src="images/hot-adv4.jpg" alt="...">
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


        <audio class="mp3" src="music/m1.mp3" loop="loop"></audio>
    </div>


    <script src="bootstrap/js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/js.js"></script>
    <script type="text/javascript" src="js/hot.js"></script>
</body>
</html>
