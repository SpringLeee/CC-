<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="UI.info" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>CC微博-新鲜事</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/info.css">
    <link rel="shortcut icon" href="images/small.ico" />
    <script src="bootstrap/js/jquery.js"></script>
     <script src="/avatar/avatar.js"></script>

    

   

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
            <img id="userface" src="<%= u.face %>" title="<%= u.nickname %>" />
            <h2><%= u.nickname %></h2>
            <input type="hidden" id="id" value="<%= id %>" />

            <% for (int i = 0; i < DateTime.Now.Year-u.time.Year+1; i++)
               {
              %>
                   <span class="glyphicon glyphicon-star-empty"></span>

              <% } %>
            
          
            <% if (u.myself=="0")
                       {
                           u.myself = "暂无！";
                       }
                       
                      %>
            <footer><%= u.myself %></footer>
        </div>



        <div class="left">
            <div class="fans">
                <ul>
                    <li style="border-right:1px solid #ccc">
                        <a href="#">
                            <label>
                                <% BLL.FansService fs = new BLL.FansService();

                                   Response.Write(fs.QueryGzCount(u.id)); %>

                            </label>
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
                            <label><% BLL.WeiboService ws = new BLL.WeiboService();
                                      Response.Write(ws.QueryCount(u.id)); %></label>
                            <span>微博</span>
                        </a>

                    </li>

                </ul>
            </div>

            <div class="data">
                <header>
                    <span class="glyphicon glyphicon-qrcode"></span>
                    二维码
                </header>
                <footer>
                    <img src="images/footer_code.jpg" />

                    <span style="font-size:12px;color:#808080;line-height:40px">扫描二维码，可以用手机访问本页</span>
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

            <div id="info">

                <div class="basic">
                    <header>
                        <b style="">基本信息</b>


                        <button id="basic-button" style="float:right;margin:4px 5px 0 0;height:30px;line-height:18px" type="button" class="btn btn-primary">编辑</button>
                    </header>

                    <table id="basic-ok" class="table table-hover">
                        <tr>
                            <td width="120">登录名</td>                            
                            <td><%= Comon.MMstring(u.email) %><a href="#">修改密码</a></td>

                        </tr>
                        <tr>
                            <td>昵  称</td>
                            <td><%= u.nickname %></td>

                        </tr>
                        <tr>
                            <td>真实姓名</td>
                           
                            <td><%= u.name %></td>

                        </tr>
                       
                        <tr>
                            <td>性 别</td>
                            <%
                                string truesex = string.Empty;
                                if (u.sex == 1)
                                {
                                    truesex = "男";
                                }
                                else {
                                    truesex = "女";
                                }
                                
                                 %>

                            <td><%= truesex %></td>

                        </tr>

                        <tr>
                            <td>性取向</td>
                            <td><%= u.gay %></td>

                        </tr>
                        <tr>
                            <td>感情状况</td>
                            <td>
                                <%= u.love %>
                            </td>

                        </tr>
                        <tr>
                            <td>生日</td>
                            <td><%= u.birthday.ToShortDateString() %></td>

                        </tr>
                        <tr>
                            <td>血型</td>
                            <td>
                                <%= u.blood %>
                            </td>

                        </tr>
                        <tr>
                            <td>博客地址</td>
                            <td>
                                <%= u.blog %>
                            </td>

                        </tr>
                        <tr>
                            <td>个性域名</td>
                            <td>
                                <a href="everybody.aspx?personid=<%= u.id %>">
                                    http://everybody.aspx?personid=<%= u.id %>
                                </a>
                            </td>

                        </tr>
                        <tr>
                            <td>简介</td>
                            <td><%=u.myself %></td>

                        </tr>
                        <tr>
                            <td>注册时间</td>
                            <td><%= u.time.ToShortDateString() %></td>

                        </tr>


                    </table>


                    <table id="basic-edit" class="table table-hover">
                        <tr>
                            <td width="120">登录名</td>
                            <td width="240"><%= Comon.MMstring(u.email) %> <a href="#">修改密码</a></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>昵  称</td>
                            <td>

                                <input id="input-nickname" type="text" class="form-control" value="<%= u.nickname %>">
                            </td>
                            <td>
                                <div class="alert alert-danger" role="alert">
                                    用户名已经存在

                                </div>

                            </td>


                        </tr>
                        <tr>
                            <td>真实姓名</td>
                            <td>
                                <input id="input-name" type="text" class="form-control" value="<%= u.name %>">
                            </td>
                            <td>
                                <div class="alert alert-danger" role="alert">
                                    用户名已经存在

                                </div>

                            </td>

                        </tr>
                        
                        <tr>
                            <td>性 别</td>
                            <td>
                                <div class="btn-group" data-toggle="buttons">
                                    <%
                                        if (u.sex == 1)
                                        {  %>

                                     <label id="option1" class="btn btn-primary active">                                      
                                        <input  type="radio" name="options"  checked>男
                                    </label>
                                    <label id="option2" class="btn btn-primary">
                                        <input type="radio" name="options" >女
                                    </label>

                                        <%}else { %>
                                        
                                       <label id="option1" class="btn btn-primary ">                                      
                                        <input  type="radio" name="options"   >男
                                    </label>
                                    <label  id="option2" class="btn btn-primary  active">
                                        <input type="radio" name="options" checked>女
                                    </label>
                                            
                                       <% } %>
                                   
                                   
                                </div>

                            </td>
                            <td>
                                <div class="alert alert-danger" role="alert">
                                    用户名已经存在

                                </div>

                            </td>
                        </tr>

                        <tr>
                            <td>性取向</td>
                            <td>
                                <div class="btn-group" data-toggle="buttons">
                                   
                                    <% if (u.gay=="男")
                                       {%>
                                    <label id="gay1" class="btn btn-primary active"><input  type="checkbox">男</label>
                                    <label id="gay2" class="btn btn-primary"> <input type="checkbox">女</label>
                                      <% }
                                       if (u.gay=="女")
                                       {%>
                                     <label id="gay1" class="btn btn-primary"><input  type="checkbox">男</label>
                                    <label id="gay2" class="btn btn-primary  active"> <input type="checkbox">女</label>
                                       <%}
                                       if (u.gay != "男"&&u.gay!="女")
                                       {%>

                                     <label id="gay1" class="btn btn-primary active"><input  type="checkbox">男</label>
                                    <label id="gay2" class="btn btn-primary  active"> <input type="checkbox">女</label>

                                      <% } %>

                                    
                                </div>
                               
                            </td>
                            <td>
                                <div style="display:block" class="alert alert-success" role="alert">
                                    性取向可以双选哦！

                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td>感情状况</td>
                            <td>
                                <select id="input-love" class="form-control">

                                    <option <%if (u.love == "单身")   { Response.Write("selected"); } %> value="单身">单身</option>
                                    <option <%if (u.love == "求交往") { Response.Write("selected"); } %> value="求交往">求交往</option>
                                    <option <%if (u.love == "暗恋中") { Response.Write("selected"); } %>  value="暗恋中">暗恋中</option>
                                    <option <%if (u.love == "暧昧中") { Response.Write("selected"); } %> value="暧昧中">暧昧中</option>
                                    <option <%if (u.love == "恋爱中") { Response.Write("selected"); } %> value="恋爱中">恋爱中</option>
                                    <option <%if (u.love == "已婚")   { Response.Write("selected"); } %> value="订婚">订婚</option>
                                    <option <%if (u.love == "已婚")   { Response.Write("selected"); } %> value="已婚">已婚</option>
                                    <option <%if (u.love == "分居")   { Response.Write("selected"); } %> value="分居">分居</option>
                                    <option <%if (u.love == "离异")   { Response.Write("selected"); } %> value="离异">离异</option>
                                    <option <%if (u.love == "丧偶")   { Response.Write("selected"); } %> value="丧偶">丧偶</option>
                                   
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>生日</td>
                            <td>
                                <input id="birthday" type="date" class="form-control" value="<%= u.birthday.ToString("yyyy-MM-dd") %>" >

                            </td>
                            <td>
                                <div class="alert alert-danger" role="alert">
                                    您这生日有点怪啊！

                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td>血型</td>
                            <td>
                                <select id="xuexing" class="form-control">
                                    <option <% if (u.blood == "A型") { Response.Write("selected "); } %> value="A型">A型</option>
                                    <option <% if (u.blood == "B型") { Response.Write("selected "); } %>  value="B型">B型</option>
                                    <option <% if (u.blood == "AB型") { Response.Write("selected "); } %>  value="AB型">AB型</option>
                                    <option <% if (u.blood == "O型") { Response.Write("selected "); } %>  value="O型">O型</option>                                 

                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>博客地址</td>
                            <td>
                                <input id="input-blog" type="text" class="form-control" value="<%= u.blog %>">
                            </td>
                            <td>
                                <div style="display:block" class="alert alert-success" role="alert">
                                    例如:www.cc.com

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>个性域名</td>
                            <td>
                                <a href="#">
                                    http://weibo.com/lishuai86868
                                </a>
                            </td>
                            <td>
                               

                            </td>
                        </tr>
                        <tr>
                            <td>简介</td>
                            <td>
                                <input id="input-myself" type="text" class="form-control" value="<%= u.myself %>">
                            </td>
                            <td>
                                <div class="alert alert-success" role="alert">
                                   简介：5-20个字

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>注册时间</td>
                            <td>2010-10-12</td>
                            <td></td>
                        </tr>


                    </table>


                </div>
                <div class="call">
                    <header>
                        <b style="">其它信息</b>


                        <button id="call-button" style="float:right;margin:4px 5px 0 0;height:30px;line-height:18px" type="button" class="btn btn-primary">编辑</button>
                    </header>

                    <table id="call-ok" class="table table-hover">
                        <tr>
                            <td width="120">邮箱</td>
                            <td><%= Comon.MMstring(u.email) %></td>

                        </tr>
                        <tr>
                            <td>QQ</td>
                            <td><%= u.qq %></td>
                        </tr>
                        <tr>
                            <td>MSN</td>
                            <td>
                                <%= u.msn %>
                        </tr>
                    </table>

                    <table id="call-edit" class="table table-hover">
                        <tr>
                            <td width="120">邮箱</td>
                            <td>

                                <input id="input-email" type="text" class="form-control" value="<%= u.email %>">
                            </td>
                            <td>
                                <div  class="alert alert-danger" role="alert">
                                    用户名已经存在

                                </div>

                            </td>

                        </tr>
                        <tr>
                            <td>QQ</td>
                            <td><input id="input-qq" type="text" class="form-control" value="<%= u.qq %>"></td>
                            <td>
                                <div  class="alert alert-danger" role="alert">
                                    请使用您的个人QQ

                                </div>

                            </td>
                        </tr>

                        <tr>
                            <td>MSN</td>
                            <td><input id="input-msn" type="text" class="form-control" value="<%= u.msn %>"></td>
                            <td></td>

                        </tr>
                    </table>

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

    <div id="modal-face" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CCBlog - 选择头像</h4>
      </div>
      <div class="modal-body">
       <div id="avatarContainer">
       
    </div>
    <script type="text/javascript">
        swfobject.addDomLoadEvent(function () {
            var swf = new AvatarEditor("avatarContainer", { id: 'swf', upload_url: '/ajax/avatar.ashx?action=upload', src_upload: 2 }, function (res) {
                switch (res.code) {
                    case 1:
                        // 头像编辑器组件初始化完成
                        //alert("页面成功加载了组件！");
                        break;
                    case 2:
                        // 图片加载完成
                        //alert("已成功加载默认指定的图片到编辑面板。");
                        break;
                    case 3:
                        // 摄像头启动事件
                        if (res.type == 0) {
                            //alert("摄像头已准备就绪且用户已允许使用。");
                        }
                        else if (res.type == 1) {
                           // alert("摄像头已准备就绪但用户未允许使用！");
                        }
                        else {
                            //alert("摄像头被占用！");
                        }
                        break;
                    case 5:
                        // 上传完成
                        if (res.type == 0) {
                            if (res.content.sourceUrl) {
                                alert("原图已成功保存至服务器，url为：\n" + res.content.sourceUrl);
                            }
                            
                            var url = res.content.avatarUrls.toString();
                           

                            $.ajax({
                                url: "/Ajax/info.ashx?action=setface",
                                type: "post",
                                data: {
                                    data: url,
                                    id:$("#id").val()
                                }
                               
                            });

                           // alert("头像已成功保存至服务器，url为：\n" + res.content.avatarUrls.join("\n"));
                            $("#modal-face").modal("hide");
                            $("#userface").attr("src", url);

                        }
                        break;
                }
            });
            document.getElementById("upload").onclick = function () {
                swf.call("upload");
            };
        });
    </script>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
     
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


    
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/js.js"></script>
    <script type="text/javascript" src="js/info.js"></script>
   
    

</body>
</html>
