package fresh;
import java.sql.*;
import java.util.*;

public class UserDao {
	
	public User login(String no, String password) {
		User user=null;
		Connection conn=DataBaseConn.getConnection();
		String sql="select * from user where no=? and password=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, no);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setNo(rs.getString("no"));
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
	
	public boolean userIsExist(String no) {
		Connection conn=DataBaseConn.getConnection();
		String sql="select * from user where no=?";
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, no);
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
		String sql="insert into user(no,name,sex,password)values(?,?,?,?)";
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, user.getNo());
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
		String sql="select * from good where goodname like '%"+goodname+"%' ORDER BY rand()";
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
		String sql="select * from good ORDER BY rand()";
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
				good.setNo(rs.getInt("no"));
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
	
	public boolean goodInCart(int goodno, String user) {
		Connection conn=DataBaseConn.getConnection();
		String sql="select * from cart where goodno=? and user=?";
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, goodno);
			ps.setString(2, user);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				System.out.println("¸ÃÎïÆ·ÔÚ¹ºÎï³µÖÐ£¡");
				rs.close();
				ps.close();
				return true;
			}
			rs.close();
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ªgoodInCartÊ§°Ü£¡¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª");
		}finally {
			DataBaseConn.closeConnection(conn);
		}
		System.out.println("¸ÃÎïÆ·²»²»²»²»ÔÚ¹ºÎï³µÖÐ£¡");
		return false;
	}
	
	public void addToCart(Cart cart) {
		Connection conn = DataBaseConn.getConnection();
		String sql="insert into cart(goodno,user,num)values(?,?,?)";
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, cart.getGoodno());
			ps.setString(2, cart.getUser());
			ps.setInt(3, cart.getNum());
			ps.executeUpdate();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¼ÓÈë¹ºÎï³µÊ§°Ü£¡¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª");
		}finally {
			DataBaseConn.closeConnection(conn);
		}
	}
	
	public void updateCart(Cart cart) {
		Connection conn = DataBaseConn.getConnection();
		String sql="update cart set num=? where goodno=? and user=?";
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, cart.getNum());
			ps.setInt(2, cart.getGoodno());
			ps.setString(3, cart.getUser());
			ps.executeUpdate();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¸üÐÂ¹ºÎï³µÊ§°Ü£¡¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª");
		}finally {
			DataBaseConn.closeConnection(conn);
		}
	}
	
	public  ArrayList<Cart> getDBtoCart(String username) {
		Connection conn = DataBaseConn.getConnection();
		String sql="SELECT * FROM cart A RIGHT OUTER JOIN good B ON B.no=A.goodno where user=?";
		ArrayList<Cart>cartList = new ArrayList<>();
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Cart cart = new Cart();
				cart.setGoodname(rs.getString("goodname"));
				cart.setGoodno(rs.getInt("goodno"));
				cart.setPrice(rs.getFloat("price"));
				cart.setPic(rs.getByte("pic"));
				cart.setNum(rs.getInt("num"));
				cart.setUser(rs.getString("user"));
				cartList.add(cart);
			}
			rs.close();
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ªgetDBToCartÊ§°Ü£¡¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª");
		}finally {
			DataBaseConn.closeConnection(conn);
		}
		return cartList;
	}
	
	public  ArrayList<Cart> Pay(String[] goodno,String username) {
		Connection conn=DataBaseConn.getConnection();
		ArrayList<Cart>list = new ArrayList<>();
		String sql="SELECT * FROM cart A RIGHT OUTER JOIN good B ON B.no=A.goodno where goodno=? and user=?";
		try {
				  for (int i=0;i<goodno.length;i++)    
				  {
					  PreparedStatement ps = conn.prepareStatement(sql);
					  ps.setInt(1,Integer.parseInt(goodno[i]));
					  ps.setString(2,username);
					  ResultSet rs = ps.executeQuery();
					  while(rs.next()) {
						  Cart good = new Cart();
						  good.setGoodname(rs.getString("goodname"));
						  good.setGoodno(rs.getInt("goodno"));
						  good.setPrice(rs.getFloat("price"));
						  good.setPic(rs.getByte("pic"));
						  good.setNum(rs.getInt("num"));
						  good.setUser(rs.getString("user"));
						  list.add(good);
						}
						rs.close();
						ps.close();
				  }
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ªtoPay²éÑ¯´íÎó£¡¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª");
		}finally {
			DataBaseConn.closeConnection(conn);
		}
		return list;
	}
	
	public void toOrder(ArrayList<Order> order) {
		Connection conn=DataBaseConn.getConnection();
		String sql1="INSERT INTO xuhui (date,io,pic,goodno,goodname,userno,price,num,totalprice,note,province,city,county,detailAddr )VALUES(NOW(),\"³ö»õ\",?,?,?,?,?,?,?,?,?,?,?,?)";
		String sql2="DELETE from cart where user=? and goodno=?";
		try { 
			PreparedStatement ps= conn.prepareStatement(sql1);
			for(int i=0;i<order.size();i++) {
				ps.setByte(1, order.get(i).getPic());
				System.out.println(order.get(i).getPic());
				ps.setInt(2, order.get(i).getGoodno());
				System.out.println(order.get(i).getGoodno());
				ps.setString(3, order.get(i).getGoodname());
				System.out.println(order.get(i).getGoodname());
				ps.setString(4, order.get(i).getUserno());
				System.out.println(order.get(i).getUserno());
				ps.setFloat(5, order.get(i).getPrice());
				System.out.println(order.get(i).getPrice());
				ps.setInt(6, order.get(i).getNum());
				System.out.println(order.get(i).getNum());
				ps.setFloat(7,order.get(i).getTotalprice());
				System.out.println(order.get(i).getTotalprice());
				ps.setString(8, order.get(i).getNote());
				System.out.println(order.get(i).getNote());
				ps.setString(9, order.get(i).getProvince());
				System.out.println(order.get(i).getProvince());
				ps.setString(10, order.get(i).getCity());
				System.out.println(order.get(i).getCity());
				ps.setString(11, order.get(i).getCounty());
				System.out.println(order.get(i).getCounty());
				ps.setString(12, order.get(i).getdetailAddr());
				System.out.println(order.get(i).getdetailAddr());
				ps.executeUpdate();
				System.out.println("²åÈë¶©µ¥³É¹¦£¡£¡£¡");
			}
			ps.close();
			ps= conn.prepareStatement(sql2);
			for(int i=0;i<order.size();i++) {
				ps.setString(1, order.get(i).getUserno());
				ps.setInt(2, order.get(i).getGoodno());
				ps.executeUpdate();
				System.out.println("É¾³ýÔ­¹ºÎï³µÊý¾Ý³É¹¦£¡");
			}
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¼ÓÈë¹ºÎï³µÊ§°Ü£¡¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª");
		}finally {
			DataBaseConn.closeConnection(conn);
		}
	}
}
