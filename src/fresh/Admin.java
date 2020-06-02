package fresh;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Admin")
public class Admin extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GB18030");
		response.setCharacterEncoding("GB18030");
		String tablename=request.getParameter("tablename");
		switch(tablename) {
		case "地区": request.setAttribute("info", 1);
		request.getRequestDispatcher("Result.jsp").forward(request, response);
		break;
		case "贡献": request.setAttribute("info", 2);
		request.getRequestDispatcher("Result.jsp").forward(request, response);
		break;
		case "官员": request.setAttribute("info", 3);
		request.getRequestDispatcher("Result.jsp").forward(request, response);
		break;
		case "国库": request.setAttribute("info", 4);
		request.getRequestDispatcher("Result.jsp").forward(request, response);
		break;
		case "户口": request.setAttribute("info", 5);
		request.getRequestDispatcher("Result.jsp").forward(request, response);
		break;
		case "物产": request.setAttribute("info", 6);
		request.getRequestDispatcher("Result.jsp").forward(request, response);
		break;
		case "赋税": request.setAttribute("info", 7);
		request.getRequestDispatcher("Result.jsp").forward(request, response);
		break;
		case "物流": request.setAttribute("info", 8);
		request.getRequestDispatcher("Result.jsp").forward(request, response);
		break;
		default: break;}
		
	}
	}

