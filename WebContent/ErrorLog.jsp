<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>��ʾ</title>
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
�û���������������������ԣ�<br>ҳ�潫��  <span id="Time">3 </span> ����Զ���ת����½���棬���Ժ򡭡�
</tr>
</body>
</html>