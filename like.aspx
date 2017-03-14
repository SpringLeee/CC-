<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="like.aspx.cs" Inherits="UI.like" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>CC微博-新鲜事</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/like.css">
    <link rel="shortcut icon" href="images/small.ico" />
    <script src="bootstrap/js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="js/like.js"></script>


    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />




</head>
<body>
    <div id="bg">
        <div class="topbg"></div>

        <p class="banquan">
            <input type="hidden" id="id" value="<%= id %>" />
            Copyright © 2009-2015 WEIBO 北京微梦CC网络技术有限公司
        </p>



        <div class="content">
            <h2>选择兴趣(<span style="color: rgba(0, 0, 0, 0.83); font-weight: normal;">直接拖拉即可)</span></h2>

            <div id="move">
                <header>兴趣列表</header>
                <hr />
                <ul id="moveul">
                    <li id="l1">
                        <img src="images/like_1.jpg" />

                    </li>
                    <li id="l2">
                        <img src="images/like_2.jpg" />

                    </li>
                    <li id="l3">
                        <img src="images/like_3.jpg" alt="Alternate Text" />

                    </li>
                    <li id="l4">
                        <img src="images/like_4.jpg" alt="Alternate Text" />

                    </li>
                    <li id="l5">
                        <img src="images/like_5.jpg" alt="Alternate Text" />

                    </li>
                    <li id="l6">
                        <img src="images/like_6.jpg" alt="Alternate Text" />

                    </li>
                    <li id="l7">
                        <img src="images/like_7.jpg" alt="Alternate Text" />

                    </li>
                    <li id="l8">
                        <img src="images/like_8.jpg" alt="Alternate Text" />

                    </li>
                    <li id="l9">
                        <img src="images/like_9.jpg" alt="Alternate Text" />
                    </li>
                    <li id="l10">
                        <img src="images/like_10.jpg" alt="Alternate Text" />

                    </li>
                    <li id="l11">
                        <img src="images/like_11.jpg" alt="Alternate Text" />

                    </li>
                    <li id="l12">
                        <img src="images/like_12.jpg" alt="Alternate Text" />

                    </li>

                </ul>




            </div>
            <div id="to">
                <header>已添加兴趣</header>
                <hr />
                <ul id="toul"></ul>

            </div>


            <button id="submit" type="button" class="btn btn-primary">
                <span class="glyphicon glyphicon-play-circle"></span>
                <label>开启微博之旅</label>
            </button>


        </div>





    </div>





</body>
</html>
