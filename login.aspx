<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="UI.login" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>CC微博-新鲜事</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login.css">
    <link href="bootstrap/smoothness/jquery.ui.css" rel="stylesheet" />
    <link rel="shortcut icon" href="images/small.ico" />

</head>
<body>
    <div id="bg">
        <div class="logo">
            <img src="images/logo.png" title="CC微博" />
        </div>
        <img class="CC-blog" title="CC微博" src="images/cc-blog.png" />


        <div class="content">

            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div style="cursor:pointer" class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="images/movi_4.png" alt="...">

                    </div>
                    <div class="item">
                        <img src="images/movi_2.png" alt="...">

                    </div>
                    <div class="item">
                        <img src="images/movi_3.png" alt="...">

                    </div>
                    <div class="item">
                        <img src="images/movi_1.png" alt="...">

                    </div>
                </div>

                <!-- Controls -->

            </div>


            <div class="login">

                <!-- Nav tabs -->
                <ul class="select nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#home" aria-controls="home" role="tab" data-toggle="tab">
                            &nbsp;登&nbsp;&nbsp;&nbsp;陆&nbsp;
                        </a>
                    </li>
                    <li role="presentation"><a href="#mail" aria-controls="mail" role="tab" data-toggle="tab">邮箱登陆</a></li>
                    <li role="presentation"><a href="#code" aria-controls="code" role="tab" data-toggle="tab">二维码</a></li>

                </ul>

                <!-- Tab panes -->
                <div class="tab-content">

                    <div role="tabpanel" class="tab-pane active" id="home">

                        <div class="input-group">
                            <span class="input-group-addon" >
                                <i class="glyphicon glyphicon-user"></i>
                            </span>
                            <input id="name" type="text" class="form-control" placeholder="用户名/会员账号/手机号" aria-describedby="sizing-addon2">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" >
                                <i class="glyphicon glyphicon-lock"></i>
                            </span>
                            <input id="name-pwd" type="password" class="form-control" placeholder="请输入密码" aria-describedby="sizing-addon2">
                        </div>

                        <div id="name-alert" class="message alert alert-info  alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <span id="name-span" class="text">
                                
                                PS： 密码区分大小写
                            </span>
                        </div>

                        <div class="form">
                            <div class="checkbox">
                                <label style="color:white;cursor:pointer;float:left;">
                                    <input id="name-checked" style="cursor:pointer" type="checkbox" value="ok"> 记住我
                                </label>
                            </div>

                            <label style="float:right;">
                                <a href="findpass.aspx">
                                    忘记密码
                                </a>

                            </label>

                            <button id="name-login" type="button" class="btn btn-primary">登录</button>

                            <p style="color:white;font-size:12px">
                                还没有微博？
                                <a href="register.aspx">立即注册</a>
                            </p>


                        </div>




                    </div>

                    <div role="tabpanel" class="tab-pane" id="mail">
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2">
                                <i class="glyphicon glyphicon-envelope"></i>
                            </span>
                            <input id="email" type="text" class="form-control" placeholder="您的邮箱" aria-describedby="sizing-addon2">
                        </div>
                        <div class="input-group">
                            <button id="send" style="width:53%;float:left;" type="button" class="btn btn-info">获取邮箱验证码</button>
                            <input id="email-code" style="width:43%;float:right;border-radius:3px;" type="text" class="form-control" placeholder="邮箱验证码" aria-describedby="sizing-addon2">
                        </div>

                        <div id="email-alert" class="message alert alert-info alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <span id="email-span" class="text">
                                PS： 扫描二维码可快速登陆
                            </span>
                        </div>

                        <div class="form">
                            <div class="checkbox">
                                <label style="color:white;cursor:pointer;float:left;">
                                    <input id="email-checked" style="cursor:pointer" type="checkbox" value="ok"> 记住我
                                </label>
                            </div>

                            <label style="float:right;">
                                <a href="findpass.aspx">
                                    忘记密码
                                </a>

                            </label>

                            <button id="email-login" type="button" class="btn btn-primary">登录</button>

                            <p style="color:white;font-size:12px">
                                还没有微博？
                                <a href="register.aspx">立即注册</a>
                            </p>


                        </div>

                    </div>

                    <div role="tabpanel" class="tab-pane" id="code">
                        <div>
                            <img src="images/code.png" />
                        </div>
                        <span style="margin:0 auto 0 auto;color:#ccc;margin-left:20%;font-size:12px">用微博手机版扫描安全登录</span>
                        <p style="color:white;font-size:12px">
                            还没有微博？
                            <a href="register.aspx">立即注册</a>
                        </p>
                    </div>


                </div>

            </div>


        </div>

        <p class="banquan">
            Copyright © 2016 CC WEIBO Power By SpringLee
        </p>




    </div>




    <script src="bootstrap/js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
     <script src="bootstrap/js/jquery.ui.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
</body>
</html>
