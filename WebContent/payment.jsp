<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@ page import="fresh.User" %>
<%@page import="fresh.Good"%>
<%@page import="fresh.UserDao"%>
<%@page import="fresh.Cart"%>
<%@page import="java.util.*"%>
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
    <link href="css/pay.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <title>商品付款</title>
	<link rel="icon" href="#">
	<script  type="text/javascript">
	function submitPayment(){
		var prov = $("#prov").val();
		var city = $("#city").val();
		var country = $("#country").val();
		var detailAddr = $("#detailAddr").val();
		if(prov=="=请选择省份="||city=="=请选择城市="||country=="=请选择县区="||detailAddr=='' ||detailAddr==undefined||detailAddr == null){
			alert("您未填写地址，请填写收货地址！");
		}else
			document.getElementById("toOrder").submit();
}
	
	</script>
</head>
<body>
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
                    <a href="Cart">购物车</a>
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
<form action="toOrder" method="post" accept-charset="GB18030" id="toOrder">
<div class="Jcart">
<div class="filterBar">
<ul>
<li><a>确认订单信息</a></li></ul>
</div>

<div class="cartMain">
<div class="cartTable">
<div class="th th-chk"><div class="SelectAll" ><div class="cart-checkbox" style="padding-left: 11px;" ></div></div></div>
<div class="th th-item"><div class="td-inner">商品信息</div></div>
<div class="th th-info"><div class="td-inner">&nbsp;</div></div>
<div class="th th-price"><div class="td-inner">单价</div></div>
<div class="th th-amount"><div class="td-inner">数量</div></div>
<div class="th th-sum"><div class="td-inner">小计</div></div>
<div class="th th-op"><div class="td-inner" style="text-align:center">备注</div></div>
</div>



<%
ArrayList<Cart> list=new ArrayList<Cart>();
list=(ArrayList<Cart>)request.getAttribute("list");
if(list!=null){
	for(int i=0; i < list.size();i++){
		%>
<div class="order-list">
<div class="order-content">
<ul>
<li class="td th-chk"><div class="SelectAll"><div class="cart-checkbox"></div></div></li>
<li class="td th-item">
<div class="td-inner" style="padding:0;">
<a class="img-pic"><img src="image/good1.jpg"></a>
<div class="item-info">
<div class="basic-info"><a><%=list.get(i).getGoodname() %></a></div>
<input type='hidden' name='userno'  value="<%=list.get(i).getUser() %>">
<input type='hidden' name='pic'  value="<%=list.get(i).getPic() %>">
<input type='hidden' name='goodno'  value="<%=list.get(i).getGoodno() %>">
<input type='hidden' name='goodname'  value="<%=list.get(i).getGoodname() %>">
<div class="other-info"></div>
</div>
</div>
</li>
<li class="td th-info"><div class="td-inner infotxt">颜色分类：为爱记录（车票电影票160张+门票飞机票60张+5寸照片160张）</div></li>
<li class="td th-price"><div class="td-inner priceline" name="price">¥<%=list.get(i).getPrice() %></div>
<input type='hidden' name='price'  value="<%=list.get(i).getPrice() %>">
</li>
<li class="td th-amount" style="overflow:visible;">
<div class="td-inner item-amount">
<div id="salenum1"><%=list.get(i).getNum() %></div>
<input type='hidden' name='num'  value="<%=list.get(i).getNum() %>">
</div>
</li>
<li class="td th-sum"><div class="td-inner pricetotal" name="totalprice">¥<%=list.get(i).getPrice()*list.get(i).getNum() %></div>
<input type='hidden' name='totalprice'  value="<%=list.get(i).getPrice()*list.get(i).getNum() %>">
</li>
<li class="td th-op"><div class="td-inner">
<a style="color: #3c3c3c;text-decoration: none;">
<span><textarea name="note" placeholder="选填，请先和商家协商一致"></textarea></span>

</a>
</div></li>
<div style="clear:both;"></div>
</ul>
</div>
</div>
<%}
	}%>

</div>

<div class="BarHolderpay">
<div class="selectAllpay" style="padding-left: 20px;" ></div>
<div class="deleteAllpay">
            <!--省份选择-->
            <select class="select" id="prov" name="prov" onchange="showCity(this)">
                <option >=请选择省份=</option>
            </select>
 
            <!--城市选择-->
            <select class="select" id="city" name="city" onchange="showCountry(this)">
                <option>=请选择城市=</option>
            </select>
 
            <!--县区选择-->
            <select class="select" id="country" name="country" onchange="selecCountry(this)">
                <option>=请选择县区=</option>
            </select>
            
			<input type="text" id="detailAddr" name="detailAddr" placeholder="详细地址" 
			style="width: 400px;height: 30px;margin-left: 15px;margin-top: 10px;padding-left: 5px;">
</div>
<div class="BarRightpay">
<div class="priceSumpay">合计（包含运费）： <em id="totalprice2">
<%
float sum=0;
for(int i=0;i<list.size();i++){
	sum+=list.get(i).getNum()*list.get(i).getPrice();
}
%>
<%=sum %>
</em></div>
<div class="btn-areapay">
<input  type="button" value="付款"  onclick="submitPayment()"
style="
	color: #fff!important;
	display: inline-block;
    width: 120px;
    height: 50px;
    line-height: 50px;
    background: #f40;
    text-align: center;
    font-family: 'Lantinghei SC','Microsoft Yahei';
    font-size: 20px;
    border-radius: 2px;
    text-decoration: none;
    border:none;
    cursor: pointer;">
</div>
</div>
</div>
</div>
</form>

<script src="js/city.js"  ></script>
<script src="js/method.js" ></script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.15.0/umd/popper.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
  </body>
</html>