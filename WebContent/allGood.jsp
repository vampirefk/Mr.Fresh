<%@page import="fresh.Good"%>
<%@page import="fresh.User"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>商品</title>
</head>
<body>


<%
	ArrayList<Good> good = (ArrayList<Good>)request.getAttribute("good");
	if(!good.isEmpty()){
%>
<table align="center">
<tr>
<th>名称</th>
<th>数量</th>
<th>价格</th>
<th>图片</th>
</tr>
<%
	for(Good goodGet : good){
%>
<tr>
<td><%=goodGet.getGoodname() %></td>
<td><%=goodGet.getNum() %></td>
<td><%=goodGet.getPrice() %></td>
<td><%=goodGet.getPic() %></td>
</tr>
<%
	}
%>
</table>
<%
	}else{
%>
	<a>未查询到相关内容！</a>
<%
	}
%>

</body>
</html>