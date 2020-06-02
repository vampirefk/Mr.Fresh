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
    <!-- ����meta��ǩ*����*������ǰ�棬�κ��������ݶ�*����*������� -->
    <!-- Bootstrap CSS -->
    <link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/search.css" rel="stylesheet"/>
    <title>��Ʒ����</title>
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
<img src="image/weblogo.jpg" style="position:relative;width:200px;top:10px;left:-12px;">
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
<div class="main">
<div class="filter">
<a class="fsort" onclick="Sort(event,1)">
�ۺϨ�
</a>
<a class="fsort" onclick="Sort(event,2)">
������
</a>
<a class="fsort" onclick="Sort(event,3)">
��Ʒ��
</a>
<a class="fsort" onclick="Sort(event,4)">
������
</a>
<a class="fsort" onclick="Sort(event,5)">
�۸�
</a>
<div class="areaSelect">
<s>�ջ��أ�</s>
<a>�Ϻ��з�����</a>
</div>
<div class="fpbox">
<b><input placeholder="�0�6" autocomplete="off"></b>
<b> - </b>
<b><input placeholder="�0�6" autocomplete="off"></b>
</div>
</div>
<div class="viewGoods">��
<%
	ArrayList<Good> good = (ArrayList<Good>)request.getAttribute("good");
	if(!good.isEmpty()){
		for(Good goodGet : good){
%>
<div class="product">
<div class="productWrap">
<a class="ImgWrap" href="detail.jsp?no=<%=goodGet.getNo()%>" target="_blank"><img src="image/2.jpg"></a><!-- <%=goodGet.getPic() %> -->
<p class="proPrice"><b>�0�6</b><%=goodGet.getPrice() %></p>
<p class="proTitle"><a><%=goodGet.getGoodname() %></a></p>
<p class="proShop"><a>��������</a></p>
<p class="proStatus">
<span class="spnBill">�³ɽ�<em>8.7���</em></span>
<span class="spnComment">���<em><%=goodGet.getNum() %></em></span>
<span class="spnCart"><a><span>���ﳵ<span></a><span>
</p>
</div>
</div>
<%
		}
%>
<%
	}else{
%>
	<a>δ��ѯ��������ݣ�</a>
<%
	}
%>
<!-- 

<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>�0�6</b>29.6</p>
<p class="proTitle"><a>����ȫ�������˾����</a></p>
<p class="proShop"><a>��������</a></p>
<p class="proStatus">
<span class="spnBill">�³ɽ�<em>8.7���</em></span>
<span class="spnComment">����<em>14��</em></span>
<span class="spnCart"><a><span>���ﳵ<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>�0�6</b>29.6</p>
<p class="proTitle"><a>����ȫ�������˾����</a></p>
<p class="proShop"><a>��������</a></p>
<p class="proStatus">
<span class="spnBill">�³ɽ�<em>8.7���</em></span>
<span class="spnComment">����<em>14��</em></span>
<span class="spnCart"><a><span>���ﳵ<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>�0�6</b>29.6</p>
<p class="proTitle"><a>����ȫ�������˾����</a></p>
<p class="proShop"><a>��������</a></p>
<p class="proStatus">
<span class="spnBill">�³ɽ�<em>8.7���</em></span>
<span class="spnComment">����<em>14��</em></span>
<span class="spnCart"><a><span>���ﳵ<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>�0�6</b>29.6</p>
<p class="proTitle"><a>����ȫ�������˾����</a></p>
<p class="proShop"><a>��������</a></p>
<p class="proStatus">
<span class="spnBill">�³ɽ�<em>8.7���</em></span>
<span class="spnComment">����<em>14��</em></span>
<span class="spnCart"><a><span>���ﳵ<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>�0�6</b>29.6</p>
<p class="proTitle"><a>����ȫ�������˾����</a></p>
<p class="proShop"><a>��������</a></p>
<p class="proStatus">
<span class="spnBill">�³ɽ�<em>8.7���</em></span>
<span class="spnComment">����<em>14��</em></span>
<span class="spnCart"><a><span>���ﳵ<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>�0�6</b>29.6</p>
<p class="proTitle"><a>����ȫ�������˾����</a></p>
<p class="proShop"><a>��������</a></p>
<p class="proStatus">
<span class="spnBill">�³ɽ�<em>8.7���</em></span>
<span class="spnComment">����<em>14��</em></span>
<span class="spnCart"><a><span>���ﳵ<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>�0�6</b>29.6</p>
<p class="proTitle"><a>����ȫ�������˾����</a></p>
<p class="proShop"><a>��������</a></p>
<p class="proStatus">
<span class="spnBill">�³ɽ�<em>8.7���</em></span>
<span class="spnComment">����<em>14��</em></span>
<span class="spnCart"><a><span>���ﳵ<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>�0�6</b>29.6</p>
<p class="proTitle"><a>����ȫ�������˾����</a></p>
<p class="proShop"><a>��������</a></p>
<p class="proStatus">
<span class="spnBill">�³ɽ�<em>8.7���</em></span>
<span class="spnComment">����<em>14��</em></span>
<span class="spnCart"><a><span>���ﳵ<span></a><span>
</p>
</div>
</div>
<div class="product">
<div class="productWrap">
<a class="ImgWrap"><img src="image/2.jpg"></a>
<p class="proPrice"><b>�0�6</b>29.6</p>
<p class="proTitle"><a>����ȫ�������˾����</a></p>
<p class="proShop"><a>��������</a></p>
<p class="proStatus">
<span class="spnBill">�³ɽ�<em>8.7���</em></span>
<span class="spnComment">����<em>14��</em></span>
<span class="spnCart"><a><span>���ﳵ<span></a><span>
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