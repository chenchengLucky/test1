
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考勤记录</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/Static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/Static/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/Static/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="/Static/plugins/datetimepicker/bootstrap-datetimepicker.min.css">
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

</head>
<body>
<nav class="navbar navbar-default" role="navigation" style="background-color:#46b8da;margin-bottom: 0px">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">考勤系统</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><img id="headimg" class="img-circle" src="/Static/image/20130428162175977597.jpg" width="33px" height="33px"><small id="chinese" style="color: white">&nbsp;&nbsp;姓名</small></a> </li>
            <li><a href="/index/logout"><span class="glyphicon glyphicon-log-out"></span>退出系统</a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 col-xs-2" style="height:120%;background-color:#46b8da">
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
                        <li ><a href="#"><i class="glyphicon glyphicon-user"></i>打卡记录</a></li>
                        <li><a href="/reattend/tomyreattend"><i class="glyphicon glyphicon-th-list"></i>我的补签</a></li>
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
            <div class="box">
                <div class="box-search">
                    <form onSubmit="return false;" id="attendQueryForm">
                        <div class="form-inline">
                            <label>日期范围:</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-left" id="rangeDate" name="rangeDate">
                            </div>
                            <label>状态</label>
                            <select class="form-control" name="attendStatus" id="attendStatus">
                                <option value="">全部</option>
                                <option value="1">正常</option>
                                <option value="2">异常</option>
                            </select>
                            <button type="submit" class="btn btn-primary" onclick="attendQuery()">查询</button>
                        </div>
                    </form>
                </div>
                <!-- /.box-header -->
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="attend_grid" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>考勤日期</th>
                            <th>星期</th>
                            <th>早打卡</th>
                            <th>晚打卡</th>
                            <th>缺勤时长</th>
                            <th>考勤状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
        </div>

            <div class="modal fade" id="reAttendModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                补签信息
                            </h4>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="attendid" value="">
                            <input type="hidden" id="attenddate" value="">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">补签早上时间</label>
                                    <div class="col-sm-9">
                                        <div class="input-append date" id="remorning" data-date="" data-date-format="hh:ii:ss">
                                            <input type="text" id="remorningdate" value="" readonly placeholder="补签早上时间">
                                            <span class="add-on"><i class="icon-th"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">补签下午时间</label>
                                    <div class="col-sm-9">
                                        <div class="input-append date" id="reevening" data-date="" data-date-format="hh:ii:ss">
                                            <input type="text" id="reeveningdate" value="" placeholder="补签下午时间">
                                            <span class="add-on"><i class="icon-th"></i></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">补签理由</label>
                                    <div class="col-sm-9">
                                <textarea  class="form-control"  name="reason" value="" id="reason"
                                           placeholder="补签理由">
                                </textarea>
                                    </div>
                                </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button id="reattendbtn" class="btn btn-primary">
                                提交
                            </button><span id="tip"> </span>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
    </div>
</div>

</body>
<script src="/Static/js/jquery-3.2.1.min.js"></script>
<script src="/Static/js/bootstrap.min.js"></script>
<script src="/Static/js/userinfo.js"></script>
<script src="/Static/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/Static/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="/Static/plugins/daterangepicker/moment.min.js"></script>
<script src="/Static/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/Static/plugins/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="/Static/plugins/datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>

<script>

    $('#rangeDate').daterangepicker(
        {
            locale: {
                applyLabel: '确定',
                cancelLabel: '取消',
                fromLabel: '起始时间',
                toLabel: '结束时间',
                customRangeLabel: '自定义',
                daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                    '七月', '八月', '九月', '十月', '十一月', '十二月'],
                firstDay: 1,
                format:"YYYY-MM-DD",
                separator:"/",
            },

            ranges: {
                '今天': [moment()],
                '昨天': [moment().subtract(1, 'days')],
                '最近七天': [moment().subtract(6, 'days'), moment()],
                '最近30天': [moment().subtract(29, 'days'), moment()],
                '本月': [moment().startOf('month'), moment().endOf('month')],
                '上月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            startDate: moment().startOf('month'),
            endDate: moment().endOf('month')
        }
    );

    function reAttend(rtid,rtdate) {
        $("#attendid").val(rtid);
        $("#attenddate").val(rtdate);
        $("#reAttendModal").modal('show');
    }

    $("#remorning").datetimepicker({
        format:'hh:ii:ss',
        startView:'day',
        maxView:'day',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        forceParse: 0,
        showMeridian: 1,
        language: 'zh-CN'
    });

    $("#reevening").datetimepicker({
        format:'hh:ii:ss',
        startView:'day',
        maxView:'day',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        forceParse: 0,
        showMeridian: 1,
        language: 'zh-CN'
    });

    $("#reattendbtn").click(function () {
        var rtid=$("#attendid").val();
        var rtdate=$("#attenddate").val();
        var rtmorn=$("#remorningdate").val();
        var rteven=$("#reeveningdate").val();
        var rtreason=$("#reason").val();
        $.ajax({
            type:"POST",
            url:"/reattend/addreattend",
            data:JSON.stringify({"attendId":rtid,"attendDate":rtdate,"stringmorning":rtmorn,"stringevening":rteven,"reason":rtreason}),
            dataTypes:"JSON",
            contentType:"application/json;charset=UTF-8",
            success:function (data) {
                alert(data);
                $("#reason").val("");
                $("#remorningdate").val("");
                $("#reeveningdate").val("");
                $("#reAttendModal").modal('hide');

            }
        })
    });


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

    function formToJson(form) {
        var result = {};
        var fieldArray = $('#' + form).serializeArray();
        for (var i = 0; i < fieldArray.length; i++) {
            var field = fieldArray[i];
            if (field.name in result) {
                result[field.name] += ',' + field.value;
            } else {
                result[field.name] = field.value;
            }
        }
        return result;
    }

    var week_CN = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]

    var table;

    function attendQuery() {
        table.ajax.reload();
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
        table = $("#attend_grid")
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
                    var param = formToJson("attendQueryForm");
                    param.pageSize = data.length;//页面显示记录条数，在页面显示每页显示多少项的时候
                    param.startRow = data.start;//开始的记录序号
                    param.currentPage = (data.start / data.length) + 1;//当前页码
                    //console.log(param);
                    //ajax请求数据
                    $.ajax({
                        type: "post",
                        url: "/attend/attendlistajax",
                        cache: false, //禁用缓存
                        data: JSON.stringify(param), //传入组装的参数
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
                    {   "data": "seq",
                        render: function (data, type, full,row_col) {
                            return row_col.row;
                        }
                    },
                    {
                        "data": "attendDate",
                        render: function (data, type, full) {
                            return new Date(data).format("yyyy-MM-dd");
                        }
                    },
                    {
                        "data": "attendWeek",
                        render: function (data, type, full) {
                            return week_CN[data - 1];
                        }
                    },
                    {
                        "data": "attendMorming",
                        render: function (data, type, full) {
                            if(data!=null){
                                return new Date(data).format("hh:mm:ss");
                            }else{
                                return "";
                            }
                        }
                    },
                    {
                        "data": "attendEvening",
                        render: function (data, type, full) {
                            if(data!=null){
                                return new Date(data).format("hh:mm:ss");
                            }else{
                                return "";
                            }
                        }
                    },
                    {
                        "data": "absence"
                    },
                    {
                        "data": "attendStatus",
                        render: function (data, type, full) {
                            if(data==1){
                                return "<span style='color: green'>正常</span>";
                            }else{
                                return "<span style='color: red'>异常</span>";
                            }
                        }
                    }
                    ,
                    {
                        "data": "id",
                        render: function (data, type, full) {
                            if(full.attendStatus==2){
                                return  '<button type="button" class="btn btn-info"  onclick="return reAttend('+data+','+full.attendDate+')" >补签</button>'
                            }else {
                                return "";
                            }

                        }
                    }
                ]
            })
            .api();
        //此处需调用api()方法,否则返回的是JQuery对象而不是DataTables的API对象
    });

</script>
</html>
