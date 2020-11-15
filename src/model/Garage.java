package model;

public class Garage {

    public String garageName;
    public int setCost;
    public String zip;
    public String garageAddress;
    public int numberFloors;
    public int numberSpots;

    public Garage(String garageName, int setCost, String zip, String garageAddress, int numberFloors, int numberSpots) {
        this.garageName = garageName;
        this.setCost = setCost;
        this.zip = zip;
        this.garageAddress = garageAddress;
        this.numberFloors = numberFloors;
        this.numberSpots = numberSpots;
    }

    public String getGarageName() {
        return garageName;
    }

    public void setGarageName(String garageName) {
        this.garageName = garageName;
    }

    public int getSetCost() {
        return setCost;
    }

    public void setSetCost(int setCost) {
        this.setCost = setCost;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getGarageAddress() {
        return garageAddress;
    }

    public void setGarageAddress(String garageAddress) {
        this.garageAddress = garageAddress;
    }

    public int getNumberFloors() {
        return numberFloors;
    }

    public void setNumberFloors(int numberFloors) {
        this.numberFloors = numberFloors;
    }

    public int getNumberSpots() {
        return numberSpots;
    }

    public void setNumberSpots(int numberSpots) {
        this.numberSpots = numberSpots;
    }
}
