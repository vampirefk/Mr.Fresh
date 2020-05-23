<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030" import="java.util.*" import="java.sql.*"%> 
<!DOCTYPE html>
    <%@ page import="fresh.Admin" %>
    <%@ page import="fresh.DataBaseConn"%>
<html>
<head>
<meta charset="GB18030">
<title>查询界面</title>
<style>
h1{color:#fffef8;}
body{color: #fffef8;}
</style>
</head>
<body style="background:url(<%=request.getContextPath()%>/images/head.jpg);background-size:cover; ">
<h1 align="center">查询结果：</h1>
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
<th>道</th>
<th>治所</th>
<th>地区</th>
<th>别名</th>
<th>州治所</th>
<th>县城数</th>
<th>刺史</th>
</tr>
<%
try {
	sql="SELECT * FROM 地区";
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
<th>身份号</th>
<th>日期</th>
<th>详情</th>
<th>贡献等第</th>
</tr>
<%
try {
	
	sql="SELECT * FROM 贡献";
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
<th>编号</th>
<th>姓名</th>
<th>官职</th>
<th>品级</th>
</tr>
<%
try {
	sql="SELECT * FROM 官员";
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
		<td align="right"width="30%">要删除的编号：</td>
		<td><input type="text"name="id"></td>
		<td><input type="submit"value="删除"/></td>
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
<th>日期</th>
<th>银两</th>
<th>粮食</th>
<th>马匹</th>
<th>丝绸</th>
<th>陶瓷</th>
<th>海珠</th>
<th>茶</th>
<th>糖</th>
<th>纸张</th>
<th>和田玉</th>
<th>佛经</th>
<th>象牙</th>
<th>翡翠</th>
<th>大熊猫</th>
<th>香料</th>
<th>黄金</th>
</tr>
<%
try {
	sql="SELECT * FROM 国库";
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
<th>身份号</th>
<th>姓名</th>
<th>性别</th>
<th>生辰</th>
<th>籍贯</th>
<th>地址</th>
<th>婚姻情况</th>
</tr>
<%
try {
	sql="SELECT * FROM 户口";
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
<th>地区</th>
<th>年份</th>
<th>物品</th>
<th>数量</th>
</tr>
<%
try {
	sql="SELECT * FROM 物产";
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
<th>地区</th>
<th>年份</th>
<th>百分比</th>
<th>税额</th>
</tr>
<%
try {
	sql="SELECT * FROM 赋税";
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
<th>物品编号</th>
<th>物品</th>
<th>数量</th>
<th>时间</th>
<th>价格</th>
<th>交易类型</th>
<th>来源或去向</th>
</tr>
<%
try {
	sql="SELECT * FROM 物流";
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
	<input type="button"value="返回"onClick="window.location.href='AdminPage.jsp'">
	</td>
</tr></table>

</body>
</html>