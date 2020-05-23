<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030" import="java.util.*" import="java.sql.*"%> 
<!DOCTYPE html>
    <%@ page import="fresh.Admin" %>
    <%@ page import="fresh.DataBaseConn"%>
<html>
<head>
<meta charset="GB18030">
<title>管理页面</title>
<style>
h1{color:#fffef8;}
body{color: #fffef8;}
</style>
</head>
<body style="background:url(<%=request.getContextPath()%>/images/head.jpg);background-size:cover; ">
<%
List list = new ArrayList();
Connection conn = DataBaseConn.getConnection();
String sql="SELECT Name FROM SysObjects Where XType='U' ORDER BY Name";
Statement statement;
try {
	statement=conn.createStatement();
	ResultSet rs = statement.executeQuery(sql);
	while(rs.next()) {
		String table = rs.getString(1);
		list.add(table);
	}
}catch(SQLException e){
	e.printStackTrace();
}finally {
	DataBaseConn.closeConnection(conn);
}
%>

<h1 align='center'>欢迎登陆后台管理平台</h1>
<form action="Admin"method="post">
<table align="center"border="0"width="500">
<tr>
	<td align="right">您要查询的板块：</td>
	<td>
	<select name="tablename">
	<%
	for (int i=0;i<list.size();i++){
	%>
	<option value="<%=list.get(i)%>"><%=list.get(i)%></option>
	<%} %>
	</select>
	</td>
</tr>
<tr>
	<td colspan="2"align="center"height="40">
		<input type="submit"value="查询">
</td>
</tr>
</table>
</form>
</body>
</html>