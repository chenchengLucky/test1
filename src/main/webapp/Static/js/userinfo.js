$(document).ready(function () {
    $.ajax({
        type:"POST",
        url:"/index/userinfo",
        dataType:"json",
        contentType:"application/json",
        data:{},
        success:function (data) {
            $("#headimg").attr("src",data.headImage);
            $("#chinese").text(data.chineseName);
        }
    })
});