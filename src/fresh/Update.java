package fresh;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Update")
public class Update extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		fresh.User user=(fresh.User)request.getSession().getAttribute("user");
		String pass = request.getParameter("password");
		String nickname = user.getNickname();
		Connection conn=DataBaseConn.getConnection();
		String sql="Update user set Password=? where nickname=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pass);
			ps.setString(2, nickname);
			ps.executeUpdate();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DataBaseConn.closeConnection(conn);
		}
		request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
	}
}
