<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>登陆</title>
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
            <p class="slogan fl">日夜兼程*急速送达</p>
            <div class="form_input_con fr">
                <div class="form_title">
                    <h1>会员登录</h1>
                </div>
                
                <form  action="Login"method="post">
                    <div class="form_group">
                        <input type="text" name="nickname" class="input_txt"
                        placeholder="请输入用户名">
                        <span class="error">文字提示</span>
                    </div>

                    <div class="form_group">
                        <input type="password" name="password" class="input_pwd"
                        placeholder="请输入密码">
                        <span class="error">文字提示</span>
                    </div>
                    
                    <div class="form_group2">
                        <a href="Update.jsp" class="find_pass fr" style="margin-right:20px;">忘记密码</a>
                        <a href="RegisterPage.jsp" class="find_pass fr"style="margin-right:20px;">立即注册</a>
                    </div>

                    <input type="submit" name="" value="登 录" class="input_sub">
	   				<input type="button"value="首 页"onClick="window.location.href='welcome.jsp'"class="input_sub">
                </form>
            </div>

        </div>
    </div>

    <div class="footer login_footer">
        <div class="links">
            <a href="">关于我们</a>
            <span>|</span>
            <a href="">联系我们</a>
            <span>|</span>
            <a href="">招聘人才</a>
            <span>|</span>
            <a href="">友情链接</a>
        </div>
        <p>CopyRight © 2020 华东理工大学威猛鲜生集团有限公司  All Rights Reserved<br />

    电话：021-88888888 沪ICP备88888888号</p>
    </div>

</body>
</html>