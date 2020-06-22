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
    <meta charset="utf-8">
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
    <link href="css/cart.css" rel="stylesheet"/>
    <title>���ﳵ��Ʒ</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
	<link rel="icon" href="#">

<script type="text/javascript">
function changeNum(objName){
	var objNameList=document.getElementsByName(objName);
	var totalPriceList = document.getElementsByClassName("pricetotal");
	var pay = document.getElementsByClassName("smallSubmit");
	var amount = 0;
	var TPrice = 0;
	for(var i=0;i<objNameList.length;i++){  
      if(objNameList[i].checked==true)
      {
        amount++;
		TPrice = TPrice + parseFloat(totalPriceList[i].getAttribute("name"));
      }
    }
	document.getElementById("totalAmount").innerHTML=amount;
	document.getElementById("totalprice1").innerHTML=String(TPrice.toFixed(2));
	document.getElementById("totalprice2").innerHTML=String(TPrice.toFixed(2));
	if(TPrice>0){
		pay[0].className += " active";
		pay[1].className += " active";
	}
	else{
		pay[0].className.replace(" active", "");
		pay[1].className.replace(" active", "");
	}
}

function opcheckboxed(objName,k){
  var pay = document.getElementsByClassName("smallSubmit");
  var objNameList=document.getElementsByName(objName);
  var totalPriceList = document.getElementsByClassName("pricetotal");
  var TPrice = 0;
  if(null!=objNameList){
  var boxes = document.getElementsByName("check_box_all");
  var type = "checkall";
  var tamount = objNameList.length;
  if(boxes[k].checked==false){
	for(var i=0;i<boxes.length;i++){
		boxes[i].checked=false;
	}
	type = "reversecheck";
	document.getElementById("totalAmount").innerHTML="0";
	document.getElementById("totalprice1").innerHTML="0.00";
	document.getElementById("totalprice2").innerHTML="0.00";
  }
  else {
	for(var i=0;i<boxes.length;i++){
		boxes[i].checked=true;
	}
	for(var i=0;i<totalPriceList.length;i++){
		TPrice = TPrice + parseFloat(totalPriceList[i].getAttribute("name"));
	}
	document.getElementById("totalAmount").innerHTML=tamount;
	document.getElementById("totalprice1").innerHTML=String(TPrice.toFixed(2));
	document.getElementById("totalprice2").innerHTML=String(TPrice.toFixed(2));
  }
    for(var i=0;i<objNameList.length;i++){  
      if(objNameList[i].checked==true)
      {
        if(type != 'checkall') {  // ��ȫѡ
          objNameList[i].checked=false;
        }
        
      } else {
        if(type != 'uncheckall') {  // ��ȡ��ȫѡ
          objNameList[i].checked=true;
        }
      }
    } 
	if(TPrice>0){
		pay[0].className += " active";
		pay[1].className += " active";
	}
	else{
		pay[0].className.replace(" active", "");
		pay[1].className.replace(" active", "");
	}	
  }
}

function incNum(num){
	var idname = "#salenum" + num
	var priceList = document.getElementsByClassName("priceline");
	var totalPriceList = document.getElementsByClassName("pricetotal");
	var price = priceList[num-1].getAttribute("name");
	var i = $(idname).val();
	i = parseInt(i) + 1;
	var total = parseFloat(price)*i;
	$(idname).val(i);
	totalPriceList[num-1].innerHTML="�0�6"+String(total.toFixed(2));
	totalPriceList[num-1].setAttribute("name",total);
	changeNum('check_box_list');
}

function decNum(num){
	var idname = "#salenum" + num
	var priceList = document.getElementsByClassName("priceline");
	var totalPriceList = document.getElementsByClassName("pricetotal");
	var price = priceList[num-1].getAttribute("name");
	var i = $(idname).val();
	i = parseInt(i) - 1;
	if (i < 1) i=1;
	var total = parseFloat(price)*i;
	$(idname).val(i);
	totalPriceList[num-1].innerHTML="�0�6"+String(total.toFixed(2));
	totalPriceList[num-1].setAttribute("name",total);
	changeNum('check_box_list');
	location.href='welcome.jsp?salenum='+document.getElementByName('salenum').value+'&userno='+document.getElementByName('userno').value+'goodno='+document.getElementByName('goodno').value
}

function submitPayment(){
		document.getElementById("pay").submit();
}

</script>

</head>
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

<div class="Jcart">
<div class="filterBar">
<ul>
<li><a>ȫ����Ʒ</a></li></ul>
<div class="cartSum"><span>��ѡ��Ʒ�������˷ѣ�&nbsp;</span><em id="totalprice1">0.00</em><a class="smallSubmit" onclick="submitPayment()">��&nbsp;��</a></div>
</div>

<div class="cartMain">
<div class="cartTable">
<div class="th th-chk">
<div class="SelectAll" >
<div class="cart-checkbox" style="padding-left: 11px;" >
<input type='checkbox' onclick="opcheckboxed('check_box_list',0)" name='check_box_all' id="SelectAll"> &nbsp;&nbsp;ȫѡ
</div>
</div>
</div>
<div class="th th-item"><div class="td-inner">��Ʒ��Ϣ</div></div>
<div class="th th-info"><div class="td-inner">&nbsp;</div></div>
<div class="th th-price"><div class="td-inner">����</div></div>
<div class="th th-amount"><div class="td-inner">����</div></div>
<div class="th th-sum"><div class="td-inner">���</div></div>
<div class="th th-op"><div class="td-inner">����</div></div>
</div>



<form action="toPay" method="post" id="pay" name="pay">
<!-- ���Դ����ݿ��л�ù��ﳵ������ -->
<%
UserDao userdao=new UserDao();
ArrayList<Cart> cart = userdao.getDBtoCart(user.getNo());
if(!cart.isEmpty()){
	//for(Cart goodGet:cart){
	for(int i=0; i < cart.size();i++){
%>
<div class="order-list">
<div class="order-content">
<ul>
<li class="td th-chk">
<div class="SelectAll">
<div class="cart-checkbox">



<input type='checkbox' name='check_box_list' onclick="changeNum('check_box_list')" value="<%=cart.get(i).getGoodno() %>">
<input type='hidden' name='username'  value="<%=cart.get(i).getUser() %>">



</div>
</div>
</li>
<li class="td th-item">
<div class="td-inner" style="padding:0;">
<a class="img-pic"><img src="<%=cart.get(i).getPic() %>"></a>
<div class="item-info">
<div class="basic-info"><a><%=cart.get(i).getGoodname() %></a></div>
<div class="other-info"></div>
</div>
</div>
</li>
<li class="td th-info"><div class="td-inner infotxt">��ɫ���ࣺΪ����¼����Ʊ��ӰƱ160��+��Ʊ�ɻ�Ʊ60��+5����Ƭ160�ţ�</div></li>
<li class="td th-price"><div class="td-inner priceline" name="<%=cart.get(i).getPrice() %>">�0�6<%=cart.get(i).getPrice() %></div></li>
<li class="td th-amount" style="overflow:visible;">




<!-- �ύ���� -->
<!-- <form action="updateCart" method="post" target="form_iframe"> -->
<div class="td-inner item-amount">
<!-- <input style="width: 30px;height: 25px;border:none;" class="mui-dec" 
type="button" onclick="decNum(<%=i+1%>)" 
value="-"/> -->
<a class="mui-dec" target="form_iframe" href="updateCart?salenum=<%=cart.get(i).getNum()-1%>&userno=<%=user.getNo()%>&goodno=<%=cart.get(i).getGoodno()%>" onclick="decNum(<%=i+1%>)" >-</a>
<input type="text" maxlength="8" value="<%=cart.get(i).getNum() %>" id="salenum<%=i+1%>" name="salenum"
onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">

<!-- <input style="width: 30px;height: 25px;border:none;" class="mui-inc" 
type="submit" onclick="incNum(<%=i+1%>)" 
value="+"> -->
<a class="mui-inc" target="form_iframe" href="updateCart?salenum=<%=cart.get(i).getNum()+1%>&userno=<%=user.getNo()%>&goodno=<%=cart.get(i).getGoodno()%>" onclick="incNum(<%=i+1%>)" >+</a>
</div>
    <input type="hidden" name="userno" value="<%=user.getNo() %>"/>
    <input type="hidden" name="goodno" value="<%=cart.get(i).getGoodno() %>"/>
    <iframe id="form_iframe" name="form_iframe" style="display:none;"></iframe>
<!-- </form> -->

</li>
<li class="td th-sum">
<div class="td-inner pricetotal" name="<%=cart.get(i).getPrice()*cart.get(i).getNum()%>">�0�6<%=cart.get(i).getPrice()*cart.get(i).getNum()%></div></li>
<li class="td th-op">
<div class="td-inner">
<a style="color: #3c3c3c;text-decoration: none;">ɾ��</a>
</div>
</li>
<div style="clear:both;"></div>
</ul>
</div>
</div>
<%}
}%>
</form>
</div>
<div class="BarHolder">
<div class="selectAll" style="padding-left: 20px;" >
<input type='checkbox' onclick="opcheckboxed('check_box_list',1)"name='check_box_all' id="SelectAll2">ȫѡ</div>
<div class="deleteAll"><a>ɾ��</a></div>
<div class="BarRight">
<div class="amountSum">��ѡ��Ʒ<em id="totalAmount">0</em>��</div>
<div class="priceSum">�ϼƣ������˷ѣ��� <em id="totalprice2">0.00</em></div>
<div class="btn-area">
<a class="smallSubmit" onclick="submitPayment()">����</a>
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