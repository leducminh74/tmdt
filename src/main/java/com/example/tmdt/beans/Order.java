package com.example.tmdt.beans;

import java.sql.Timestamp;

public class Order {
    private int id;
    private Account account;
    private double total;
    private String payment;
    private String fullName;
    private String address;
    private String phoneNumber;
    private Timestamp createAt;
    private Timestamp updateAt;
    private int status;

    public Order(int id, Account account, double total, String payment, String fullName, String address, String phoneNumber, Timestamp createAt, Timestamp updateAt, int status) {
        this.id = id;
        this.account = account;
        this.total = total;
        this.payment = payment;
        this.fullName = fullName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.status = status;
    }

    public Order(Account account, double total, String payment, String fullName, String address, String phoneNumber) {
        this.account = account;
        this.total = total;
        this.payment = payment;
        this.fullName = fullName;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", account=" + account +
                ", total=" + total +
                ", payment='" + payment + '\'' +
                ", fullName='" + fullName + '\'' +
                ", address='" + address + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", createAt=" + createAt +
                ", updateAt=" + updateAt +
                ", status=" + status +
                '}';
    }
}
