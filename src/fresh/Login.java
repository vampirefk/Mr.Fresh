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
		String no=request.getParameter("no");
		String password=request.getParameter("password");
		UserDao userdao = new UserDao();
		User user = userdao.login(no, password);
		System.out.println(no+password);
		if(user!=null) {
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("welcome.jsp").forward(request,response);
		}else {
			request.getRequestDispatcher("ErrorLog.jsp").forward(request,response);
		}
		}
	}


