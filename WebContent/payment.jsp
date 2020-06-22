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
    <!-- ����meta��ǩ*����*������ǰ�棬�κ��������ݶ�*����*������� -->
    <!-- Bootstrap CSS -->
    <link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/pay.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <title>��Ʒ����</title>
	<link rel="icon" href="#">
	<script  type="text/javascript">
	function submitPayment(){
		var prov = $("#prov").val();
		var city = $("#city").val();
		var country = $("#country").val();
		var detailAddr = $("#detailAddr").val();
		if(prov=="=��ѡ��ʡ��="||city=="=��ѡ�����="||country=="=��ѡ������="||detailAddr=='' ||detailAddr==undefined||detailAddr == null){
			alert("��δ��д��ַ������д�ջ���ַ��");
		}else
			document.getElementById("toOrder").submit();
}
	
	</script>
</head>
<body>
<body>
    <div class="header_con"><!-- -------------------------------------------ͷ��------------------------------------------------- -->
        <div class="header">
            <div class="welcome fl">��ӭ������������</div>
            <div class="user_info fr">
            	<%fresh.User user=(fresh.User)request.getSession().getAttribute("user");
            	if(user!=null){
            	%>
            	 <div class="user_login_link fl">
                		 ��ӭ�� : <em><%=user.getName()%> </em>
                		 <%if(user.getSex().equals("��")){%>
                		 <em>����</em>
                		 <%}else if(user.getSex().equals("Ů")){%>
                		 <em>Ůʿ</em>
                		 <%} %>
                		 
                </div>
                <div class="user_shopping fl">
                    <span>|</span>
                    <a href="Cart">���ﳵ</a>
                    <span>|</span>
                    <a href="Update.jsp">�޸�����</a>
                    <span>|</span>
					<a href="Exit" >�˳���½</a>
                </div>
                <%}else{ %>
                <div class="user_login_link fl">
                    <a href="LoginPage.jsp">��½</a>
                    <span>|</span>
                    <a href="RegisterPage.jsp">ע��</a>
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
                <input type="text" name="search" placeholder="����" class="input_text fl">
                <input type="submit" name="" value="����" class="input_btn fr">
            </form>
        </div>
    </div>
<form action="toOrder" method="post" accept-charset="GB18030" id="toOrder">
<div class="Jcart">
<div class="filterBar">
<ul>
<li><a>ȷ�϶�����Ϣ</a></li></ul>
</div>

<div class="cartMain">
<div class="cartTable">
<div class="th th-chk"><div class="SelectAll" ><div class="cart-checkbox" style="padding-left: 11px;" ></div></div></div>
<div class="th th-item"><div class="td-inner">��Ʒ��Ϣ</div></div>
<div class="th th-info"><div class="td-inner">&nbsp;</div></div>
<div class="th th-price"><div class="td-inner">����</div></div>
<div class="th th-amount"><div class="td-inner">����</div></div>
<div class="th th-sum"><div class="td-inner">С��</div></div>
<div class="th th-op"><div class="td-inner" style="text-align:center">��ע</div></div>
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
<li class="td th-info"><div class="td-inner infotxt">��ɫ���ࣺΪ����¼����Ʊ��ӰƱ160��+��Ʊ�ɻ�Ʊ60��+5����Ƭ160�ţ�</div></li>
<li class="td th-price"><div class="td-inner priceline" name="price">�0�6<%=list.get(i).getPrice() %></div>
<input type='hidden' name='price'  value="<%=list.get(i).getPrice() %>">
</li>
<li class="td th-amount" style="overflow:visible;">
<div class="td-inner item-amount">
<div id="salenum1"><%=list.get(i).getNum() %></div>
<input type='hidden' name='num'  value="<%=list.get(i).getNum() %>">
</div>
</li>
<li class="td th-sum"><div class="td-inner pricetotal" name="totalprice">�0�6<%=list.get(i).getPrice()*list.get(i).getNum() %></div>
<input type='hidden' name='totalprice'  value="<%=list.get(i).getPrice()*list.get(i).getNum() %>">
</li>
<li class="td th-op"><div class="td-inner">
<a style="color: #3c3c3c;text-decoration: none;">
<span><textarea name="note" placeholder="ѡ����Ⱥ��̼�Э��һ��"></textarea></span>

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
            <!--ʡ��ѡ��-->
            <select class="select" id="prov" name="prov" onchange="showCity(this)">
                <option >=��ѡ��ʡ��=</option>
            </select>
 
            <!--����ѡ��-->
            <select class="select" id="city" name="city" onchange="showCountry(this)">
                <option>=��ѡ�����=</option>
            </select>
 
            <!--����ѡ��-->
            <select class="select" id="country" name="country" onchange="selecCountry(this)">
                <option>=��ѡ������=</option>
            </select>
            
			<input type="text" id="detailAddr" name="detailAddr" placeholder="��ϸ��ַ" 
			style="width: 400px;height: 30px;margin-left: 15px;margin-top: 10px;padding-left: 5px;">
</div>
<div class="BarRightpay">
<div class="priceSumpay">�ϼƣ������˷ѣ��� <em id="totalprice2">
<%
float sum=0;
for(int i=0;i<list.size();i++){
	sum+=list.get(i).getNum()*list.get(i).getPrice();
}
%>
<%=sum %>
</em></div>
<div class="btn-areapay">
<input  type="button" value="����"  onclick="submitPayment()"
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