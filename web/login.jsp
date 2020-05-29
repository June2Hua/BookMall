<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>JuneHua购书网</title>
		<!-- 引入css样式 -->
		<link rel="stylesheet" type="text/css" href="./css/my.css" >
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
				<a class="m-font-middle"  href="./register.jsp" >注册</a>
			</div>
			<div style="float:right" class="m-margin-small">
					<a class="m-font-middle" href="./login.jsp" >登录</a>
			</div>
		</div>
		<br><br><br>
		<!-- 使用div容器嵌套 -->
        <div id="container" style="text-align:center">
			<br>
			<br><br>
			<form id="form" method="post" action="/company/login">
				<h3 class="m-margin-middle">请登录</h3>
				账&nbsp&nbsp&nbsp&nbsp号：<input id="id" name="id"  class="m-margin-small"  placeholder="请输入账号"><br>
				密&nbsp&nbsp&nbsp&nbsp码：<input id="psw" name="psw" type="password" class="m-margin-small" placeholder="请输入密码"><br>
				<div  class="m-margin-small" style="margin-left:320px">
					<p style="color:gray">忘记密码？</p>
				</div>
				<br>
				<input id="login" style="width:120px" type="submit" value="登录">
				<input style="width:120px"  type="reset" value="重置">
			<br><br>
			</form>
            <%
                if(session.getAttribute("errorOfAccOrPsw")!=null){
                    out.print("<div>\n" +
                            "            <span style=\"color: red;background-color: #FFFFF0\">账户或者密码错误</span>\n" +
                            "        </div>");
                }
            %>
		</div>
		<br><br><br><br><br><br>
		<br><br><br><br>
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
        var login=document.getElementById("login");

        login.onclick=function (ev) {
            var id=document.getElementById("id").value;
            var psw=document.getElementById("psw").value;
            if(id==null||id.length==0||psw==null||psw.length==0){
                alert("账户或者密码为空");
                return false;
            }
            return true;
        }
    </script>
    </body>
</html>
