<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>��½</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
<style>
h1{color:#fffef8;}
body{color: #fffef8;}
a{text-decoration:none;
}
</style>
</head>
<body>
    <div class="login_header clearfix">
         <a href="WelcomePage.jsp"><img src="images/logo1.png" alt="logo"></a>
    </div>

    <div class="login_form_con">
        <div class="login_form">
            <img src="images/login.jpg" class="login_banner">
            <p class="slogan fl">��ҹ���*�����ʹ�</p>
            <div class="form_input_con fr">
                <div class="form_title">
                    <h1>��Ա��¼</h1>
                </div>
                
                <form  action="Login"method="post">
                    <div class="form_group">
                        <input type="text" name="nickname" class="input_txt"
                        placeholder="�������û���">
                        <span class="error">������ʾ</span>
                    </div>

                    <div class="form_group">
                        <input type="password" name="password" class="input_pwd"
                        placeholder="����������">
                        <span class="error">������ʾ</span>
                    </div>
                    
                    <div class="form_group2">
                        <a href="Update.jsp" class="find_pass fr" style="margin-right:20px;">��������</a>
                        <a href="RegisterPage.jsp" class="find_pass fr"style="margin-right:20px;">����ע��</a>
                    </div>

                    <input type="submit" name="" value="�� ¼" class="input_sub">
	   				<input type="button"value="�� ҳ"onClick="window.location.href='welcome.jsp'"class="input_sub">
                </form>
            </div>

        </div>
    </div>

    <div class="footer login_footer">
        <div class="links">
            <a href="">��������</a>
            <span>|</span>
            <a href="">��ϵ����</a>
            <span>|</span>
            <a href="">��Ƹ�˲�</a>
            <span>|</span>
            <a href="">��������</a>
        </div>
        <p>CopyRight �0�8 2020 ��������ѧ���������������޹�˾  All Rights Reserved<br />

    �绰��021-88888888 ��ICP��88888888��</p>
    </div>

</body>
</html>