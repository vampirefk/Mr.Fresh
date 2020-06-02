package fresh;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class search extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GB18030");
		response.setCharacterEncoding("GB18030");
		response.setContentType("text/html; charset=GB18030");
		String search=request.getParameter("search");
		UserDao userdao = new UserDao();
		ArrayList<Good> good = userdao.search(search);
//		for(Good goodGet : good){
//			System.out.print(goodGet.getGoodname()+"     ");
//			System.out.print(goodGet.getNum()+"     ");
//			System.out.println(goodGet.getPrice());
//				}
		request.setAttribute("good", good);
		request.getRequestDispatcher("allGood.jsp").forward(request, response);
	}
}
