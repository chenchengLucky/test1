
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的补签</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/Static/css/bootstrap.min.css"/>
</head>
<style>
    #main-nav {
        margin-left: 1px;
    }
    #main-nav.nav-tabs.nav-stacked > li > a {
        padding: 10px 8px;
        font-size: 12px;
        font-weight: 600;
        color: #4A515B;
        background: #E9E9E9;
        background: -moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FAFAFA), color-stop(100%,#E9E9E9));
        background: -webkit-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
        background: -o-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
        background: -ms-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
        background: linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
        -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
        border: 1px solid #D5D5D5;
        border-radius: 4px;
    }
    #main-nav.nav-tabs.nav-stacked > li > a > span {
        color: #4A515B;
    }
    #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover {
        color: #FFF;
        background: #3C4049;
        background: -moz-linear-gradient(top, #4A515B 0%, #3C4049 100%);
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#4A515B), color-stop(100%,#3C4049));
        background: -webkit-linear-gradient(top, #4A515B 0%,#3C4049 100%);
        background: -o-linear-gradient(top, #4A515B 0%,#3C4049 100%);
        background: -ms-linear-gradient(top, #4A515B 0%,#3C4049 100%);
        background: linear-gradient(top, #4A515B 0%,#3C4049 100%);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049');
        -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049')";
        border-color: #2B2E33;
    }
    #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover > span {
        color: #FFF;
    }
    #main-nav.nav-tabs.nav-stacked > li {
        margin-bottom: 4px;
    }
    /*定义二级菜单样式*/
    .secondmenu a {
        font-size: 10px;
        color: #4A515B;
        text-align: center;
    }
    .navbar-static-top {
        background-color: #212121;
        margin-bottom: 5px;
    }

</style>

<body>
<nav class="navbar navbar-default" role="navigation" style="background-color:#46b8da;margin-bottom: 0px">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">考勤系统</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><img id="headimg" class="img-circle" src="/Static/image/20130428162175977597.jpg" width="33px" height="33px"><small id="chinese" style="color: green">&nbsp;&nbsp;姓名</small></a> </li>
            <li><a href="/index/logout"><span class="glyphicon glyphicon-log-out"></span>退出系统</a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 col-xs-2" style="height: 100%;background-color:#46b8da">
            <ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
                <li>
                    <a href="/attend/toattend">
                        <i class="glyphicon glyphicon-th-large"></i>
                        首页
                    </a>
                </li>
                <li class="active">
                    <a href="#sys1" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        我的考勤
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="sys1" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="/attend/attendlist"><i class="glyphicon glyphicon-user"></i>打卡记录</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-th-list"></i>我的补签</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#sys2" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        考勤管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="sys2" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="#"><i class="glyphicon glyphicon-user"></i>补签记录</a></li>
                        <li><a href="/reattend/toreattendlist"><i class="glyphicon glyphicon-th-list"></i>待办补签</a></li>

                    </ul>
                </li>
                <li>
                    <a href="#sys3" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        用户管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="sys3" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="#"><i class="glyphicon glyphicon-user"></i>修改密码</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-th-list"></i>修改信息</a></li>
                    </ul>
                </li>


                <li>
                    <a href="/attend/about">
                        <i class="glyphicon glyphicon-fire"></i>
                        关于我
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10 col-xs-10">
            <table class="table table-bordered table-hover">
                <caption>我的补签</caption>
                <thead>
                <tr>
                    <th>补签日期</th>
                    <th>补签早上时间</th>
                    <th>补签下午时间</th>
                    <th>审批状态</th>
                    <th>审批人</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${reattendList}" var="list">
                <tr>
                    <td>${list.stringdate}</td>
                    <td>${list.stringmorning}</td>
                    <td>${list.stringevening}</td>
                    <c:if test="${list.status==0}">
                        <td style="color: #00acd6">未审批</td>
                    </c:if>
                    <c:if test="${list.status==1}">
                        <td style="color: #00a65a">审批通过</td>
                    </c:if>
                    <c:if test="${list.status==2}">
                        <td style="color: #c12e2a">审批不通过</td>
                    </c:if>
                    <td>${list.handler}</td>
                </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
<script src="/Static/js/jquery-3.2.1.min.js"></script>
<script src="/Static/js/bootstrap.min.js"></script>
<script src="/Static/js/userinfo.js"></script>
</html>