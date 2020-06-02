package fresh;
import java.sql.*;
import java.util.*;

public class UserDao {
	
	public User login(String nickname, String password) {
		User user=null;
		Connection conn=DataBaseConn.getConnection();
		String sql="select * from user where nickname=? and password=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, nickname);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setNickname(rs.getString("nickname"));
				user.setName(rs.getString("name"));
				user.setSex(rs.getString("sex"));
				user.setPassword(rs.getString("password"));
			}
			rs.close();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DataBaseConn.closeConnection(conn);
		}
		return user;
	}
	
	public boolean userIsExist(String nickname) {
		Connection conn=DataBaseConn.getConnection();
		String sql="select * from user where nickname=?";
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, nickname);
			ResultSet rs = ps.executeQuery();
			if(!rs.next()) {
				return true;
			}
			rs.close();
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseConn.closeConnection(conn);
		}
		return false;
	}
	
	public void saveUser(User user) {
		Connection conn = DataBaseConn.getConnection();
		String sql="insert into user(nickname,name,sex,password)values(?,?,?,?)";
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, user.getNickname());
			ps.setString(2, user.getName());
			ps.setString(3, user.getSex());
			ps.setString(4, user.getPassword());
			ps.executeUpdate();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DataBaseConn.closeConnection(conn);
		}
	}
	
	public ArrayList<Good> search(String goodname) {
		Good good = null;
		ArrayList<Good>list = new ArrayList<>();
		Connection conn=DataBaseConn.getConnection();
		String sql="select * from good where goodname like '%"+goodname+"%'";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				good = new Good();
				good.setNo(rs.getInt("no"));
				good.setGoodname(rs.getString("goodname"));
				good.setNum(rs.getInt("num"));
				good.setPrice(rs.getFloat("price"));
				good.setPic(rs.getByte("pic"));
				list.add(good);
			}
//			for(Good goodGet : list){
//				System.out.print(goodGet.getGoodname()+'	');
//				System.out.print(goodGet.getNum()+"     ");
//				System.out.println(goodGet.getPrice());
//					}
			rs.close();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ªsqlÓï¾ä´íÎó£¡¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª");
		}finally {
			DataBaseConn.closeConnection(conn);
		}
		return list;
	}
	
	public ArrayList<Good> getAll() {
		Good goods = null;
		ArrayList<Good>listAll = new ArrayList<>();
		Connection conn=DataBaseConn.getConnection();
		String sql="select * from good";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				goods = new Good();
				goods.setNo(rs.getInt("no"));
				goods.setGoodname(rs.getString("goodname"));
				goods.setNum(rs.getInt("num"));
				goods.setPrice(rs.getFloat("price"));
				goods.setPic(rs.getByte("pic"));
				listAll.add(goods);
			}
//			for(Good goodGet : listAll){
//				System.out.print(goodGet.getGoodname()+'	');
//				System.out.print(goodGet.getNum()+"     ");
//				System.out.println(goodGet.getPrice());
//					}
			rs.close();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ªsqlÓï¾ä´íÎó£¡¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª");
		}finally {
			DataBaseConn.closeConnection(conn);
		}
		return listAll;
	}
	
	public Good detailSearch(int no) {
		Good good = null;
		Connection conn=DataBaseConn.getConnection();
		String sql="select * from good where no=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				good = new Good();
				good.setGoodname(rs.getString("goodname"));
				good.setNum(rs.getInt("num"));
				good.setPrice(rs.getFloat("price"));
				good.setPic(rs.getByte("pic"));
			}
			rs.close();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ªdetailSearchÊ§°Ü£¡¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª");
		}finally {
			DataBaseConn.closeConnection(conn);
		}
		return good;
	}
	
}
