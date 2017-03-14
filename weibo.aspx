<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="weibo.aspx.cs" Inherits="UI.weibo" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>CC微博-新鲜事</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/weibo.css">
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
        <div class="user">
            <img src="<%= u.face %>" title="浪子十八" />
            <h2><%= u.nickname %></h2>
            <input type="hidden" id="id" value="<%= u.id %>" />
            <% for (int i = 0; i < DateTime.Now.Year-u.time.Year+1; i++)
                           {
                             %>
            <span class="glyphicon glyphicon-star-empty"></span>
            <%} %>

            <footer><%= u.myself %></footer>
        </div>

        <div class="select">
            <ul>
                <li>
                    <a href="#" style="border-bottom:3px solid #ef841d;">
                        我的主页
                    </a>
                </li>
                <li>
                    <a href="#">
                        我的相册
                    </a>
                </li>
                <li>
                    <a href="info.aspx">
                        管理中心
                    </a>
                </li>

            </ul>
        </div>

        <div class="left">
            <div class="fans">
                <ul>
                    <li style="border-right:1px solid #ccc">
                        <a href="#">
                            <label><% BLL.FansService fs = new BLL.FansService();
                                      Response.Write(fs.QueryGzCount(u.id)); %></label>
                            <span>关注</span>
                        </a>

                    </li>
                    <li style="border-right:1px solid #ccc">
                        <a href="#">
                            <label><%= fs.QueryFansCount(u.id) %></label>
                            <span>粉丝</span>
                        </a>

                    </li>
                    <li>
                        <a href="#">
                            <label><%= WeiboCount %></label>
                            <span>微博</span>
                        </a>

                    </li>

                </ul>
            </div>

            <div class="data">
                <header>
                    <span class="glyphicon glyphicon-user"></span>
                    个人信息
                </header>
                <hr />
                <i class="glyphicon glyphicon-map-marker"></i>
                <label><%= u.address %></label>
                <hr />
                <i class="glyphicon glyphicon-education"></i>
                <label>毕业于CC高中</label>
                <hr />
                <i class="glyphicon glyphicon-list-alt"></i>
                <label>公司：暂无公司</label>
                <hr />
                <i class="glyphicon glyphicon-heart-empty"></i>
                <label><%= u.love %></label>
                <hr />
                <i class="glyphicon glyphicon-apple"></i>
                <label>生日：<%= u.birthday.ToShortDateString() %></label>
                <hr />
                <footer>
                    <a href="info.aspx">
                        编辑个人资料&nbsp;>
                    </a>

                </footer>

            </div>



            <div class="pic">
                <header>
                    <span class="glyphicon glyphicon-picture"></span>
                    我的图库
                </header>
                <ul>
                    <li>
                        <a href="#">
                            <img src="images/singer3.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="images/singer1.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="images/singer5.jpg" />
                        </a>
                    <li>
                        <a href="#">
                            <img src="images/singer2.jpg" />
                        </a>
                    </li>
                    </li>
                </ul>
                <footer>
                    <a href="#">
                        查看更多&nbsp;>
                    </a>
                </footer>
            </div>


            <div class="friend">
                <header>
                    <span class="glyphicon glyphicon-th"></span>
                    我的微博好友
                </header>
                <hr />
                <a href="#">
                    <img src="images/singer1.jpg" />
                </a>
                <a href="#">
                    <label>陈奕迅</label>
                </a>
                <i class="glyphicon glyphicon-star-empty"></i>
                <i class="glyphicon glyphicon-star-empty"></i>
                <i class="glyphicon glyphicon-star-empty"></i>
                <hr />
                <hr />
                <a href="#">
                    <img src="images/singer1.jpg" />
                </a>
                <a href="#">
                    <label>陈奕迅</label>
                </a>
                <i class="glyphicon glyphicon-star-empty"></i>
                <hr />
                <hr />
                <a href="#">
                    <img src="images/singer1.jpg" />
                </a>
                <a href="#">
                    <label>陈奕迅</label>
                </a>
                <hr />
                <hr />
                <a href="#">
                    <img src="images/singer1.jpg" />
                </a>
                <a href="#">
                    <label>陈奕迅</label>
                </a>
                <hr />
                <hr />
                <a href="#">
                    <img src="images/singer1.jpg" />
                </a>
                <a href="#">
                    <label>陈奕迅</label>
                </a>
                <hr />

                
                <footer>
                    <a href="#">
                        查看更多&nbsp;>
                    </a>

                </footer>

            </div>


            <div class="my">
                <header>
                    <span class="glyphicon glyphicon-equalizer"></span>
                    我的微博人气
                </header>



                <div class="mypage">
                    <i style="color:#757eeb;font-size:20px;margin-left:20px;margin-right:20px" class="glyphicon glyphicon-home"></i>
                    <label>我的主页</label>
                    <br />
                    <span style="margin:0 0 0 20px">本周您的主页访问了<b style="color:#ff6a00;font-size:20px">999</b>次</span>

                </div>

                <div style="height:4px; border-radius:0;" class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">

                    </div>
                </div>







            </div>



        </div>
        <div class="right">

            <div class="top-select">

                <ul class="nav nav-pills">
                    <li role="presentation"><a href="#">全部</a></li>
                    <li role="presentation"><a href="#">图片</a></li>
                    <li role="presentation"><a href="#">视频</a></li>
                    <li role="presentation"><a href="#">音乐</a></li>
                    <li role="presentation"><a href="#">原创</a></li>
                </ul>

                <div class="input-group">
                    <input type="text" class="form-control" placeholder="搜索我的微博">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>




            </div>



            <!-- 微博内容部分 -->
            
            <% foreach (var item in WeiboList)
               {
                  %> 
            
            <div class="blog">

                <div class="list">
                    <span class="glyphicon glyphicon-chevron-down dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></span>


                    <ul class="dropdown-menu dropdown-menu-right">
                        <li>删除</li>
                        <li>举报</li>
                    </ul>
                </div>


                <p>
                    <%= Comon.FaceReplace(item.text) %>
                </p>


                <ul class="tu">

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

                <!--  <video class="mp4" controls="controls" src="video/v1.mp4"> </video>  -->

                <footer><%= item.sendtime %> &nbsp;  &nbsp;CC微博</footer>


                <hr />
                <ul class="tools">
                    <li class="line">
                        收藏
                    </li>
                    <li class="line">
                        转发
                    </li>
                    <li class="line">
                         评论(
                                <%= item.remark %>
                                )

                    </li>
                    <li>
                        <span class="glyphicon glyphicon-thumbs-up"></span>(
                                <span class="weibo-nice"><%= item.nice %></span>
                                )
                    </li>
                </ul>


            </div>
            
              <% } %>


            <div class="page">
              <nav>
  <ul style="font-size:20px;padding-top:5px" class="pager">
    <li  class="previous">
      
        <a href="weibo.aspx?page=<%= pre %>">
            <span aria-hidden="true">&larr;</span>上一页

        </a></li>
    <li class="nextt" style="float:right"><a href="weibo.aspx?page=<%= next %>">下一页 <span aria-hidden="true">&rarr;</span></a></li>
  </ul>
</nav>
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
    <script type="text/javascript" src="js/weibo.js"></script>
</body>
</html>
