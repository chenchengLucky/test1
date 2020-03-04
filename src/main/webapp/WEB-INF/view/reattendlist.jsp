<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/3
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>待办补签</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/Static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/Static/plugins/datatables/dataTables.bootstrap.css">
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
                <li >
                    <a href="#sys1" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        我的考勤
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="sys1" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="/attend/attendlist"><i class="glyphicon glyphicon-user"></i>打卡记录</a></li>
                        <li><a href="/reattend/tomyreattend"><i class="glyphicon glyphicon-th-list"></i>我的补签</a></li>
                    </ul>
                </li>
                <li class="active">
                    <a href="#sys2" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        考勤管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="sys2" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="#"><i class="glyphicon glyphicon-user"></i>补签记录</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-th-list"></i>待办补签</a></li>

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
            <table id="reattendlist" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>补签人</th>
                    <th>补签日期</th>
                    <th>补签早上</th>
                    <th>补签下午</th>
                    <th>补签理由</th>
                    <th>审批状态</th>
                    <th>操作</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

</body>
<script src="/Static/js/jquery-3.2.1.min.js"></script>
<script src="/Static/js/bootstrap.min.js"></script>
<script src="/Static/js/userinfo.js"></script>
<script src="/Static/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/Static/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
    var table;

    Date.prototype.format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    }

    function pass(data) {
        var REATTEND_STATUS=1;//1为通过
        $.ajax({
            type:"post",
            url:"/reattend/execute",
            data:JSON.stringify({"id":data,"status":REATTEND_STATUS}),
            dataType:"json",
            contentType:"application/json;charset=UTF-8",
            success:function (result) {
                alert(result);
                location.reload(true);
            }
        });
    }

    function unpass(data) {
        var REATTEND_STATUS=2;//2为通过
        $.ajax({
            type:"post",
            url:"/reattend/execute",
            data:JSON.stringify({"id":data,"status":REATTEND_STATUS}),
            dataType:"json",
            contentType:"application/json;charset=UTF-8",
            success:function (result) {
                alert(result);
                location.reload(true);
            }
        });
    }
    $(function () {

        //提示信息
        $.fn.dataTable.ext.errMode = 'none';
        var lang = {
            "sProcessing": "处理中...",
            "sLengthMenu": "每页 _MENU_ 项",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
            "sInfoEmpty": "当前显示第 0 至 0 项，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索:",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页",
                "sJump": "跳转"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        };

        //初始化表格
        table = $("#reattendlist")
            .on('error.dt', function (e, settings, techNote, message) {
                console.warn(message)
            }).dataTable({
                language: lang, //提示信息
                autoWidth: false, //禁用自动调整列宽
                stripeClasses: ["odd", "even"], //为奇偶行加上样式，兼容不支持CSS伪类的场合
                processing: true, //隐藏加载提示,自行处理
                serverSide: true, //启用服务器端分页
                searching: false, //禁用原生搜索
                orderMulti: false, //启用多列排序
                ordering:false, //取消默认排序查询,否则复选框一列会出现小箭头
                renderer: "bootstrap", //渲染样式：Bootstrap和jquery-ui
                pagingType: "simple_numbers", //分页样式：simple,simple_numbers,full,full_numbers
                columnDefs: [{
                    "targets": 'nosort', //列的样式名
                    "orderable": false //包含上样式名‘nosort'的禁止排序
                }],
                ajax: function (data, callback, settings) {
                    //封装请求参数
                    var Status=0;
                    var pageSize = data.length;//页面显示记录条数，在页面显示每页显示多少项的时候
                    var startRow = data.start;//开始的记录序号
                    var currentPage = (data.start / data.length) + 1;//当前页码
                    //console.log(param);
                    //ajax请求数据
                    $.ajax({
                        type: "post",
                        url: "/reattend/reattendajax",
                        cache: false, //禁用缓存
                        data: JSON.stringify({"Status":Status,"pageSize":pageSize,"startRow":startRow,"currentPage":currentPage}), //传入组装的参数
                        dataType: "json",
                        contentType:"application/json;charset=UTF-8",
                        success: function (result) {
                            console.log(result);
                            //console.log(result);
                            //setTimeout仅为测试延迟效果
                            //封装返回数据
                            var returnData = {};
                            returnData.draw = data.startRow;//这里直接自行返回了draw计数器,应该由后台返回
                            returnData.recordsTotal = result.totalRows;//返回数据全部记录
                            returnData.recordsFiltered = result.totalRows;//后台不实现过滤功能，每次查询均视作全部结果
                            returnData.data = result.items;//返回的数据列表
                            //此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕
                            callback(returnData);
                        }
                    });
                },
                //列表表头字段
                columns: [
                    {   "data": "reattendChinesename",
                    },
                    {
                        "data": "attendDate",
                        render: function (data, type, full) {
                            return new Date(data).format("yyyy-MM-dd");
                        }
                    },
                    {
                        "data": "reattendMorning",
                        render: function (data, type, full) {
                            if(data!=null){
                                return new Date(data).format("hh:mm:ss");
                            }else{
                                return "";
                            }
                        }
                    },
                    {
                        "data": "reattendEvening",
                        render: function (data, type, full) {
                            if(data!=null){
                                return new Date(data).format("hh:mm:ss");
                            }else{
                                return "";
                            }
                        }
                    },
                    {
                        "data": "reason"
                    },
                    {
                        "data": "status",
                        render: function (data, type, full) {
                            if(data==0){
                                return "<span style='color: deepskyblue'>未审批</span>";
                            }
                        }
                    }
                    ,
                    {
                        "data": "id",
                        render: function (data, type, full) {
                            return  '<button type="button" class="btn btn-success"  onclick="return pass('+data+')" >通过</button>&nbsp;<button type="button" class="btn btn-danger"  onclick="return unpass('+data+')" >不通过</button>'

                        }
                    }
                ]
            })
            .api();
        //此处需调用api()方法,否则返回的是JQuery对象而不是DataTables的API对象
    });
</script>
</html>
