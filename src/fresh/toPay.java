package fresh;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class toPay
 */
@WebServlet("/toPay")
public class toPay extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GB18030");
		response.setCharacterEncoding("GB18030");
		String[] goodno=request.getParameterValues("check_box_list"); 
		String username=request.getParameter("username");
		UserDao userdao=new UserDao();
		ArrayList<Cart> list = new ArrayList<>();
		for(int i=0;i<goodno.length;i++) {
			System.out.println(goodno[i]);
		}
			list = userdao.Pay(goodno, username);
		if(list!=null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("payment.jsp").forward(request,response);
		}
   
	}

}
