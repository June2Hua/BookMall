<%@ page import="com.hua.domain.User" %>
<%@ page import="com.hua.dao.IGoodsDao" %>
<%@ page import="com.hua.dao.impl.GoodsDaoImpl" %>
<%@ page import="com.hua.domain.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>
<%@ page import="com.hua.dao.IGoodsAndCarDao" %>
<%@ page import="com.hua.dao.impl.GoodsAndCarDaoImpl" %>
<%@ page import="com.hua.dao.IPersonalShopCarDao" %>
<%@ page import="com.hua.dao.impl.PersonalShopCarDaoImpl" %>
<%@ page import="com.hua.domain.PersonalShopCar" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
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
  <style type="text/css">
    .buttonStyle {
      padding:8px;
      background-color: #ff6e60;
      border-color: #ff6e60;
      color: #fff;
      border-radius: 10px;
      text-align: center;
      vertical-align: middle;
      border: 1px solid transparent;
      font-weight: 900;
      font-size:125%
    }
  </style>
</head>

<body>
<%--全局变量--%>
<%!
  IGoodsDao goodsDao;
  List<Goods> lastestGoods;
  User user=null;
  Map<Goods, Integer> goodsMap;
  double totalPrice=0;//总价格
%>

<div id="top">
  <div style="float:left" class="m-margin-small">
    <p class="m-font-middle" style="color:white">购物车</p>
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
<%--根据用户查询购物车--%>
<%
  String userId=user.getId();
  IPersonalShopCarDao personalShopCarDao=new PersonalShopCarDaoImpl();
  PersonalShopCar personalShopCar = personalShopCarDao.findPersonalShopCarByUserId(userId);
  IGoodsDao goodsDao=new GoodsDaoImpl();
  goodsMap = goodsDao.getGoodsByShopCarId(personalShopCar.getId());
%>

<!-- 使用div容器嵌套 -->
<div id="container" style="margin: 100px">
  <%
    //购物车是否为空
    if(goodsMap==null||goodsMap.size()==0) {
        out.println("<h2>购物车为空</h2>");
    }
    //查询购物车内容
    else{
      Set<Map.Entry<Goods, Integer>> entries = goodsMap.entrySet();
      for(Map.Entry<Goods, Integer> entry:entries){
          Goods goods=entry.getKey();//商品
          int count=entry.getValue();//数量
          totalPrice+=goods.getPrice()*count;//计算金额
  %>
  <div class="row" style="border: 1px solid red;margin: 20px;padding: 10px;">
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
      <p><b>购物车数量</b><span style="color: orangered"><%=count%></span></p>
    </div>
  </div>
  <%
      }
      %>
  <div style="text-align: center">
    <p style="font-size: 22px">总金额：<span style="color: #ff6e60;"><%=totalPrice%></span></p>
    <form action="/company/placeOrder" method="post">
      <input type="carId" name="carId" hidden="hidden" value="<%=personalShopCar.getId()%>">
      <%--<%=personalShopCar.getId()%>--%>
      <%--<%=personalShopCar%>--%>
      <input type="submit" value="立即下单" class="buttonStyle">
    </form>
  </div>
  <%
    }
  %>
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
  var user="<%=user==null?"":user%>";

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
