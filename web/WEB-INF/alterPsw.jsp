<%@ page import="com.hua.domain.User" %>
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
    <%!
        User user=null;
    %>
    <%
        user=(User) session.getAttribute("user");
        if(user!=null){
            out.println("<div style=\"float:right\" class=\"m-margin-small\">\n" +
                    "    <a class=\"m-font-middle\"  href=\"/company/alterInfo\" >修改信息</a>\n" +
                    "  </div>\n" +
                    "  <div style=\"float:right\" class=\"m-margin-small\">\n" +
                    "    <a class=\"m-font-middle\" href=\"/company/logout\">注销</a>\n" +
                    "  </div>");
            out.println("<div style=\"float:right\" class=\"m-margin-small\">\n" +
                    "        <p id=\"info\" style=\"color:white\" class=\"m-font-middle\" >欢迎您:"+((User)session.getAttribute("user")).getName()+"</p>\n" +
                    "    </div>");
        }
    %>
</div>
<!-- 使用div容器嵌套 -->
<div id="container" style="text-align:center">
    <br>
    <br><br><br><br>
    <form method="post" action="/company/alterPsw">
        <h3 class="m-margin-middle">修改密码</h3>
        新密码：<input id="new1" type="password" name="new1" style="width:200px"  class="m-margin-small"><br>
        新密码：<input id="new2" type="password" name="new2" style="width:200px"  class="m-margin-small" ><br>
        <br>
        <br>
        <input id="alter" style="width:120px" type="submit" value="修改">
        <br><br>
    </form>
</div>
<br><br><br><br><br><br><br><br><br><br>
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
    var alter=document.getElementById("alter");

    alter.onclick=function (ev) {
        var new1=document.getElementById("new1").value;
        var new2=document.getElementById("new2").value;
        if(new1==null||new1.length==0||new2==null||new2.length==0){
            alert("密码为空，请重新输入");
            return false;
        }
        if(new1!=new2){
            alert("密码不相同，请重新输入");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
