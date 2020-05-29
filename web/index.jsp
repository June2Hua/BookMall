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
  <%!
    User user=null;
  %>
  <div style="float:right" class="m-margin-small">
    <a class="m-font-middle"  href="#">购物车</a>
  </div>
  <%
        if(session.getAttribute("user")!=null){
            out.println("<div style=\"float:right\" class=\"m-margin-small\">\n" +
                    "    <a class=\"m-font-middle\"  href=\"/company/alterInfo\" >修改信息</a>\n" +
                    "  </div>\n" +
                    "  <div style=\"float:right\" class=\"m-margin-small\">\n" +
                    "    <a id=\"logout\" class=\"m-font-middle\" href=\"/company/logout\">注销</a>\n" +
                    "  </div>");
            out.println("<div style=\"float:right\" class=\"m-margin-small\">\n" +
                    "<p id=\"info\" style=\"color:white\" class=\"m-font-middle\" >欢迎您:"+((User)session.getAttribute("user")).getName()+"</p>\n" +
                    "    </div>");
        }else{
            out.println("<div style=\"float:right\" class=\"m-margin-small\">\n" +
                    "    <a class=\"m-font-middle\"  href=\"./register.jsp\" >注册</a>\n" +
                    "  </div>\n" +
                    "  <div style=\"float:right\" class=\"m-margin-small\">\n" +
                    "    <a class=\"m-font-middle\" href=\"./login.jsp\">登录</a>\n" +
                    "  </div>");
        }
  %>
</div>


<!-- 使用div容器嵌套 -->
<div id="container">
  <div id="header" class="m-height-middle" style="position: relative;">
    <!-- 图片 -->
    <div class="m-float  m-width-25" style="margin-top:10px;">
      <img class="m-img-middle" style="margin-left:70px" src="./img/book.jpg">
    </div>
    <!-- 输入框的内容 -->
    <div class="m-float  m-width-50" style="margin-top:30px">
      <input id="search" placeholder="请输入要查找的书籍">
      <button id="searchBtn">确定</button>
    </div>
    <%
      user=(User)session.getAttribute("user");
      if(user!=null){
        out.println("  <div id=\"moreInfo\" style=\"display:none;z-index:20\" >\n" +
                "    <p>账户："+user.getId()+"</p>\n" +
                "    <p>姓名："+user.getName()+"</p>\n" +
                "    <p>年龄："+user.getAge()+"</p>\n" +
                "    <p>电话："+user.getPhone()+"</p>\n" +
                "    <p>地址："+user.getAddress()+"</p>\n" +
                "    <p>城市："+user.getCity()+"</p>\n" +
                "  </div>");
      }
    %>
  </div>
  <!-- 中间部分div，包括目录，内容等 -->
  <div id="main" class="m-height-high  m-width-full "  style="text-align:center">
    <!-- 左侧 -->
    <div id="left"class="m-float  m-width-15 m-height-full  m-margin-large "  >
      <ul id="leftList" class="m-margin-middle m-padding-small">
        <li class="m-margin-middle"><div class="m-background-change"><a href="#">童书/智力&nbsp&nbsp&nbsp>></a></div></li>
        <li class="m-margin-middle"><div class="m-background-change"><a href="#">小说/历史&nbsp&nbsp&nbsp>></a></div></li>
        <li class="m-margin-middle"><div class="m-background-change"><a href="#">文学/艺术&nbsp&nbsp&nbsp>></a></div></li>
        <li class="m-margin-middle"><div class="m-background-change"><a href="#">管理/心里&nbsp&nbsp&nbsp>></a></div></li>
        <li class="m-margin-middle"><div class="m-background-change"><a href="#">外语/国际&nbsp&nbsp&nbsp>></a></div></li>
        <li class="m-margin-middle"><div class="m-background-change"><a href="#">医学/人体&nbsp&nbsp&nbsp>></a></div></li>
        <li class="m-margin-middle"><div class="m-background-change"><a href="#">文化/传统&nbsp&nbsp&nbsp>></a></div></li>
        <li class="m-margin-middle"><div class="m-background-change"><a href="#">经济/金融&nbsp&nbsp&nbsp>></a></div></li>
        <li class="m-margin-middle"><div class="m-background-change"><a href="#">科技/技术&nbsp&nbsp&nbsp>></a></div></li>
        <li class="m-margin-middle"><div class="m-background-change"><a href="#">教材/资料&nbsp&nbsp&nbsp>></a></div></li>
        <li class="m-margin-middle"><div class="m-background-change"><a href="#">健康/饮食&nbsp&nbsp&nbsp>></a></div></li>
      </ul>
    </div>
    <!-- 中间 -->
    <div id="center" class="m-float  m-width-60" style="margin-top:5px">
      <!-- 第一行 -->
      <div style="height:49%">
        <div class="m-float  m-height-full" style="width:50%">
          <img style="height:220px" src="./img/book1.jpg">
          <h4 class="m-opcity-middle">java虚拟机规范</h4>
        </div>
        <div class="m-float  m-height-full" style="width:50%">
          <img style="height:220px" src="./img/book2.jpg">
          <h4 class="m-opcity-middle">spring源码分析</h4>
        </div>
      </div>
      <!-- 第二行 -->
      <div style="height:49%">
        <div class="m-float  m-height-full" style="width:50%">
          <img style="height:220px" src="./img/book3.jpg">
          <h4 class="m-opcity-middle">深入实践springboot</h4>
        </div>
        <div class="m-float  m-height-full" style="width:50%">
          <img style="height:220px" src="./img/book5.jpg">
          <h4 class="m-opcity-middle">Spring3.x</h4>
        </div>
      </div >
    </div>
    <!-- 右侧 -->
    <div id="right" class="m-float  m-width-20 m-height-full " style="margin-left:12px">
      <div class="m-width-full  m-opcity-low" style="background:#FF5511 "><h3>为您推荐</h3></div>
      <img style="height:160px" src="./img/book7.jpg">
      <img style="height:160px" src="./img/book8.jpg">
      <img style="height:160px" src="./img/book9.jpg">
    </div>
    <br>
  </div>
</div>
<br>


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
  var info=document.getElementById("info");
  var moreInfo=document.getElementById("moreInfo");
  var logout=document.getElementById("logout");

  logout.onclick=function (event) {
      alert("注销成功");
  }

  info.onmouseenter=function (event) {
    moreInfo.style.display="block";
  }

  info.onmouseleave=function (event) {
      moreInfo.style.display="none";
  }
</script>
</body>
</html>
