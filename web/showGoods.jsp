<%@ page import="com.hua.domain.User" %>
<%@ page import="com.hua.dao.IGoodsDao" %>
<%@ page import="com.hua.dao.impl.GoodsDaoImpl" %>
<%@ page import="com.hua.domain.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>
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
<%--全局变量--%>
<%!
  IGoodsDao goodsDao;
  List<Goods> lastestGoods;
  User user=null;
  int id;//参数id
  Goods goods=null;//查询到的商品
%>
<%
  //请求参数
  String parameter = request.getParameter("id");
  id = Integer.valueOf(parameter);
  //查询
  IGoodsDao goodsDao=new GoodsDaoImpl();
  goods = goodsDao.getGoodsById(id);
%>

<div id="top">
  <div style="float:left" class="m-margin-small">
    <p class="m-font-middle" style="color:white">欢迎来到JuneHua图书购物商城</p>
  </div>
  <div style="float:right" class="m-margin-small">
    <a class="m-font-middle"  href="#">购物车</a>
  </div>
  <%
    user=(User) session.getAttribute("user");
    if(user!=null){
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

<%
  if(goods==null) {
    out.println("<div style='text-align:center'>\n" +
            "  <h3 style=\"color: red\">错误，查询不到该商品</h3>\n" +
            "</div>");
    return ;
  }
%>
<br><br><br>
<div class="container" style="margin: 60px">
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-4">
      <img src="./img/<%=goods.getImage()%>" style="height: 350px;width: 350px" alt="找不到图片">
    </div>
    <div class="col-md-4" style="font-size: 22px">
      <p> <b>商品名称：</b><%=goods.getName()%></p>
      <p><b>商品详细信息:</b><%=goods.getRemark()%></p>
      <p><span><b>月销量:</b><%=goods.getSales()%></span>&nbsp&nbsp&nbsp<span><b>剩余量:</b><%=goods.getCount()%></span></p>
      <p><span><b>上架时间:</b><%=goods.getModify()%></span></p>
      <p><b>店主：</b><%=goods.getUser().getName()%></p>
      <p><span><b>联系电话：</b><%=goods.getUser().getPhone()%></span></p>
      <p><b>价格:</b><span style="color: orangered"><%=goods.getPrice()%></span></p>
      <p><b>添加到购物车:</b><span class="glyphicon glyphicon-shopping-cart" style="margin-left: 6px" onclick="clickCar(1)"></span></p>

    </div>
  </div>
</div>
<br><br><br><br>
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
  var user="<%=user==null?"":user%>";

  //点击购物车图标，判断是否登录以及添加到购物车操作
  function clickCar(index){
    console.log(user);
    //未登录
    if(user==null||user==""){
      alert("请先登录，再添加购物车操作");
      return false;
    }
    alert("成功添加到了购物车");
  }

  //点击注销
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
