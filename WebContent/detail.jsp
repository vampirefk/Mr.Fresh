<%@ page import="fresh.User" %>
<%@page import="fresh.Good"%>
<%@page import="fresh.UserDao"%>
<%@page import="java.util.*"%>
<%@page import="fresh.Cart"%>
<%@page import="java.sql.*"%>
<%@page import="fresh.DataBaseConn"%>

<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="GB18030">
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
    <link href="css/detail.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <title>商品详情</title>
	<link rel="icon" href="#">

<script type="text/javascript">
function changePic(evt, picid){
	$(".bigpic").remove();
	var img = evt.currentTarget.firstChild.cloneNode(true);
	document.getElementsByClassName("big-img")[0].appendChild(img);
	$(".big-img").children('img').addClass("bigpic");
}

function incNum(){
	var i = $("#salenum").val();
	i = parseInt(i) + 1;
	$("#salenum").val(i);
}

function decNum(){
	var i = $("#salenum").val();
	i = parseInt(i) - 1;
	if (i < 1) i=1;
	$("#salenum").val(i);
}

function addCart(evt){
	var formData = new FormData();
	formData.append('username', $("#username").attr("name"))
	formData.append("goodno", $("#goodno").attr("name"))
	formData.append("salenum", $("#salenum").val())
	formData.append("isLogin", $("#isLogin").attr("name"))
	var username = document.getElementById("username").value
	$.ajax({
			url:"addToCart",
			type:"POST",
			data:username,
			dataType: "json",
			processData:false,
			contentType:false,
			success: function (data) {
				alert("success!")
			}
	})
}

function alertLog(){
	alert('请登录！')
	window.location.href="LoginPage.jsp";
}

</script>

</head>
<body>
   <div class="header_con"><!-- -------------------------------------------头部------------------------------------------------- -->
        <div class="header">
            <div class="welcome fl">欢迎来到威猛鲜生</div>
            <div class="user_info fr">
            	<%fresh.User user=(fresh.User)request.getSession().getAttribute("user");
            	if(user!=null){
            	%>
            	 <div class="user_login_link fl">
                		 欢迎您 : <em><%=user.getName()%> </em>
                		 <%if(user.getSex().equals("男")){%>
                		 <em>先生</em>
                		 <%}else if(user.getSex().equals("女")){%>
                		 <em>女士</em>
                		 <%} %>
                		 
                </div>
                <div class="user_shopping fl">
                    <span>|</span>
                    <a href="Cart.jsp">购物车</a>
                    <span>|</span>
                    <a href="Update.jsp">修改密码</a>
                    <span>|</span>
					<a href="Exit" >退出登陆</a>
                </div>
                <%}else{ %>
                <div class="user_login_link fl">
                    <a href="LoginPage.jsp">登陆</a>
                    <span>|</span>
                    <a href="RegisterPage.jsp">注册</a>
                </div>
                <%} %>
            </div>
        </div>
    </div>
    <div class="logo_bar">
        <div class="logo fl">
            <a href="#"><img src="images/logo1.png"></a>
        </div>
        <div class="search fl">
            <form action="search" method="post">
                <input type="text" name="search" placeholder="搜索" class="input_text fl">
                <input type="submit" name="" value="搜索" class="input_btn fr">
            </form>
        </div>
    </div>
<div class="content">
<div class="tb-shop">
<img src="detail/ex.jpg">
</div>
<div class="detail">
<div class="base-info">
<div class="imgbox">
<div class="big-img">
<img src="detail/1.jpg" class="bigpic">
</div>
<div class="sm-picbox">
<ul class="sm-pic">
<li onclick="changePic(event, '1')"><img src="detail/1.jpg"></li>
<li onclick="changePic(event, '2')"><img src="detail/2.jpg"></li>
<li onclick="changePic(event, '3')"><img src="detail/3.jpg"></li>
<li onclick="changePic(event, '4')"><img src="detail/4.jpg"></li>
<li onclick="changePic(event, '5')"><img src="detail/5.jpg"></li>
</ul>
</div>
</div>

<div class="txt-info">
<%
int no =Integer.parseInt(request.getParameter("no"));
UserDao userdao = new UserDao();
Good good = new Good();
good = userdao.detailSearch(no);
//if(!good.isEmpty()){
%>
<div class="tb-hd"><h1><%=good.getGoodname() %></h1></div>
<div class="tm-panel">
<div class="panel-row">
<div class="panel-left">价格</div>
<div class="panel-right"><em>¥</em><span><%=good.getPrice() %></span></div>
</div>
</div>
<div class="tb-meta">
<div class="panel-row">
<div class="panel-left">运费</div>
<div class="panel-right">上海总部 至 xx区  快递: 0.00</div>
</div>
</div>
<ul class="sale-info">
<li><div><span class="tm-label">月销量</span><span class="tm-count">4w+</span></div></li>
<li><div><span class="tm-label">累计评价</span><span class="tm-count">15112</span></div></li>
</ul>

<%if(user!=null){%>
<form action="addToCart" method="post"  target="form_iframe" >
<div class="tb-amount">
<div class="panel-row">
<div class="panel-left">数量</div>
<span class="tb-numchg">

<input type="text" maxlength="8" value="1" id="salenum" name="salenum"
onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" 
onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
<span class="mui-btn">
<span class="mui-inc" onclick="incNum()">△</span>
<span class="mui-dec" onclick="decNum()">▽</span>
</span>
<span class="mui-unit">件</span>
</span>
<em>库存<%=good.getNum()%>件</em>
</div>
</div>

<div class="tb-action">
<div class="tb-btn-buy">
<a href="#">立即购买</a>
</div>
<div class="tb-btn-cart">
    <input type="hidden" name="userno" value="<%=user.getNo() %>"/>
    <input type="hidden" name="goodno" value="<%=good.getNo() %>"/>
    <input type="submit" name="" value="加入购物车" style="
    background-color: #ff0036;
    border: 1px solid #ff0036;
    color: #fff;
	margin-right: 0;
    float: left;
    overflow: hidden;
    position: relative;
    width: 178px;
	font-family: 'Microsoft Yahei';
	height: 38px;
    line-height: 38px;
    text-align: center;
    font-size: 16px;
	text-decoration:none;">
    <iframe id="form_iframe" name="form_iframe" style="display:none;"></iframe>
</div>
</div>
</form>
<%}else{ %>
<form action="addToCart" method="post"  target="form_iframe" >
<div class="tb-amount">
<div class="panel-row">
<div class="panel-left">数量</div>
<span class="tb-numchg">

<input type="text" maxlength="8" value="1" id="salenum" name="salenum"
onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" 
onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
<span class="mui-btn">
<span class="mui-inc" onclick="incNum()">△</span>
<span class="mui-dec" onclick="decNum()">▽</span>
</span>
<span class="mui-unit">件</span>
</span>
<em>库存<%=good.getNum()%>件</em>
</div>
</div>

<div class="tb-action">
<div class="tb-btn-buy" >
<button onclick="alertLog()" style="
	margin-right: 0;
    float: left;
    overflow: hidden;
    position: relative;
    width: 178px;
    background-color: #ffeded;
    border: 1px solid #FF0036;
    color: #FF0036;
    font-family: 'Microsoft Yahei';
	height: 38px;
    line-height: 38px;
    text-align: center;
    font-size: 16px;
	text-decoration:none;">立即购买</button>
</div>
<div class="tb-btn-cart">
<button onclick="alertLog()" style="
    background-color: #ff0036;
    border: 1px solid #ff0036;
    color: #fff;
	margin-right: 0;
    float: left;
    overflow: hidden;
    position: relative;
    width: 178px;
	font-family: 'Microsoft Yahei';
	height: 38px;
    line-height: 38px;
    text-align: center;
    font-size: 16px;
	text-decoration:none;">加入购物车</button>

</div>
</div>
</form>
<%} %>
<div class="tm-ser">
<div class="panel-left">服务承诺</div>
<ul class="ser-detail">
<li><a>不支持七天无理由退换</a></li>
<li><a>正品保证</a></li>
<li><a>极速退款</a></li>
</ul>
</div>
</div>
</div>
</div>

<div class="mainwrap">
<div class="tabBar">
<ul>
<li style="position: relative;border-top: 2px solid #FF0036;height: 47px; margin: -1px 0 0 -1px;z-index: 1;padding: 0;"><a style="font-weight: 700;display: block;height: 100%;line-height: 46px;color: #FF0036;border-left: 1px solid #cfbfb1;border-right: 1px solid #cfbfb1;">商品详情</a></li>
<li><a>累计评价</a></li>
</ul>
</div>
<div class="attr-list">
<div class="brand"><div>品牌名称：田园茂</div></div>
<p><em>产品参数:</em></p>
<ul class="AttrUL">
<li>厂名：田园茂</li>
<li>厂址：田园茂</li>
<li>厂家联系方式：18501521775</li>
<li>保质期：7天</li>
<li>品牌：田园茂</li>
<li>产地：中国大陆</li>
<li>省份：山东省</li>
<li>净含量：2.5kg</li>
<li>包装方式：食用农产品</li>
<li>套餐份量：5人份</li>
<li>储存温度：冷藏</li>
</ul>
<div class="tb-validity">
<img src="detail/clock.png">
生产日期: 2020-03-01 至 2020-03-12
</div>
</div>

<div class="content-img">
<div class="sin-img">
<img src="detail/d1.jpg">
</div>
<div class="sin-img">
<img src="detail/d2.jpg">
</div>
<div class="sin-img">
<img src="detail/d3.jpg">
</div>
<div class="sin-img">
<img src="detail/d4.jpg">
</div>
<div class="sin-img">
<img src="detail/d5.jpg">
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