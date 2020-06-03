<%@ page import="com.hua.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>JuneHua购书网</title>
  <!-- 引入css样式 -->
  <!-- 新 Bootstrap 核心 CSS 文件 -->
  <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="./css/my.css">
  <%--引入bootstrap--%>
  <script src="//cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <script src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
  <div id="main" class=" m-width-full container"  style="text-align:center">
    <div class="row" style="height: 500px">
      <div class="col-md-1"></div>
      <div class="col-md-10">
        <%--使用bootstrap实现轮播图轮播图--%>
        <div id="myCarousel" class="carousel slide">
          <!-- 轮播（Carousel）指标 -->
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
          </ol>
          <!-- 轮播（Carousel）项目 -->
          <div class="carousel-inner">
            <div class="item active">
              <img src="./img/banner1.png" style="width: 100%;height: 100%;" alt="First slide">
            </div>
            <div class="item">
              <img src="./img/banner2.jpg" style="width: 100%;height: 100%;" alt="Second slide">
            </div>
            <div class="item">
              <img src="./img/banner3.jpg" style="width: 100%;height: 100%;" alt="Third slide">
            </div>
          </div>
          <!-- 轮播（Carousel）导航 -->
          <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
      <div class="col-md-1"></div>
    </div>
    <h3>最新推荐</h3>
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-1"></div>
    </div>
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-1"></div>
    </div>

    <h3>猜你喜欢</h3>
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-1"></div>
    </div>
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-2">
        <div style="background-color: white">
          <img src="./img/book3.jpg" style="width: 100%" alt="">
          <p><span style="margin-right: 6px">name</span><span style="margin-left: 6px">modify</span></p>
          <p>remark</p>
          <p><span style="margin-right: 6px">price</span><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px"></span></p>
        </div>
      </div>
      <div class="col-md-1"></div>
    </div>
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
