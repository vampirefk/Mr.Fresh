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
    <!-- ����meta��ǩ*����*������ǰ�棬�κ��������ݶ�*����*������� -->
    <!-- Bootstrap CSS -->
    <link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/order.css" rel="stylesheet"/>
    <title>��Ʒ����</title>
	<link rel="icon" href="#">


</head>
<body>
<div class="sitenav">
<div class="navcont">
<div class="lsite">
<div><a href="#">��ҳ</a></div>
<div>��ӭ������������</div>
<div><a href="#">���¼</a></div>
<div><a href="#">���ע��</a></div>
</div>
<div class="rsite">
<div><a>���ﳵ</a></div>
<div><a>�ղؼ�</a></div>
<div><a>�̼�֧��</a></div>
<div><a>��վ����</a></div>
</div>
</div>
</div>
<div class="header">
<div class="headerCon">
<img src="image/cartlogo.jpg" style="position:relative;width:200px;top:10px;">
<div class="Searchbox">
<form class="form-search" method="get" id="searchform" action="{% url 'haystack_search' %}">
<div class="searchWrap">
  <input type="text" placeholder="����������" class="input-medium search-query" autocomplete="off" >
  <button class="W_Search">����</button>
</div>
</form>
</div>
</div>
</div>

<div class="Jcart">
<div class="filterBar">
<ul>
<li><a>���ж���</a></li></ul>
</div>

<div class="cartMain">
<div class="cartTable">
<div class="th th-item"><div class="td-inner">����</div></div>
<div class="th th-price"><div class="td-inner">����</div></div>
<div class="th th-amount"><div class="td-inner">����</div></div>
<div class="th th-sum"><div class="td-inner">ʵ����</div></div>
<div class="th th-st"><div class="td-inner">����״̬</div></div>
<div class="th th-op"><div class="td-inner">����</div></div>
</div>
<div class="order-list">
<div class="buy-wrap">
<div class="order-time">2020-06-19</div>
<div class="order-id">������: 1074728259191772834</div>
</div>
<div class="order-content">
<ul>
<li class="td th-chk"><div class="SelectAll"><div class="cart-checkbox"></div></div></li>
<li class="td th-item">
<div class="td-inner" style="padding:0;">
<a class="img-pic"><img src="image/good1.jpg"></a>
<div class="item-info">
<div class="basic-info"><a>���񻶼ۡ���ӰƱ��Ʊ�ղز�Ʊ�����ɲ����������ռ����ҳʽ</a></div>
<div class="other-info"></div>
</div>
</div>
</li>
<li class="td th-price"><div class="td-inner priceline" name="25.00">�0�625.00</div></li>
<li class="td th-amount" style="overflow:visible;">
<div class="td-inner item-amount">
1
</div>
</li>
<li class="td th-sum"><div class="td-inner pricetotal" name="25.00">�0�625.00</div></li>
<li class="td th-st"><div class="td-inner state">���׹ر�</div></li>
<li class="td th-op"><div class="td-inner" style="text-align:center;position: relative;left: -10px;"><a style="color: #3c3c3c;text-decoration: none;">ɾ��</a></div></li>
<div style="clear:both;"></div>
</ul>
</div>
</div>
<div class="order-list">
<div class="buy-wrap">
<div class="order-time">2020-06-19</div>
<div class="order-id">������: 1074728259191772834</div>
</div>
<div class="order-content">
<ul>
<li class="td th-chk"><div class="SelectAll"><div class="cart-checkbox"></div></div></li>
<li class="td th-item">
<div class="td-inner" style="padding:0;">
<a class="img-pic"><img src="image/good1.jpg"></a>
<div class="item-info">
<div class="basic-info"><a>���񻶼ۡ���ӰƱ��Ʊ�ղز�Ʊ�����ɲ����������ռ����ҳʽ</a><div class="td-inner infotxt">��ɫ���ࣺΪ����¼����Ʊ��ӰƱ160��+��Ʊ�ɻ�Ʊ60��+5����Ƭ160�ţ�</div></div>
<div class="other-info"></div>
</div>
</div>
</li>

<li class="td th-price"><div class="td-inner priceline" name="25.00">�0�625.00</div></li>
<li class="td th-amount" style="overflow:visible;">
<div class="td-inner item-amount">
1
</div>
</li>
<li class="td th-sum"><div class="td-inner pricetotal" name="25.00">�0�625.00</div></li>
<li class="td th-st"><div class="td-inner state">���׹ر�</div></li>
<li class="td th-op"><div class="td-inner" style="text-align:center;position: relative;left: -10px;"><a style="color: #3c3c3c;text-decoration: none;">ɾ��</a></div></li>
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