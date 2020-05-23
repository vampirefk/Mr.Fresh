package fresh;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/Register")


public class Register extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GB18030");
		response.setCharacterEncoding("GB18030");
		String nickname = request.getParameter("nickname");
		String name = request.getParameter("name");
		String pass = request.getParameter("password");
		String sex = request.getParameter("sex");
		UserDao userDao = new UserDao();
		if(nickname != null && !nickname.isEmpty()) {
			if(userDao.userIsExist(nickname)) {
				User user= new User();
				user.setNickname(nickname);
				user.setName(name);
				user.setSex(sex);
				user.setPassword(pass);
				userDao.saveUser(user);
				request.getRequestDispatcher("SkipTo.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("ErrorReg.jsp").forward(request,response);
			}
		}
	}
}