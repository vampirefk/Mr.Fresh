<%@page import="fresh.Good"%>
<%@page import="fresh.User"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="referrer" content="no-referrer">
	<meta name="apple-mobile-web-app-status-bar-style" content="black"> 
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
    <!-- 上述meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <!-- Bootstrap CSS -->
    <link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/search.css" rel="stylesheet"/>
    <title>商品详情</title>
	<link rel="icon" href="#">

<script type="text/javascript">
function Sort(evt,mode){
	var fsorts;
	fsorts = document.getElementsByClassName("fsort");
    for (i = 0; i < fsorts.length; i++) {
        fsorts[i].className = fsorts[i].className.replace(" active", "");
    }
    evt.currentTarget.className += " active";
}
</script>

</head>
<body>

<div class="sitenav">
<div class="navcont">
<div class="lsite">
<div><a href="#">首页</a></div>
<div>欢迎来到威猛鲜生</div>
<div><a href="#">请登录</a></div>
<div><a href="#">免费注册</a></div>
</div>
<div class="rsite">
<div><a>购物车</a></div>
<div><a>收藏夹</a></div>
<div><a>商家支持</a></div>
<div><a>网站导航</a></div>
</div>
</div>
</div>
<div class="header">
<div class="headerCon">
<img src="image/weblogo.jpg" style="position:relative;width:200px;top:10px;left:-12px;">
<div class="Searchbox">
<form class="form-search" method="get" id="searchform" action="{% url 'haystack_search' %}">
<div class="searchWrap">
  <input type="text" placeholder="这是搜索框" class="input-medium search-query" autocomplete="off" >
  <button class="W_Search">搜索</button>
</div>
</form>
</div>
</div>
</div>
<div class="main">
<div class="filter">
<a class="fsort" onclick="Sort(event,1)">
综合▼
</a>
<a class="fsort" onclick="Sort(event,2)">
人气▼
</a>
<a class="fsort" onclick="Sort(event,3)">
新品▼
</a>
<a class="fsort" onclick="Sort(event,4)">
销量▼
</a>
<a class="fsort" onclick="Sort(event,5)">
价格▼
</a>
<div class="areaSelect">
<s>收货地：</s>
<a>上海市奉贤区</a>
</div>
<div class="fpbox">
<b><input placeholder="¥" autocomplete="off"></b>
<b> - </b>
<b><input placeholder="¥" autocomplete="off"></b>
</div>
</div>
<div class="viewGoods">、
<%
	ArrayList<Good> good = (ArrayList<Good>)request.getAttribute("good");
	if(!good.isEmpty()){
		for(Good goodGet : good){
%>
<div class="product">
<div class="productWrap">
<a class="ImgWrap" href="detail.jsp?no=<%=goodGet.getNo()%>" target="_blank"><img src="image/2.jpg"></a><!-- <%=goodGet.getPic() %> -->
<p class="proPrice"><b>¥</b><%=goodGet.getPrice() %></p>
<p class="proTitle"><a><%=goodGet.getGoodname() %></a></p>
<p class="proShop"><a>威猛鲜生</a></p>
<p class="proStatus">
<span class="spnBill">月成交<em>8.7万笔</em></span>
<span class="spnComment">库存<em><%=goodGet.getNum() %></em></span>
<span class="spnCart"><a><span>购物车<span></a><span>
</p>
</div>
</div>
<%
		}
%>
<%
	}else{
%>
	<a>未查询到相关内容！</a>
<%
	}
%>
<!-- 

<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>¥</b>29.6</p>
<p class="proTitle"><a>健康全麦面包吐司粗粮</a></p>
<p class="proShop"><a>威猛鲜生</a></p>
<p class="proStatus">
<span class="spnBill">月成交<em>8.7万笔</em></span>
<span class="spnComment">评价<em>14万</em></span>
<span class="spnCart"><a><span>购物车<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>¥</b>29.6</p>
<p class="proTitle"><a>健康全麦面包吐司粗粮</a></p>
<p class="proShop"><a>威猛鲜生</a></p>
<p class="proStatus">
<span class="spnBill">月成交<em>8.7万笔</em></span>
<span class="spnComment">评价<em>14万</em></span>
<span class="spnCart"><a><span>购物车<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>¥</b>29.6</p>
<p class="proTitle"><a>健康全麦面包吐司粗粮</a></p>
<p class="proShop"><a>威猛鲜生</a></p>
<p class="proStatus">
<span class="spnBill">月成交<em>8.7万笔</em></span>
<span class="spnComment">评价<em>14万</em></span>
<span class="spnCart"><a><span>购物车<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>¥</b>29.6</p>
<p class="proTitle"><a>健康全麦面包吐司粗粮</a></p>
<p class="proShop"><a>威猛鲜生</a></p>
<p class="proStatus">
<span class="spnBill">月成交<em>8.7万笔</em></span>
<span class="spnComment">评价<em>14万</em></span>
<span class="spnCart"><a><span>购物车<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>¥</b>29.6</p>
<p class="proTitle"><a>健康全麦面包吐司粗粮</a></p>
<p class="proShop"><a>威猛鲜生</a></p>
<p class="proStatus">
<span class="spnBill">月成交<em>8.7万笔</em></span>
<span class="spnComment">评价<em>14万</em></span>
<span class="spnCart"><a><span>购物车<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>¥</b>29.6</p>
<p class="proTitle"><a>健康全麦面包吐司粗粮</a></p>
<p class="proShop"><a>威猛鲜生</a></p>
<p class="proStatus">
<span class="spnBill">月成交<em>8.7万笔</em></span>
<span class="spnComment">评价<em>14万</em></span>
<span class="spnCart"><a><span>购物车<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>¥</b>29.6</p>
<p class="proTitle"><a>健康全麦面包吐司粗粮</a></p>
<p class="proShop"><a>威猛鲜生</a></p>
<p class="proStatus">
<span class="spnBill">月成交<em>8.7万笔</em></span>
<span class="spnComment">评价<em>14万</em></span>
<span class="spnCart"><a><span>购物车<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>¥</b>29.6</p>
<p class="proTitle"><a>健康全麦面包吐司粗粮</a></p>
<p class="proShop"><a>威猛鲜生</a></p>
<p class="proStatus">
<span class="spnBill">月成交<em>8.7万笔</em></span>
<span class="spnComment">评价<em>14万</em></span>
<span class="spnCart"><a><span>购物车<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>¥</b>29.6</p>
<p class="proTitle"><a>健康全麦面包吐司粗粮</a></p>
<p class="proShop"><a>威猛鲜生</a></p>
<p class="proStatus">
<span class="spnBill">月成交<em>8.7万笔</em></span>
<span class="spnComment">评价<em>14万</em></span>
<span class="spnCart"><a><span>购物车<span></a><span>
</p>
</div>
</div>

 -->


</div>
</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.15.0/umd/popper.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
  </body>
</html>