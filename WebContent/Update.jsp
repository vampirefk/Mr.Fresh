<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030" import="java.util.*" import="java.sql.*"%> 
<!DOCTYPE html>
    <%@ page import="fresh.Admin" %>
    <%@ page import="fresh.DataBaseConn"%>
    <%@ page import="fresh.User" %>
<html>
<head>
<meta charset="GB18030">
<title>Update</title>
<style>
h1{color:#fffef8;}
body{color: #fffef8;}
</style>
</head>
<body style="background:url(<%=request.getContextPath()%>/images/head.jpg);background-size:cover; ">

<form action="Update"method="post">
<table align="center"border="0"width="500"height=150px>

<tr>
	<td align="right">�����룺</td>
	<td><input type="text"name="password"class="box"></td>
</tr>

<tr>
	<td colspan="2"align="center"height="40">
		<input type="submit"value="�� ��">
		<input type="button"value="�� ��"onClick="window.location.href='HomePage.jsp'">
</td>
</tr>
</table>
</form>
</table>

</body>
</html>