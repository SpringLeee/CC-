<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="findpass.aspx.cs" Inherits="UI.findpass" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>CC微博-新鲜事</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/findpass.css">
    <link href="bootstrap/smoothness/jquery.ui.css" rel="stylesheet" />
    <link rel="shortcut icon" href="images/small.ico" />

</head>
<body>
    <div id="bg">



        <p class="banquan">
            Copyright © 2009-2015 WEIBO 北京微梦CC网络技术有限公司
        </p>

        <img class="logo" src="images/cc-weibo.png" />

        <div class="content">

            <h2>
                <span style="color:#808080" class="glyphicon glyphicon-lock"></span>
               用户密码找回
            </h2>
            <hr />
            <div class="left">

                <div class="biaodan">
                    <label style="float:left;">
                        <b>*</b>
                        您的邮箱：
                    </label>
                    <input id="email" style="margin-left:50px"  type="text" class="form-control"  placeholder="请输入您的邮箱">
                    <div id="email-message" class="message">
                        <i style="display:none" class="glyphicon glyphicon-info-sign"></i>
                        <label style="display:none">
                            请输入您的常用邮箱
                        </label>

                    </div>


                </div>

                <div class="biaodan">
                    <label style="float:left;">
                        <b>*</b>
                        邮箱激活码
                    </label>
                    <button id="send" style="float:left;margin-left:50px;width:124px" type="button" class="btn btn-info">获取邮箱验证码</button>
                    <input id="emailcode" type="text" style="width:105px;margin-left:10px" class="form-control">
                    <div id="emailcode-message" class="message">
                        <i style="display:none;" class="glyphicon glyphicon-info-sign"></i>
                        <label style="display:none;">
                            请输入邮箱验证码
                        </label>

                    </div>


                </div>

                <div class="biaodan">
                    <label style="float:left;">
                        <b>*</b>
                        新密码：
                    </label>
                    <input id="pwd1" style="margin-left:63px" type="password" class="form-control" placeholder="请输入您的密码">
                    <div id="pwd1-message" class="message">
                        <i class="glyphicon glyphicon-info-sign"></i>
                        <label>
                            6-10位，不带标点符号
                        </label>

                    </div>


                </div>

                <div class="biaodan">
                    <label style="float:left;">
                        <b>*</b>
                        再次输入密码：
                    </label>
                    <input id="pwd2" type="password" class="form-control" placeholder="密码">
                    <div id="pwd2-message" class="message">
                        <i class="glyphicon glyphicon-info-sign"></i>
                        <label>
                            字母区分大小写
                        </label>

                    </div>


                </div>

               


                <button id="submit" type="button" class="submit btn btn-primary">确认重置密码</button>

                <ul class="rule">
                    <li>
                        <a href="http://weibo.com/signup/v5/protocol">
                            微博服务使用协议
                        </a>
                    </li>
                    <li>
                        <a href="http://weibo.com/signup/v5/privacy">
                            微博个人信息保护政策
                        </a>
                    </li>
                    <li>
                        <a href="http://news.sina.com.cn/c/2012-12-29/051425921660.shtml">
                            全国人大常委会关于加强网络信息保护的决定
                        </a>
                    </li>
                </ul>
                

            </div>
            <div class="right">

                <span>
                    已经找回，
                    <a href="login.aspx">
                        返回主页>
                    </a>
                </span>
                <hr />

                <header>
                    <i style="color:#ff6a00" class="glyphicon glyphicon-question-sign"></i>
                    &nbsp; 微博注册帮助

                </header>
                <ul>
                    <li>
                        <i style="color:#ff6a00" class="glyphicon glyphicon-record"></i>
                        <a href="http://help.weibo.com/faq/q/76/15955#15955">
                            微博密码注意事项
                        </a>
                    </li>
                    <li>
                        <i style="color:#ff6a00" class="glyphicon glyphicon-record"></i>
                        <a href="http://help.weibo.com/faq/q/200/13091#13091">
                            找回密码时提示"你所使用的IP地址异常",该怎么办？
                        </a>
                    </li>
                    <li>
                        <i style="color:#ff6a00" class="glyphicon glyphicon-record"></i>
                        <a href="http://help.weibo.com/faq/q/200/276#276">
                            企业用户希望怎么找回密码呢？
                        </a>
                    </li>
                    <li>
                        <i style="color:#ff6a00" class="glyphicon glyphicon-record"></i>
                        <a href="http://help.weibo.com/faq/q/200/13043#13043">
                           找回密码后，是不是就能直接登陆呢？
                        </a>
                    </li>
                    

                </ul>


                <footer>
                    <a href="#">
                        更多帮助»
                    </a>
                </footer>
            </div>





        </div>

    </div>

    <div id="myModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CC微博</h4>
      </div>
      <div class="modal-body">
        <p style="color:#808080;letter-spacing:2px">
            <b >
                  恭喜您，您的密码已重置成功，现在即可进行登陆！
                </b>
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">留在此页</button>
        <a id="login"  href="login.aspx" class="btn btn-primary">立即登陆</a>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


    <script src="bootstrap/js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
     <script src="bootstrap/js/jquery.ui.js"></script>
    <script type="text/javascript" src="js/findpass.js"></script>
</body>
</html>
