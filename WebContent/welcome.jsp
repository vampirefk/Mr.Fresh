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
    <title>��������-��ҳ</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
       <script type="text/javascript">
	onload=function(){
		var arr = document.getElementsByClassName("slide");
		for(var i=0;i<arr.length;i++){
			arr[i].style.left = i*800+"px";
		}
	}
	//ҳ��ʧȥ����ֹͣ
	onblur = function(){
		stop();
	}
	//ҳ���ȡ����ʱ��ʼ
	onfocus = function(){
		start();
	}
	
	function LeftMove(){
		var arr = document.getElementsByClassName("slide");//��ȡ������div
		for(var i=0;i<arr.length;i++){
			var left = parseFloat(arr[i].style.left);
			left-=2;
			var width = 800;//ͼƬ�Ŀ��
			if(left<=-width){
				left=(arr.length-1)*width;//��ͼƬ��ȫ�߳���ʾ��ƴ�ӵ�ĩβ
				clearInterval(moveId);
			}
			arr[i].style.left = left+"px";
		}
	}
	function divInterval(){
		moveId=setInterval(LeftMove,1);//����һ��10���붨ʱ��
	}
	
	
	timeId=setInterval(divInterval,4000);//����һ��3��Ķ�ʱ����
	
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
        background-image: url(./images/����.jpg);
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
    <div class="header_con"><!-- -------------------------------------------ͷ��------------------------------------------------- -->
        <div class="header">
            <div class="welcome fl">��ӭ������������</div>
            <div class="user_info fr">
            	<%fresh.User user=(fresh.User)request.getSession().getAttribute("user");
            	if(user!=null){
            	%>
            	 <div class="user_login_link fl">
                		 ��ӭ�� : <em><%=user.getName()%> </em>
                		 <%if(user.getSex().equals("��")){%>
                		 <em>����</em>
                		 <%}else if(user.getSex().equals("Ů")){%>
                		 <em>Ůʿ</em>
                		 <%} %>
                		 
                </div>
                <div class="user_shopping fl">
                    <span>|</span>
                    <a href="Cart.jsp">���ﳵ</a>
                    <span>|</span>
                    <a href="Update.jsp">�޸�����</a>
                    <span>|</span>
					<a href="Exit" >�˳���½</a>
                </div>
                <%}else{ %>
                <div class="user_login_link fl">
                    <a href="LoginPage.jsp">��½</a>
                    <span>|</span>
                    <a href="RegisterPage.jsp">ע��</a>
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
                <input type="text" name="search" placeholder="����" class="input_text fl">
                <input type="submit" name="" value="����" class="input_btn fr">
            </form>
        </div>
    </div>
    <div class="sub_menu_con">
        <div class="sub_menu">
            <h1 class="fl">ȫ����Ʒ����</h1>
            <ul class="fl">
            <li><a href="" class="fruit">����ˮ��</a></li>
            <li><a href="" class="seafood">����ˮ��</a></li>
            <li><a href="" class="meat">����ţ��</a></li>
            <li><a href="" class="egg">���൰Ʒ</a></li>
            <li><a href="" class="vegetable">�����߲�</a></li>
            <li><a href="" class="ice">�ٶ�ʳƷ</a></li>
            </ul>
        </div>
    </div>
    
    <div class="center_con" >

        <div class="slide_con fl"onmouseover="stop()" onmouseout="start()">
                <div class="slide"><a href=""><img src="images/ţ��.png" alt="�õ�Ƭ" ></a></div>
                <div class="slide"><a href=""><img src="images/����.png" alt="�õ�Ƭ"></a></div>
                <div class="slide"><a href=""><img src="images/Ϻ.png" alt="�õ�Ƭ"></a></div>
                <div class="slide"><a href=""><img src="images/ӣ��.png" alt="�õ�Ƭ"></a></div>
                <div class="slide"><a href=""><img src="images/��.png" alt="�õ�Ƭ"></a></div>

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
            <a href=""><img src="images/ţ�Ź��.png" alt="���"></a>
            <a href=""><img src="images/�߲�.png" alt="���"></a>
        </div>
    </div>


<div>
    <div class="common_model">
        <div class="common_title">

            <h3 class="fl">��ѡ����</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">��ݮ</a></li>
                <li><a href="#">��֦</a></li>
                <li><a href="#">ţ�͹�</a></li>
            </ul>

            <a href="#" class="more fr">�鿴����&gt;</a>
        </div>
        <%
        //Good good[]=new Good[4];
        //for(int i = 0; i<4;i++){
        	//good[i]=(ArrayList<Good>)goods;
       // }
        %>
        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="��Ʒbanner">
            <!-- ���ھ��������Է��վ������ʵ�banner�� -->
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
                    <img src="images/����.png"style="width:180px;height:180px" alt="��ƷͼƬ"></a>
                    <p><%=goods.get(i).getPrice() %></p>
                </li>
                <%} %>
            </ul>
            
        </div>
    </div>
    <div class="common_model">
        <div class="common_title">

            <h3 class="fl">ʱ��ˮ��</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">��ݮ</a></li>
                <li><a href="#">��֦</a></li>
                <li><a href="#">ţ�͹�</a></li>
            </ul>

            <a href="#" class="more fr">�鿴����&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="��Ʒbanner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    <div class="common_model">
        <div class="common_title">

            <h3 class="fl">������Ʒ</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">��ݮ</a></li>
                <li><a href="#">��֦</a></li>
                <li><a href="#">ţ�͹�</a></li>
            </ul>

            <a href="#" class="more fr">�鿴����&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="��Ʒbanner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">����ˮ��</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">��ݮ</a></li>
                <li><a href="#">��֦</a></li>
                <li><a href="#">ţ�͹�</a></li>
            </ul>

            <a href="#" class="more fr">�鿴����&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="��Ʒbanner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">��������</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">��ݮ</a></li>
                <li><a href="#">��֦</a></li>
                <li><a href="#">ţ�͹�</a></li>
            </ul>

            <a href="#" class="more fr">�鿴����&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="��Ʒbanner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">�������</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">��ݮ</a></li>
                <li><a href="#">��֦</a></li>
                <li><a href="#">ţ�͹�</a></li>
            </ul>

            <a href="#" class="more fr">�鿴����&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="��Ʒbanner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">���ݵ�Ʒ</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">��ݮ</a></li>
                <li><a href="#">��֦</a></li>
                <li><a href="#">ţ�͹�</a></li>
            </ul>

            <a href="#" class="more fr">�鿴����&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="��Ʒbanner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">�����߲�</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">��ݮ</a></li>
                <li><a href="#">��֦</a></li>
                <li><a href="#">ţ�͹�</a></li>
            </ul>

            <a href="#" class="more fr">�鿴����&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="��Ʒbanner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">��ʳ����</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">��ݮ</a></li>
                <li><a href="#">��֦</a></li>
                <li><a href="#">ţ�͹�</a></li>
            </ul>

            <a href="#" class="more fr">�鿴����&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="��Ʒbanner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
        </div>
    </div>
    
        <div class="common_model">
        <div class="common_title">

            <h3 class="fl">�۽��ɹ�</h3>

            <ul class="fl">
                <li><span>|</span></li>
                <li><a href="#">��ݮ</a></li>
                <li><a href="#">��֦</a></li>
                <li><a href="#">ţ�͹�</a></li>
            </ul>

            <a href="#" class="more fr">�鿴����&gt;</a>
        </div>

        <div class="common_goods_list">
            <div class="goods_banner fl"><img src="images/banner.png" alt="��Ʒbanner">
            </div>
            <ul class="good_list fl">
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
                <li>
                    <h4>ţ��</h4>
                    <a href="#"><img src="images/��Ʒţ��.png" alt="��ƷͼƬ"></a>
                    <p>$ 5.00</p>
                </li>
            </ul>
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