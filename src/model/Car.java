package model;

public class Car {

    public String carId;
    public String numberPlate;
    public String Color;
    public String Model;
    public User user;

    public Car(String carId, String numberPlate, String Color, String Model, User user) {
        this.carId = carId;
        this.numberPlate = numberPlate;
        this.Color = Color;
        this.Model = Model;
        this.user = user;
    }

//    public String getCar_Id() {
//        return carId;
//    }
//
//    public void setCar_Id(String carId) {
//        this.carId = carId;
//    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }
    
    public String getNumber_Plate() {
        return numberPlate;
    }

    public void setNumber_Plate(String numberPlate) {
        this.numberPlate = numberPlate;
    }
    
    public String getModel() {
        return numberPlate;
    }

    public void setModel(String Model) {
        this.Model = Model;
    }

     
}
