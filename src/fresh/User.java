package fresh;

import java.sql.*;

public class User {
	private String no;
	private String name;
	private String sex;
	private String password;
	
	public String getName() {
		return name;
	}
	public void setName(String n) {
		name=n;
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String n) {
		no=n;
	}
	
	public String getSex() {
		return sex;
	}
	public void setSex(String s) {
		sex=s;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String p) {
		password=p;
	}

}
