package model;

public class Booking {
	private String bookingid;
	private String userid;
	private String spot;
	private String code;
	private String starttime;
	private String endtime;
	private String carplate;
	private String cost;
	private String bookingtime;
	

	public Booking(String bookingid, String userid) {
		super();
		this.bookingid = bookingid;
		this.userid = userid;
	}
	public Booking(String bookingid, String userid, String spot, String code, String starttime, String endtime,
			String carplate, String cost, String bookingtime) {
		super();
		this.bookingid = bookingid;
		this.userid = userid;
		this.spot = spot;
		this.code = code;
		this.starttime = starttime;
		this.endtime = endtime;
		this.carplate = carplate;
		this.cost = cost;
		this.bookingtime = bookingtime;
	}
	public String getBookingid() {
		return bookingid;
	}
	public void setBookingid(String bookingid) {
		this.bookingid = bookingid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSpot() {
		return spot;
	}
	public void setSpot(String spot) {
		this.spot = spot;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getCarplate() {
		return carplate;
	}
	public void setCarplate(String carplate) {
		this.carplate = carplate;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getBookingtime() {
		return bookingtime;
	}
	public void setBookingtime(String bookingtime) {
		this.bookingtime = bookingtime;
	}
}
