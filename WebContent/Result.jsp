<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030" import="java.util.*" import="java.sql.*"%> 
<!DOCTYPE html>
    <%@ page import="fresh.Admin" %>
    <%@ page import="fresh.DataBaseConn"%>
<html>
<head>
<meta charset="GB18030">
<title>��ѯ����</title>
<style>
h1{color:#fffef8;}
body{color: #fffef8;}
</style>
</head>
<body style="background:url(<%=request.getContextPath()%>/images/head.jpg);background-size:cover; ">
<h1 align="center">��ѯ�����</h1>
<table align="center"border="1"width="500">
<%
Integer info=(Integer)request.getAttribute("info");
Connection conn;
Statement statement;
String sql;
conn = DataBaseConn.getConnection();
statement=conn.createStatement();
switch(info){
case 1:%>
<tr>
<th>��</th>
<th>����</th>
<th>����</th>
<th>����</th>
<th>������</th>
<th>�س���</th>
<th>��ʷ</th>
</tr>
<%
try {
	sql="SELECT * FROM ����";
	ResultSet rs = statement.executeQuery(sql);
	while(rs.next()) {
	%>
	<tr>
	<td><div align="center"><%=rs.getString("Dao")%></div></td>
	<td><div align="center"><%=rs.getString("ZhiSuo")%></div></td>
	<td><div align="center"><%=rs.getString("Place")%></div></td>
	<td><div align="center"><%=rs.getString("OtherName")%></div></td>
		<td><div align="center"><%=rs.getString("ZhouZhiSuo")%></div></td>
			<td><div align="center"><%=rs.getString("NumofXian")%></div></td>
				<td><div align="center"><%=rs.getString("Governer")%></div></td>
	</tr>
	<%
	}
}catch(SQLException e){
	e.printStackTrace();
}finally {
	DataBaseConn.closeConnection(conn);
}break;

case 2:%>
<tr>
<th>��ݺ�</th>
<th>����</th>
<th>����</th>
<th>���׵ȵ�</th>
</tr>
<%
try {
	
	sql="SELECT * FROM ����";
	ResultSet rs = statement.executeQuery(sql);
	while(rs.next()) {
	%>
	<tr>
	<td><div align="center"><%=rs.getString("IDNo")%></div></td>
	<td><div align="center"><%=rs.getString("Date")%></div></td>
	<td><div align="center"><%=rs.getString("Detail")%></div></td>
	<td><div align="center"><%=rs.getString("Rank")%></div></td>	</tr>
	<%
	}
}catch(SQLException e){
	e.printStackTrace();
}finally {
	DataBaseConn.closeConnection(conn);
}break;

case 3:%>
<tr>
<th>���</th>
<th>����</th>
<th>��ְ</th>
<th>Ʒ��</th>
</tr>
<%
try {
	sql="SELECT * FROM ��Ա";
	ResultSet rs = statement.executeQuery(sql);
	while(rs.next()) {
	%>
	<tr>
	<td><div align="center"><%=rs.getString("ID")%></div></td>
	<td><div align="center"><%=rs.getString("Name")%></div></td>
	<td><div align="center"><%=rs.getString("Occupation")%></div></td>
	<td><div align="center"><%=rs.getString("Rank")%></div></td>
	</tr>
	<%
	}%>
		<div><form action="Delete"method="post">
<table align="center"border="0"width="500">
<tr>
	<tr>
		<td align="right"width="30%">Ҫɾ���ı�ţ�</td>
		<td><input type="text"name="id"></td>
		<td><input type="submit"value="ɾ��"/></td>
</tr>
</table>
</form></div>
	<%
}catch(SQLException e){
	e.printStackTrace();
}finally {
	DataBaseConn.closeConnection(conn);
}break;

case 4:%>
<tr>
<th>����</th>
<th>����</th>
<th>��ʳ</th>
<th>��ƥ</th>
<th>˿��</th>
<th>�մ�</th>
<th>����</th>
<th>��</th>
<th>��</th>
<th>ֽ��</th>
<th>������</th>
<th>��</th>
<th>����</th>
<th>���</th>
<th>����è</th>
<th>����</th>
<th>�ƽ�</th>
</tr>
<%
try {
	sql="SELECT * FROM ����";
	ResultSet rs = statement.executeQuery(sql);
	while(rs.next()) {
	%>
	<tr>
	<td><div align="center"><%=rs.getString("Time")%></div></td>
	<td><div align="center"><%=rs.getString("Money")%></div></td>
	<td><div align="center"><%=rs.getString("Food")%></div></td>
	<td><div align="center"><%=rs.getString("Horse")%></div></td>
		<td><div align="center"><%=rs.getString("Silk")%></div></td>
	<td><div align="center"><%=rs.getString("Ceramic")%></div></td>
	<td><div align="center"><%=rs.getString("Pearl")%></div></td>
	<td><div align="center"><%=rs.getString("Tea")%></div></td>
	
		<td><div align="center"><%=rs.getString("Sugar")%></div></td>
	<td><div align="center"><%=rs.getString("Paper")%></div></td>
	<td><div align="center"><%=rs.getString("HetianYu")%></div></td>
	<td><div align="center"><%=rs.getString("FoJing")%></div></td>
		<td><div align="center"><%=rs.getString("XiangYa")%></div></td>
	<td><div align="center"><%=rs.getString("FeiCui")%></div></td>
	<td><div align="center"><%=rs.getString("GiantPanda")%></div></td>
	<td><div align="center"><%=rs.getString("Perfume")%></div></td>
		<td><div align="center"><%=rs.getString("Gold")%></div></td>


	</tr>
	<%
	}
}catch(SQLException e){
	e.printStackTrace();
}finally {
	DataBaseConn.closeConnection(conn);
}break;

case 5:%>
<tr>
<th>��ݺ�</th>
<th>����</th>
<th>�Ա�</th>
<th>����</th>
<th>����</th>
<th>��ַ</th>
<th>�������</th>
</tr>
<%
try {
	sql="SELECT * FROM ����";
	ResultSet rs = statement.executeQuery(sql);
	while(rs.next()) {
	%>
	<tr>
	
		<td><div align="center"><%=rs.getString("IDNo")%></div></td>
	<td><div align="center"><%=rs.getString("Name")%></div></td>
	<td><div align="center"><%=rs.getString("Sex")%></div></td>
		<td><div align="center"><%=rs.getString("Birth")%></div></td>
	<td><div align="center"><%=rs.getString("NativePlace")%></div></td>
	<td><div align="center"><%=rs.getString("Address")%></div></td>
	<td><div align="center"><%=rs.getString("Marriage")%></div></td>
	</tr>
	<%
	}
}catch(SQLException e){
	e.printStackTrace();
}finally {
	DataBaseConn.closeConnection(conn);
}break;

case 6:%>
<tr>
<th>����</th>
<th>���</th>
<th>��Ʒ</th>
<th>����</th>
</tr>
<%
try {
	sql="SELECT * FROM ���";
	ResultSet rs = statement.executeQuery(sql);
	while(rs.next()) {
	%>
	<tr>
	<td><%=rs.getString("Place")%></td>
	<td><%=rs.getString("Year")%></td>
	<td><%=rs.getString("ProductName")%></td>
	<td><%=rs.getString("Quantity")%></td>
	
		<td><div align="center"><%=rs.getString("Place")%></div></td>
	<td><div align="center"><%=rs.getString("Year")%></div></td>
		<td><div align="center"><%=rs.getString("ProductName")%></div></td>
	<td><div align="center"><%=rs.getString("Quantity")%></div></td>
	</tr>
	<%
	}
}catch(SQLException e){
	e.printStackTrace();
}finally {
	DataBaseConn.closeConnection(conn);
}break;

case 7:%>
<tr>
<th>����</th>
<th>���</th>
<th>�ٷֱ�</th>
<th>˰��</th>
</tr>
<%
try {
	sql="SELECT * FROM ��˰";
	ResultSet rs = statement.executeQuery(sql);
	while(rs.next()) {
	%>
	<tr>
			<td><div align="center"><%=rs.getString("Place")%></div></td>
	<td><div align="center"><%=rs.getString("Year")%></div></td>
		<td><div align="center"><%=rs.getString("Percentage")%></div></td>
	<td><div align="center"><%=rs.getString("TaxSum")%></div></td>
	</tr>
	<%
	}
}catch(SQLException e){
	e.printStackTrace();
}finally {
	DataBaseConn.closeConnection(conn);
}break;

case 8:%>
<tr>
<th>��Ʒ���</th>
<th>��Ʒ</th>
<th>����</th>
<th>ʱ��</th>
<th>�۸�</th>
<th>��������</th>
<th>��Դ��ȥ��</th>
</tr>
<%
try {
	sql="SELECT * FROM ����";
	ResultSet rs = statement.executeQuery(sql);
	while(rs.next()) {
	%>
	<tr>
				<td><div align="center"><%=rs.getString("ItemNo")%></div></td>
	<td><div align="center"><%=rs.getString("ItemName")%></div></td>
		<td><div align="center"><%=rs.getString("Quantity")%></div></td>
	<td><div align="center"><%=rs.getString("TimeDate")%></div></td>
		<td><div align="center"><%=rs.getString("Price")%></div></td>
			<td><div align="center"><%=rs.getString("DealType")%></div></td>
				<td><div align="center"><%=rs.getString("ToFrom")%></div></td>
	</tr>
	<%
	}
}catch(SQLException e){
	e.printStackTrace();
}finally {
	DataBaseConn.closeConnection(conn);
}break;
}
%>



</table>
<table align="center"border="0"width="500"><tr>
	<td colspan="2"align="center"height="50">
	<input type="button"value="����"onClick="window.location.href='AdminPage.jsp'">
	</td>
</tr></table>

</body>
</html>