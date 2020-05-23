package fresh;


import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname=request.getParameter("nickname");
		String password=request.getParameter("password");
		UserDao userdao = new UserDao();
		User user = userdao.login(nickname, password);
		if(user!=null) {
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("HomePage.jsp").forward(request,response);
		}else {
			request.getRequestDispatcher("ErrorLog.jsp").forward(request,response);
		}
		}
	}


