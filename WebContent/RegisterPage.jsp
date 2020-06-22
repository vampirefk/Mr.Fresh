<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>欢迎注册！</title>
<link rel="stylesheet" type="text/css" href="css/login.css">

    <style type="text/css">
    h1{color:#fffef8;}

        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            padding: 0;
            font: 16px/20px microsft yahei;
         }
        .wrap {
            width: 100%;
            height: 570px;
            opacity: 0.9;
            padding:0 300px;
            background: linear-gradient(to bottom right,#1ba784, #43b244);
            background: -webkit-linear-gr adient(to bottom right,#50a3a2,#53e3a6);
        }
        .container {
            width: 370px;
            height:450px;
            margin: 45px auto;
            float:right;
            background-color:white;
        }
        .container input {
            width: 300px;
            display: block;
            height: 36px;
            border: 0;
            outline: 0;
            padding: 6px 10px;
            line-height: 24px;
            margin: 20px auto;
            -webkit-transition: all 0s ease-in 0.1ms;
            -moz-transition: all 0s ease-in 0.1ms;
            transition: all 0s ease-in 0.1ms;
        }
        .container input[type="text"] , .container input[type="password"]{
            background-color: #F8F8F8;
            font-size: 16px;
            color: #666666;
        }
        .container input[type='submit'], .container input[type="button"] {
            font-size: 20px;
            letter-spacing: 2px;
            color: white;
            background-color: #1ba784;
        }
        .container input:focus {
            width: 315px;
        }
        .container input[type='submit']:hover {
            cursor: pointer;
            width:330px;
        }
        .container input[type='button']:hover {
            cursor: pointer;
            width:330px;
        }
        .to_login{
            color: #a7c4c9;
        }
        .text{
            color: white;
        }
        .wrap ul {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -20;
        }
        .wrap ul li {
            list-style-type: none;
            display: block;
            position: absolute;
            bottom: -120px;
            width: 15px;
            height: 15px;
            z-index: -8;
            border-radius: 50%;
            box-shadow: inset -30px -30px 75px rgba(0, 0, 0, .2),
            inset 0px 0px 5px rgba(0, 0, 0, .5),
            inset -3px -3px 5px rgba(0, 0, 0, .5),
            0 0 20px rgba(255, 255, 255, .75);
            background-color:rgba(255, 255, 255, 0.15);
            animotion: square 25s infinite;
            -webkit-animation: square 25s infinite;
        }
        .wrap ul li:nth-child(1) {
            left: 0;
            animation-duration: 10s;
            -moz-animation-duration: 10s;
            -o-animation-duration: 10s;
            -webkit-animation-duration: 10s;
        }
        .wrap ul li:nth-child(2) {
            width: 40px;
            height: 40px;
            left: 10%;
            animation-duration: 15s;
            -moz-animation-duration: 15s;
            -o-animation-duration: 15s;
            -webkit-animation-duration: 11s;
        }
        .wrap ul li:nth-child(3) {
            left: 20%;
            width: 25px;
            height: 25px;
            animation-duration: 12s;
            -moz-animation-duration: 12s;
            -o-animation-duration: 12s;
            -webkit-animation-duration: 12s;
        }
        .wrap ul li:nth-child(4) {
            width: 50px;
            height: 50px;
            left: 30%;
            -webkit-animation-delay: 3s;
            -moz-animation-delay: 3s;
            -o-animation-delay: 3s;
            animation-delay: 3s;
            animation-duration: 12s;
            -moz-animation-duration: 12s;
            -o-animation-duration: 12s;
            -webkit-animation-duration: 12s;
        }
        .wrap ul li:nth-child(5) {
            width: 60px;
            height: 60px;
            left: 40%;
            animation-duration: 10s;
            -moz-animation-duration: 10s;
            -o-animation-duration: 10s;
            -webkit-animation-duration: 10s;
        }
        .wrap ul li:nth-child(6) {
            width: 75px;
            height: 75px;
            left: 50%;
            -webkit-animation-delay: 7s;
            -moz-animation-delay: 7s;
            -o-animation-delay: 7s;
            animation-delay: 7s;
        }
        .wrap ul li:nth-child(7) {
            left: 60%;
            width: 30px;
            height: 30px;
            animation-duration: 8s;
            -moz-animation-duration: 8s;
            -o-animation-duration: 8s;
            -webkit-animation-duration: 8s;
        }
        .wrap ul li:nth-child(8) {
            width: 90px;
            height: 90px;
            left: 70%;
            -webkit-animation-delay: 4s;
            -moz-animation-delay: 4s;
            -o-animation-delay: 4s;
            animation-delay: 4s;
        }
        .wrap ul li:nth-child(9) {
            width: 50px;
            height: 50px;
            left: 80%;
            animation-duration: 20s;
            -moz-animation-duration: 20s;
            -o-animation-duration: 20s;
            -webkit-animation-duration: 20s;
        }
        .wrap ul li:nth-child(10) {
            width: 75px;
            height: 75px;
            left: 90%;
            -webkit-animation-delay: 6s;
            -moz-animation-delay: 6s;
            -o-animation-delay: 6s;
            animation-delay: 6s;
            animation-duration: 30s;
            -moz-animation-duration: 30s;
            -o-animation-duration: 30s;
            -webkit-animation-duration: 30s;
        }
        @keyframes square {
            0% {
                -webkit-transform: translateY(0);
                transform: translateY(0)
            }
            100% {
                bottom: 400px;
                -webkit-transform: translateY(-500);
                transform: translateY(-500)
            }
        }
        @-webkit-keyframes square {
            0% {
                -webkit-transform: translateY(0);
                transform: translateY(0)
            }
            100% {
                bottom: 400px;
                -webkit-transform: translateY(-500);
                transform: translateY(-500)
            }
        }
    </style>


</head>
<body>
    <div class="login_header clearfix">
         <a href="WelcomePage.jsp"><img src="images/logo1.png" alt="logo"></a>
    </div>
    <div class="wrap">
    <div class="form_input_con fr">
                <div class="form_title">
                    <h1>欢迎注册</h1>
                </div>
	<form  action="Register"method="post">
	
		<div class="form_group">
        	<input type="text" name="no" class="input_txt"
        	placeholder="请输入用户名">
            	<span class="error">文字提示</span>
        </div>
        
		<div class="form_group">
        	<input type="text" name="name" class="input_txt"
        	placeholder="请输入姓名">
            	<span class="error">文字提示</span>
        </div>
        
		<div style="height:30px">
			<label style="margin:0 60px 0 0"><input name="sex" type="radio" value="男" />男 </label> 
			<label><input name="sex" type="radio" value="女" />女 </label> 
		</div>
		
        <div class="form_group">
        	<input type="password" name="password" class="input_pwd" 
        	placeholder="密码" />
        </div>

		<input type="submit" value="注 册" class="input_sub">
		<input type="button"value="首 页"onClick="window.location.href='Home.html'" class="input_sub">
    <p style="text-align: center; margin:0" >
    	<span class="text">已有账号？</span>
        <a href="LoginPage.jsp">前往登录！</a>
	</p>
	
    	</form>
    </div>






    <ul>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>

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