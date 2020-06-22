<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="fresh.User" %>
<%@page import="fresh.Good"%>
<%@page import="fresh.UserDao"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="GB18030">
    <title>威猛鲜生-首页</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
       <script type="text/javascript">
	onload=function(){
		var arr = document.getElementsByClassName("slide");
		for(var i=0;i<arr.length;i++){
			arr[i].style.left = i*800+"px";
		}
	}
	//页面失去焦点停止
	onblur = function(){
		stop();
	}
	//页面获取焦点时开始
	onfocus = function(){
		start();
	}
	
	function LeftMove(){
		var arr = document.getElementsByClassName("slide");//获取三个子div
		for(var i=0;i<arr.length;i++){
			var left = parseFloat(arr[i].style.left);
			left-=2;
			var width = 800;//图片的宽度
			if(left<=-width){
				left=(arr.length-1)*width;//当图片完全走出显示框，拼接到末尾
				clearInterval(moveId);
			}
			arr[i].style.left = left+"px";
		}
	}
	function divInterval(){
		moveId=setInterval(LeftMove,1);//设置一个10毫秒定时器
	}
	
	
	timeId=setInterval(divInterval,4000);//设置一个3秒的定时器。
	
	function stop(){
		clearInterval(timeId);
	}
	function start(){
		clearInterval(timeId);
		timeId=setInterval(divInterval,4000);
	}
	function search(){
		
	}
</script>
<!-- 
<style>
    body{
        background-image: url(./images/背景.jpg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100%;
    }
    .hover{
        font-size: larger;
        background-color: darkorange;
    }
</style> -->

</head>
<body>
    <div class="header_con"><!-- -------------------------------------------头部------------------------------------------------- -->
        <div class="header">
            <div class="welcome fl">欢迎来到威猛鲜生</div>
            <div class="user_info fr">
            	<%fresh.User user=(fresh.User)request.getSession().getAttribute("user");
            	if(user!=null){
            	%>
            	 <div class="user_login_link fl">
                		 欢迎您 : <em><%=user.getName()%> </em>
                		 <%if(user.getSex().equals("男")){%>
                		 <em>先生</em>
                		 <%}else if(user.getSex().equals("女")){%>
                		 <em>女士</em>
                		 <%} %>
                		 
                </div>
                <div class="user_shopping fl">
                    <span>|</span>
                    <a href="Cart.jsp">购物车</a>
                    <span>|</span>
                    <a href="Update.jsp">修改密码</a>
                    <span>|</span>
					<a href="Exit" >退出登陆</a>
                </div>
                <%}else{ %>
                <div class="user_login_link fl">
                    <a href="LoginPage.jsp">登陆</a>
                    <span>|</span>
                    <a href="RegisterPage.jsp">注册</a>
                </div>
                <%} %>
            </div>
        </div>
    </div>
    <div class="logo_bar">
        <div class="logo fl">
            <a href="#"><img src="images/logo1.png"></a>
        </div>
        <div class="search fl">
            <form action="search" method="post">
                <input type="text" name="search" placeholder="搜索" class="input_text fl">
                <input type="submit" name="" value="搜索" class="input_btn fr">
            </form>
        </div>
    </div>
    <div class="sub_menu_con">
        <div class="sub_menu">
            <h1 class="fl">全部商品分类</h1>
            <ul class="fl">
            <li><a href="" class="fruit">新鲜水果</a></li>
            <li><a href="" class="seafood">海鲜水产</a></li>
            <li><a href="" class="meat">猪肉牛肉</a></li>
            <li><a href="" class="egg">禽类蛋品</a></li>
            <li><a href="" class="vegetable">新鲜蔬菜</a></li>
            <li><a href="" class="ice">速冻食品</a></li>
            </ul>
        </div>
    </div>
    
    <div class="center_con" >

        <div class="slide_con fl"onmouseover="stop()" onmouseout="start()">
                <div class="slide"><a href=""><img src="images/牛排.png" alt="幻灯片" ></a></div>
                <div class="slide"><a href=""><img src="images/生菜.png" alt="幻灯片"></a></div>
                <div class="slide"><a href=""><img src="images/虾.png" alt="幻灯片"></a></div>
                <div class="slide"><a href=""><img src="images/樱桃.png" alt="幻灯片"></a></div>
                <div class="slide"><a href=""><img src="images/鱼.png" alt="幻灯片"></a></div>

        <!--     <ul class="points">
                <li class="active"></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
            
             -->
        </div>
        
        
        <div class="adv fl" >
            <a href=""><img src="images/牛排广告.png" alt="广告"></a>
            <a href=""><img src="images/蔬菜.png" alt="广告"></a>
        </div>
    </div>


<div>
    <div class="common_model">
        <div class="common_title">

            <h3 class="fl">精选好物</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">草莓</a></li>
                <li><a href="#">荔枝</a></li>
                <li><a href="#">牛油果</a></li>
            </ul>

            <a href="#" class="more fr">查看更多&gt;</a>
        </div>
        <%
        //Good good[]=new Good[4];
        //for(int i = 0; i<4;i++){
        	//good[i]=(ArrayList<Good>)goods;
       // }
        %>
        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="商品banner">
            <!-- 后期精化：可以仿照京东生鲜的banner做 -->
            </div>
            <ul class="good_list fl">
            <%
            UserDao userdao = new UserDao();
            ArrayList<Good>goods=new ArrayList<Good>();
            goods = (ArrayList<Good>)userdao.getAll();
            for(int i=0;i<4;i++){ %>
                <li>
                    <h4><%=goods.get(i).getGoodname()%></h4>
                    <a href="detail.jsp?no=<%=goods.get(i).getNo()%>"target="_blank">
                    <img src="images/生菜.png"style="width:180px;height:180px" alt="商品图片"></a>
                    <p><%=goods.get(i).getPrice() %></p>
                </li>
                <%} %>
            </ul>
            
        </div>
    </div>
    <div class="common_model">
        <div class="common_title">

            <h3 class="fl">时令水果</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">草莓</a></li>
                <li><a href="#">荔枝</a></li>
                <li><a href="#">牛油果</a></li>
            </ul>

            <a href="#" class="more fr">查看更多&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="商品banner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    <div class="common_model">
        <div class="common_title">

            <h3 class="fl">安心乳品</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">草莓</a></li>
                <li><a href="#">荔枝</a></li>
                <li><a href="#">牛油果</a></li>
            </ul>

            <a href="#" class="more fr">查看更多&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="商品banner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">海鲜水产</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">草莓</a></li>
                <li><a href="#">荔枝</a></li>
                <li><a href="#">牛油果</a></li>
            </ul>

            <a href="#" class="more fr">查看更多&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="商品banner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">米面粮油</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">草莓</a></li>
                <li><a href="#">荔枝</a></li>
                <li><a href="#">牛油果</a></li>
            </ul>

            <a href="#" class="more fr">查看更多&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="商品banner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">酒饮冲调</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">草莓</a></li>
                <li><a href="#">荔枝</a></li>
                <li><a href="#">牛油果</a></li>
            </ul>

            <a href="#" class="more fr">查看更多&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="商品banner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">肉禽蛋品</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">草莓</a></li>
                <li><a href="#">荔枝</a></li>
                <li><a href="#">牛油果</a></li>
            </ul>

            <a href="#" class="more fr">查看更多&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="商品banner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">新鲜蔬菜</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">草莓</a></li>
                <li><a href="#">荔枝</a></li>
                <li><a href="#">牛油果</a></li>
            </ul>

            <a href="#" class="more fr">查看更多&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="商品banner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">熟食餐饮</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">草莓</a></li>
                <li><a href="#">荔枝</a></li>
                <li><a href="#">牛油果</a></li>
            </ul>

            <a href="#" class="more fr">查看更多&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="商品banner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">蜜饯干果</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">草莓</a></li>
                <li><a href="#">荔枝</a></li>
                <li><a href="#">牛油果</a></li>
            </ul>

            <a href="#" class="more fr">查看更多&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="商品banner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>牛排</h4>
                    <a href="#"><img src="images/商品牛排.png" alt="商品图片"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
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