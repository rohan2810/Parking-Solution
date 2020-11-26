package model;

public class Car {

	public String numberPlate;
	public String color;
	public String model;

	public Car(String numberPlate, String color, String model) {
		this.numberPlate = numberPlate;
		this.color = color;
		this.model = model;
	}

	public String getNumberPlate() {
		return numberPlate;
	}

	public void setNumberPlate(String numberPlate) {
		this.numberPlate = numberPlate;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

}
