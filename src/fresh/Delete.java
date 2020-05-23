package fresh;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Delete")
public class Delete extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ID = request.getParameter("id");
		System.out.println(ID);
		Connection conn=DataBaseConn.getConnection();
		String sql="Delete from πŸ‘± where ID=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ID);
			ps.executeUpdate();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DataBaseConn.closeConnection(conn);
		}
		request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
	}
}
	
