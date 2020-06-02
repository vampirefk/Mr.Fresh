package fresh;

import java.sql.*;

public class User {
	private String nickname;
	private String name;
	private String sex;
	private String password;
	
	public String getName() {
		return name;
	}
	public void setName(String n) {
		name=n;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String n) {
		nickname=n;
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
