<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>提示</title>
<script>
	function countDown(){
		var time = document.getElementById("Time");
				if(time.innerHTML == 0){
					window.location.href="LoginPage.jsp";
				}else{
					time.innerHTML = time.innerHTML-1;
				}
			}
			window.setInterval("countDown()",1000);
		</script>
</head>
<body>
<tr>
用户名或密码错误，请重新再试！<br>页面将在  <span id="Time">3 </span> 秒后自动跳转至登陆界面，请稍候……
</tr>
</body>
</html>