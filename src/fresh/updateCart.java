package fresh;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateCart
 */
@WebServlet("/updateCart")
public class updateCart extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			cart.setNum(num);
			userdao.updateCart(cart);
			System.out.println("¸üÐÂ³É¹¦£¡");
		}catch(Exception e) {
			e.printStackTrace();
			PrintWriter pw = response.getWriter();
			pw.write("<script language='javascript'>alert('¸üÐÂÊ§°Ü£¡')</script>");
			System.out.println("¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¸üÐÂÊ§°Ü£¡¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª");
		}
		
		
		
	}

}
