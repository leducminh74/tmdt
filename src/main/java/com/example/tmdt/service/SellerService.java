package com.example.tmdt.service;

import com.example.tmdt.beans.Account;
import com.example.tmdt.beans.Order;
import com.example.tmdt.beans.OrderDetail;
import com.example.tmdt.beans.Product;
import com.example.tmdt.dao.AdminDao;
import com.example.tmdt.dao.SellerDao;

import java.util.List;

public class SellerService {
    private static SellerService instance;

    private SellerService(){
    }

    public static SellerService getInstance() {
        if (instance == null) {
            instance = new SellerService();
        }
        return instance;
    }

    public List<Product> getProductBySId(int sId){
        return SellerDao.getInstance().getProductBySId(sId);
    }


    public List<OrderDetail> getOrderDetailBySId(int sId){
        return  SellerDao.getInstance().getOrderDetailBySId(sId);
    }

    public void removeProduct(String id){
        SellerDao.getInstance().removeProduct(id);
    }

    public List<OrderDetail> getOrderDetailSuccess(int sId) {
        return SellerDao.getInstance().getOrderDetailSuccess(sId);
    }

    public List<OrderDetail> getOrderDetailSuccessByMonth(int month, int sid) {
        return SellerDao.getInstance().getOrderDetailSuccessByMonth(month, sid);
    }

    public void addProduct(int sid,String name, String color, String brand, String description,String salientFeatures, String price, String sellPrice, String img, String quantity, String cid){
        SellerDao.getInstance().addProduct(sid,name,color,brand,description,salientFeatures,price,sellPrice,img,quantity,cid);
    }

    public void updateProduct(String id, String name,  String color, String brand, String description,String salientFeatures, String price, String sellPrice, String img, String quantity, String cid){
        SellerDao.getInstance().updateProduct(id, name, color,brand,description,salientFeatures,price,sellPrice,img,quantity,cid);
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

    public double totalRevenue(List<OrderDetail> orderDetailList){
        return SellerDao.getInstance().totalRevenue(orderDetailList);
    }

//    public double getRevenueByMonth(int month){
//        return SellerDao.getInstance().getRevenueByMonth(month);
//    }

    public int getTotalOrderStatusPending(int sid){
        return SellerDao.getInstance().getTotalOrderStatusPending(sid);
    }

    public int getTotalAccountIsCustomer(){
        return AdminDao.getInstance().getTotalAccountIsCustomer();
    }

}
