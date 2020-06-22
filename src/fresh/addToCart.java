package fresh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addToCart
 */
@WebServlet("/addToCart")

public class addToCart extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GB18030");
		response.setCharacterEncoding("GB18030");
		int goodNo =  Integer.parseInt(request.getParameter("goodno"));
		String userno = request.getParameter("userno");
		int num = Integer.parseInt(request.getParameter("salenum"));
		System.out.println("username:"+userno+"	goodno:"+goodNo+"	salenum:"+num);
		try {
				UserDao userdao=new UserDao();
				Cart cart = new Cart();
					cart.setGoodno(goodNo);
					cart.setUser(userno);
					if(!userdao.goodInCart(cart.getGoodno(),cart.getUser())){
						cart.setNum(num);
						userdao.addToCart(cart);
					}else{
						int sum = cart.getNum();
						sum = sum + num;
						cart.setNum(sum);
						userdao.updateCart(cart);
					}
					
					PrintWriter pw = response.getWriter();
					pw.write("<script language='javascript'>alert('¼ÓÈë³É¹¦£¡')</script>");
			}catch(Exception e) {
				e.printStackTrace();
				PrintWriter pw = response.getWriter();
				pw.write("<script language='javascript'>alert('¼ÓÈëÊ§°Ü£¡')</script>");
				System.out.println("¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¼ÓÈë¹ºÎï³µÊ§°Ü£¡¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª");
			}
	}

}
