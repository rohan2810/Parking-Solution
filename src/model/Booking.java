package model;

public class Booking {
	private int spot;
	private int start_time;
	private int end_time;
	private int cost;

	public Booking(int spot, int starttime, int endtime, int cost) {
		this.spot = spot;
		this.start_time = starttime;
		this.end_time = endtime;
		this.cost = cost;
	}

	public int getSpot() {
		return spot;
	}

	public void setSpot(int spot) {
		this.spot = spot;
	}

	public int getStart_time() {
		return start_time;
	}

	public void setStart_time(int start_time) {
		this.start_time = start_time;
	}

	public int getEnd_time() {
		return end_time;
	}

	public void setEnd_time(int end_time) {
		this.end_time = end_time;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

}
