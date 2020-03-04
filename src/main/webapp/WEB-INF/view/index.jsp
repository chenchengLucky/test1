<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工考勤系统</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/Static/css/bootstrap.min.css"/>
    <style>
        .col-center-block {
            position: absolute;
            top: 50%;
            transform:  translateY(-50%);
        }
    </style>

</head>
<body style="background-color: #5bc0de">
<div class="col-lg-6 col-lg-offset-3  col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2 Container col-center-block">
<div class="jumbotron" style="background-color: rgba(220,220,220,0.3)">
<h2 class="text-center" style="color:#9c6261">员工考勤系统</h2>
    <br>
<div class="container">
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label  class="col-sm-2 control-label">账号：</label>
            <div class="col-sm-8">
            <input id="username" name="username" class="form-control" type="text" placeholder="请输入账号">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">密码：</label>
            <div class="col-sm-8">
            <input id="passwrod" name="password" class="form-control" type="password" placeholder="请输入密码">
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-2 col-sm-offset-4">
            <div class="checkbox">
                <label>
                    <input id="checkboxid" type="checkbox" value="1">请记住我
                </label>
            </div>
            </div>
            <div class="col-sm-2">
                <button id="submitid" class="btn btn-primary" type="button">登录</button>
            </div>
        </div>

    </form>
</div>
</div>
</div>
</body>
<script src="/Static/js/jquery-3.2.1.min.js"></script>
<script src="/Static/js/bootstrap.min.js"></script>
<script>
  $(document).ready(function () {

      $("#submitid").click(function () {
          var name=$("#username").val();
          var pwd=$("#passwrod").val();
          var check=null;
          if($("#checkboxid").is(':checked')){
              check=1;
          }
          if(name==null||name==""){
              alert("账号不能为空");
          }else {
              if (pwd==null||pwd==""){
                  alert("密码不能为空");
              }else {
                  $.ajax({
                      type:"POST",
                      url:"/index/login",
                      data:JSON.stringify({"username":name,"password":pwd,"checked":check}),
                      dataType:"JSON",
                      contentType:"application/json;charset=UTF-8",
                      success:function (data) {
                          if(data.toString()=="登录成功"){
                              window.location.href="/attend/toattend";
                          }else {
                              alert(data);
                          }
                      }
                  });
              }
          }

      });
  });
</script>
</html>
