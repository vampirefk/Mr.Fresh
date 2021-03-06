<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!doctype html>
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
    <link href="css/order.css" rel="stylesheet"/>
    <title>商品订单</title>
	<link rel="icon" href="#">


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
<img src="image/cartlogo.jpg" style="position:relative;width:200px;top:10px;">
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

<div class="Jcart">
<div class="filterBar">
<ul>
<li><a>所有订单</a></li></ul>
</div>

<div class="cartMain">
<div class="cartTable">
<div class="th th-item"><div class="td-inner">宝贝</div></div>
<div class="th th-price"><div class="td-inner">单价</div></div>
<div class="th th-amount"><div class="td-inner">数量</div></div>
<div class="th th-sum"><div class="td-inner">实付款</div></div>
<div class="th th-st"><div class="td-inner">交易状态</div></div>
<div class="th th-op"><div class="td-inner">操作</div></div>
</div>
<div class="order-list">
<div class="buy-wrap">
<div class="order-time">2020-06-19</div>
<div class="order-id">订单号: 1074728259191772834</div>
</div>
<div class="order-content">
<ul>
<li class="td th-chk"><div class="SelectAll"><div class="cart-checkbox"></div></div></li>
<li class="td th-item">
<div class="td-inner" style="padding:0;">
<a class="img-pic"><img src="image/good1.jpg"></a>
<div class="item-info">
<div class="basic-info"><a>【狂欢价】电影票火车票收藏册票据收纳册纪念册旅行收集册插页式</a></div>
<div class="other-info"></div>
</div>
</div>
</li>
<li class="td th-price"><div class="td-inner priceline" name="25.00">¥25.00</div></li>
<li class="td th-amount" style="overflow:visible;">
<div class="td-inner item-amount">
1
</div>
</li>
<li class="td th-sum"><div class="td-inner pricetotal" name="25.00">¥25.00</div></li>
<li class="td th-st"><div class="td-inner state">交易关闭</div></li>
<li class="td th-op"><div class="td-inner" style="text-align:center;position: relative;left: -10px;"><a style="color: #3c3c3c;text-decoration: none;">删除</a></div></li>
<div style="clear:both;"></div>
</ul>
</div>
</div>
<div class="order-list">
<div class="buy-wrap">
<div class="order-time">2020-06-19</div>
<div class="order-id">订单号: 1074728259191772834</div>
</div>
<div class="order-content">
<ul>
<li class="td th-chk"><div class="SelectAll"><div class="cart-checkbox"></div></div></li>
<li class="td th-item">
<div class="td-inner" style="padding:0;">
<a class="img-pic"><img src="image/good1.jpg"></a>
<div class="item-info">
<div class="basic-info"><a>【狂欢价】电影票火车票收藏册票据收纳册纪念册旅行收集册插页式</a><div class="td-inner infotxt">颜色分类：为爱记录（车票电影票160张+门票飞机票60张+5寸照片160张）</div></div>
<div class="other-info"></div>
</div>
</div>
</li>

<li class="td th-price"><div class="td-inner priceline" name="25.00">¥25.00</div></li>
<li class="td th-amount" style="overflow:visible;">
<div class="td-inner item-amount">
1
</div>
</li>
<li class="td th-sum"><div class="td-inner pricetotal" name="25.00">¥25.00</div></li>
<li class="td th-st"><div class="td-inner state">交易关闭</div></li>
<li class="td th-op"><div class="td-inner" style="text-align:center;position: relative;left: -10px;"><a style="color: #3c3c3c;text-decoration: none;">删除</a></div></li>
<div style="clear:both;"></div>
</ul>
</div>
</div>

</div>

</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.15.0/umd/popper.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
  </body>
</html>