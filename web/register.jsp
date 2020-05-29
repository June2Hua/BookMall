<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JuneHua购书网</title>
    <!-- 引入css样式 -->
    <link rel="stylesheet" type="text/css" href="./css/my.css">
</head>

<body>
<div id="top">
    <div style="float:left" class="m-margin-small">
        <p class="m-font-middle" style="color:white">欢迎来到JuneHua图书购物商城</p>
    </div>
    <div style="float:right" class="m-margin-small">
        <a class="m-font-middle"  href="#">购物车</a>
    </div>
    <div style="float:right" class="m-margin-small">
        <a class="m-font-middle"  href="./register.jsp" target="_blank">注册</a>
    </div>
    <div style="float:right" class="m-margin-small">
        <a class="m-font-middle" href="./login.jsp" target="_blank">登录</a>
    </div>
</div>
<!-- 使用div容器嵌套 -->
<div id="container" style="text-align:center">
    <br>
    <br><br>
    <form method="post" action="/company/register">
        <h3 class="m-margin-middle">请输入注册信息</h3>
        账&nbsp&nbsp&nbsp&nbsp户：<input id="id" name="id" style="width:200px"  class="m-margin-small"  placeholder="请输入账户"><br>
        姓&nbsp&nbsp&nbsp&nbsp名：<input id="name" name="name" style="width:200px"  class="m-margin-small"  placeholder="请输入姓名"><br>
        密&nbsp&nbsp&nbsp&nbsp码：<input id="psw" name="psw" type="password" style="width:200px"  class="m-margin-small"  placeholder="请输入密码"><br>
        年&nbsp&nbsp&nbsp&nbsp龄：<input id="age" name="age" style="width:200px"  class="m-margin-small"  placeholder="请输入年龄"><br>
        手&nbsp&nbsp&nbsp&nbsp机：<input id="phone" name="phone" style="width:200px"  class="m-margin-small"  placeholder="请输入手机"><br>
        地&nbsp&nbsp&nbsp&nbsp址：<input id="address" name="address" style="width:200px"  class="m-margin-small"  placeholder="请输入地址"><br>
        城&nbsp&nbsp&nbsp&nbsp市：<input id="city" name="city" style="width:200px"  class="m-margin-small"  placeholder="请输入地址"><br>
        <br>
        <br>
        <input id="register" style="width:120px" type="submit" value="注册">
        <input style="width:120px"  type="reset" value="重置">
        <br><br>
    </form>
    <%
    if(session.getAttribute("errorExistAcc")!=null){
        out.print("<div>\n" +
                "<span style=\"color: red;background-color: #FFFFF0\">已存在该账户，请重新选择其他账户</span>\n" +
                "</div>");
    }
    %>
</div>
<br><br>
<!-- 底部内容 -->
<div id="footer" class="m-height-middle  m-width-full">
    <br>
    <div class="m-width-full">
        <div style="margin-left:430px">
            <p style="color:white">关于我&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp
                联系我&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp
                友情链接&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp
                我的社区&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbspEnglist Site</p>
        </div>
    </div>
    <br>
    <div class="m-width-full" style="text-align:center">
        <div class="m-float" style="margin-left:340px">
            <p style="color:white">邮编:518052</p>
        </div>
        <div class="m-float" style="margin-left:100px">
            <p style="color:white">邮箱:junehuazh@163.com</p>
        </div>
        <div class="m-float" style="margin-left:100px">
            <p style="color:white">Copyright @ 2020</p>
        </div>
    </div>
</div>
<script>
    var register=document.getElementById("register");

    register.onclick=function (ev) {
        var id=document.getElementById("id").value;
        var name=document.getElementById("name").value;
        var psw=document.getElementById("psw").value;
        var age=document.getElementById("age").value;
        var phone=document.getElementById("phone").value;
        var address=document.getElementById("address").value;
        var city=document.getElementById("city").value;
        if(id.length==0||name.length==0||psw.length==0||age.length==0||phone.length==0||address.length==0||city.length==0){
            alert("内容存在为空，请重新输入");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
