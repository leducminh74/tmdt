package com.example.tmdt.service;

import com.example.tmdt.beans.Account;
import com.example.tmdt.beans.Order;
import com.example.tmdt.beans.OrderDetail;
import com.example.tmdt.beans.Product;
import com.example.tmdt.dao.AdminDao;


import java.util.List;

public class AdminService {
    private static  AdminService instance;

    private AdminService(){
    }

    public static AdminService getInstance() {
        if (instance == null) {
            instance = new AdminService();
        }
        return instance;
    }

    public List<Product> getAllProducts(){
        return AdminDao.getInstance().getAllProduct();
    }

    public List<Account> getAllAccount(){
        return  AdminDao.getInstance().getAllAccount();
    }

    public List<Order> getAllOrder(){
        return  AdminDao.getInstance().getAllOrder();
    }

    public void removeProduct(String id){
        AdminDao.getInstance().removeProduct(id);
    }

    public void addProduct(int sid,String name, String color, String brand, String description,String salientFeatures, String price, String sellPrice, String img, String quantity, String cid){
        AdminDao.getInstance().addProduct(sid,name,color,brand,description,salientFeatures,price,sellPrice,img,quantity,cid);
    }

    public void updateProduct(String id, String name,  String color, String brand, String description,String salientFeatures, String price, String sellPrice, String img, String quantity, String cid){
        AdminDao.getInstance().updateProduct(id, name, color,brand,description,salientFeatures,price,sellPrice,img,quantity,cid);
    }

    public void addUser(String userName, String passWord, String email,String phoneNumber, String role){
        AdminDao.getInstance().addUser(userName, passWord, email, phoneNumber,role);
    }

    public Account activeAccount(String id){
        return  AdminDao.getInstance().activeAccount(id);
    }

    public Account disableAccount(String id){
        return  AdminDao.getInstance().disableAccount(id);
    }

    public Account enableAccount(String id){
        return  AdminDao.getInstance().enableAccount(id);
    }

    public List<OrderDetail> getAllOrderDetailByOrderId(String orderId){
        return AdminDao.getInstance().getAllOrderDetailByOrderId(orderId);
    }

    public Order acceptOrder(String oId) {
        return AdminDao.getInstance().acceptOrder(oId);
    }

    public OrderDetail acceptOrderDetail(String oId) {
        return AdminDao.getInstance().acceptOrderDetail(oId);
    }

    public Order nextStepOrder(String oId, String oStatus) {
        return AdminDao.getInstance().nextStepOrder(oId,oStatus);
    }

    public OrderDetail nextStepOrderDetail(String oId, String oStatus) {
        return AdminDao.getInstance().nextStepOrderDetail(oId,oStatus);
    }

    public Order cancelOrder(String oId) {
        return AdminDao.getInstance().cancelOrder(oId);
    }

    public OrderDetail cancelOrderDetail(String oId) {
        return AdminDao.getInstance().cancelOrderDetail(oId);
    }

    public double totalRevenue(){
        return AdminDao.getInstance().totalRevenue();
    }

    public double getRevenueByMonth(int month){
        return AdminDao.getInstance().getRevenueByMonth(month);
    }

    public int getTotalOrderStatusPending(){
        return AdminDao.getInstance().getTotalOrderStatusPending();
    }

    public int getTotalAccountIsCustomer(){
        return AdminDao.getInstance().getTotalAccountIsCustomer();
    }
    public int getTotalAccountIsSeller(){
        return AdminDao.getInstance().getTotalAccountIsSeller();
    }

}
