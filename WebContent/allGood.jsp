<%@page import="fresh.Good"%>
<%@page import="fresh.User"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>��Ʒ</title>
</head>
<body>


<%
	ArrayList<Good> good = (ArrayList<Good>)request.getAttribute("good");
	if(!good.isEmpty()){
%>
<table align="center">
<tr>
<th>����</th>
<th>����</th>
<th>�۸�</th>
<th>ͼƬ</th>
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
	<a>δ��ѯ��������ݣ�</a>
<%
	}
%>

</body>
</html>