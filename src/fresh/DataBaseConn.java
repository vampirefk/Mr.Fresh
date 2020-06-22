package fresh;
import java.sql.*;

public class DataBaseConn {
	public static Connection getConnection(){
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbURL="jdbc:mysql://localhost:3306/fresh";
			conn=DriverManager.getConnection(dbURL,"root","fengfeng");
			System.out.println("数据库连接成功");
		}catch(Exception e){
			e.printStackTrace();
		    System.out.println("！！！！！！！！！！！！！！！！！连接失败！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！");
		    }return conn;
		}																				//连接数据库
	
	public static void closeConnection(Connection conn) {
		if(conn!=null) {
			try {
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}
