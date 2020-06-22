package fresh;

public class Order {
	private byte pic;
	private int goodno;
	private String goodname;
	private String userno;
	private float price;
	private int num;
	private float totalprice;
	private String note;
	private String province;
	private String city;
	private String county;
	private String detailAddr;
	
	public byte getPic() {
		return pic;
	}
	
	public void setPic(byte pic) {
		this.pic = pic;
	}
	
	public int getGoodno() {
		return goodno;
	}
	public void setGoodno(int goodno) {
		this.goodno = goodno;
	}
	
	public String getGoodname() {
		return goodname;
	}
	public void setGoodname(String goodname) {
		this.goodname = goodname;
	}
	
	public String getUserno() {
		return userno;
	}
	public void setUserno(String user) {
		this.userno = user;
	}
	
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	public float getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(float price) {
		totalprice = price;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	
	public String getdetailAddr() {
		return detailAddr;
	}
	public void setdetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
}
