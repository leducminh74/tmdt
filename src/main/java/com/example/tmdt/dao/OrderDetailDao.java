package com.example.tmdt.dao;


import com.example.tmdt.beans.Order;
import com.example.tmdt.beans.OrderDetail;
import com.example.tmdt.db.DBConnect;
import com.example.tmdt.service.OrderService;
import com.example.tmdt.service.ProductService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.stream.Collectors;

public class OrderDetailDao {
    private static OrderDetailDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private OrderDetailDao() {
    }

    public static OrderDetailDao getInstance() {
        if (instance == null) {
            instance = new OrderDetailDao();
        }
        return instance;
    }

    public void createOrderDetail(OrderDetail orderDetail){
        String query = "insert into orders_detail(`orders_id`,`product_id`,`price`,`quantity`,`sid`) values(?,?,?,?,?)";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,orderDetail.getOrderId());
            ps.setInt(2,orderDetail.getProduct().getId());
            ps.setDouble(3,orderDetail.getPrice());
            ps.setInt(4,orderDetail.getQuantity());
            ps.setInt(5,orderDetail.getProduct().getsId());
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

    public List<OrderDetail> getAllOrderDetailByOrderId(int orderId) {
        List<OrderDetail> list = new ArrayList<>();
        String query = "select * from orders_detail where orders_id = ?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        ProductService.getInstance().getProductById(rs.getString(3)),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getTimestamp(6),
                        rs.getTimestamp(7),
                        rs.getInt(8)

                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public List<OrderDetail> getAllOrderDetailBySId(int sId) {
        List<OrderDetail> list = new ArrayList<>();
        String query = "select * from orders_detail where `sid` = ?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,sId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        ProductService.getInstance().getProductById(rs.getString(3)),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getTimestamp(6),
                        rs.getTimestamp(7),
                        rs.getInt(8)

                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public static void main(String[] args) {
        List<OrderDetail> orderDetailList = OrderDetailDao.getInstance().getAllOrderDetailBySId(36);
        List<Order> orderList = new ArrayList<>();
        for (OrderDetail oD: orderDetailList) {
            orderList.add(OrderDao.getInstance().getOrderByOrderId(oD.getOrderId()));
        }
        for (Order o: orderList) {
            if(!orderList.contains(o)){
                orderList.add(o);

            }
        }




    }

}
