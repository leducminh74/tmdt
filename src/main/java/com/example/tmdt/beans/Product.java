package com.example.tmdt.beans;

import java.io.Serializable;
import java.sql.Timestamp;

public class
Product implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private int sId;
    private String name;
    private String color;
    private String brand;
    private String description;
    private String salientFeatures;
    private double price;
    private double sellPrice;
    private String img;
    private int quantity;
    private int quantitySold;
    private int totalSold;
    private int cId;
    private Timestamp saleDate;

    public Product(int id, int sId, String name, String color, String brand, String description, String salientFeatures, double price, double sellPrice, String img, int quantity, int quantitySold, int totalSold, int cId, Timestamp saleDate) {
        this.id = id;
        this.sId = sId;
        this.name = name;
        this.color = color;
        this.brand = brand;
        this.description = description;
        this.salientFeatures = salientFeatures;
        this.price = price;
        this.sellPrice = sellPrice;
        this.img = img;
        this.quantity = quantity;
        this.quantitySold = quantitySold;
        this.totalSold = totalSold;
        this.cId = cId;
        this.saleDate = saleDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSalientFeatures() {
        return salientFeatures;
    }

    public void setSalientFeatures(String salientFeatures) {
        this.salientFeatures = salientFeatures;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(double sellPrice) {
        this.sellPrice = sellPrice;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public int getTotalSold() {
        return totalSold;
    }

    public void setTotalSold(int totalSold) {
        this.totalSold = totalSold;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public Timestamp getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Timestamp saleDate) {
        this.saleDate = saleDate;
    }

    public double total(){
        if(quantitySold > quantity){
            quantitySold = quantity;
        }
        return  (double) Math.round((quantitySold * sellPrice) * 100) / 100;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", sId=" + sId +
                ", name='" + name + '\'' +
                ", color='" + color + '\'' +
                ", brand='" + brand + '\'' +
                ", description='" + description + '\'' +
                ", salientFeatures='" + salientFeatures + '\'' +
                ", price=" + price +
                ", sellPrice=" + sellPrice +
                ", img='" + img + '\'' +
                ", quantity=" + quantity +
                ", quantitySold=" + quantitySold +
                ", totalSold=" + totalSold +
                ", cId=" + cId +
                ", saleDate=" + saleDate +
                '}';
    }
}