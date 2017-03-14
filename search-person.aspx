<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search-person.aspx.cs" Inherits="UI.search_person" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>CC微博-新鲜事</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/search-person.css">
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
      <div class="search-bar">
          <input  id="search-content" type="text" value="<%= words %>" class="search-content form-control">

          <button id="search-button" type="button" class="btn btn-primary">搜索</button>

          <div class="btn-group" data-toggle="buttons">
              <label id="select-weibo" style="width:100px"  class="btn btn-primary">
                  <input   type="radio"  name="options" value="1" >找微博
              </label>
              <label style="width:100px" class="btn btn-primary active">
                  <input type="radio" name="options" value="2" >找人
              </label>
          </div>
      </div>

      <div class="left">
          
          <% foreach (var item in Users)
             {
               %>  
         
          <div class="user">
              <img src="<%= item.face %>" />

              <header>
                  <a href="everybody.aspx?personid=<%= item.id %>">
                      <%= item.nickname %>
                  </a>
                   <%for (int i = 0; i < DateTime.Now.Year - item.time.Year + 1; i++){ %>
                  <span class="glyphicon glyphicon-star-empty"></span>
                  <%} %>
              </header>

              <p>
                  <% if (item.sex == 1) { Response.Write("男"); } else { Response.Write("女"); }%>
                   <%= item.address %>
                  <a href="#">
                      http://weibo.com/336061616 
                  </a>
                  <br />
                  关注391 
                  粉丝151万 
                  微博44639
                  <br />
                  简介： 加QQ 2531837073，请标注到访原因！
                  <br />
                  教育信息： 山东大学



                  
              </p>

              


          </div>

          <%   } %>

          <div   class="page">
               <nav>
  <ul class="pager">
    <li style="margin-right:380px;" ><a href="search-person.aspx?words=<%= Request["words"] %>&page=<%= pre %>"><span aria-hidden="true">&larr;</span>上一页</a></li>
    <li> <a href="search-person.aspx?words=<%= Request["words"] %>&page=<%= next %>">下一页<span aria-hidden="true">&rarr;</span></a></li>
  </ul>
</nav>
          </div>
      </div>

      <div class="right">

          <div id="like-person">
              <header style="text-align: left;height:30px;line-height:30px; text-indent:20px;font-weight:bold; border-bottom: 1px solid #ccc">相关用户</header>


               <div class="detail">
                   <img src="user/user.jpg" />
                   <b>
                       <a href="#">
                           浪子十八
                       </a></b>
                   <p>
                       简介：亲.这个世界不是我想要的可以退货吗？

                   </p>


               </div>
              <div class="detail">
                  <img src="user/user.jpg" />
                  <b>
                      <a href="#">
                          浪子十八
                      </a>
                  </b>
                  <p>
                      简介：亲.这个世界不是我想要的可以退货吗？

                  </p>


              </div>
              <div class="detail">
                  <img src="user/user.jpg" />
                  <b>
                      <a href="#">
                          浪子十八
                      </a>
                  </b>
                  <p>
                      简介：亲.这个世界不是我想要的可以退货吗？

                  </p>


              </div>
              <div class="detail">
                  <img src="user/user.jpg" />
                  <b>
                      <a href="#">
                          浪子十八
                      </a>
                  </b>
                  <p>
                      简介：亲.这个世界不是我想要的可以退货吗？

                  </p>


              </div>


             <footer style="height:30px;line-height:30px; text-align:center;border-top:1px solid #ccc">
                 <a href="#">查看更多></a>
             </footer>
              
          </div>


          <div id="hot">
              <header>
                  实时热搜榜
              </header>

              <ul>
                  <li>
                      <a href="#">11</a>
                      <span>999</span>
                  </li>
                  <li>
                      <a href="#">11</a>
                      <span>999</span>
                  </li>
                  <li>
                      <a href="#">11</a>
                      <span>999</span>
                  </li>
                  <li>
                      <a href="#">11</a>
                      <span>999</span>
                  </li>
                  <li>
                      <a href="#">11</a>
                      <span>999</span>
                  </li>
                  <li>
                      <a href="#">11</a>
                      <span>999</span>
                  </li>
                  
              </ul>



              <footer>
                  <a href="#">
                      查看更多>
                  </a>
              </footer>


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
    <script type="text/javascript" src="js/search-person.js"></script>
</body>
</html>
