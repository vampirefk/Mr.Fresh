package fresh;
import java.sql.*;

public class DataBaseConn {
	public static Connection getConnection(){
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbURL="jdbc:mysql://localhost:3306/fresh";
			conn=DriverManager.getConnection(dbURL,"root","fengfeng");
			System.out.println("���ݿ����ӳɹ�");
		}catch(Exception e){
			e.printStackTrace();
		    System.out.println("��������������������������������������ʧ�ܣ�����������������������������������������������������������������");
		    }return conn;
		}																				//�������ݿ�
	
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
