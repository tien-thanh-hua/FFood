/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Hung
 */
public class FoodType {

  private byte foodTypeID;
  private String foodType;

  public FoodType() {
  }

  public FoodType(byte foodTypeID, String foodType) {
    this.foodTypeID = foodTypeID;
    this.foodType = foodType;
  }

  public byte getFoodTypeID() {
    return foodTypeID;
  }

  public void setFoodTypeID(byte foodTypeID) {
    this.foodTypeID = foodTypeID;
  }

  public String getFoodType() {
    return foodType;
  }

  public void setFoodType(String foodType) {
    this.foodType = foodType;
  }

}
