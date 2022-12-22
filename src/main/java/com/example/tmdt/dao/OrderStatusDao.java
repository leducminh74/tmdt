package com.example.tmdt.dao;

import com.example.tmdt.beans.OrderStatus;
import com.example.tmdt.db.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderStatusDao {

    private static OrderStatusDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public OrderStatusDao() {

    }

    public static OrderStatusDao getInstance() {
        if (instance == null) {
            instance = new OrderStatusDao();
        }
        return instance;
    }

    public OrderStatus getStatusByStatusId(int sid){
        String query ="select * from status_orders where `sid` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,sid);
            rs = ps.executeQuery();
            while (rs.next()){
                return new OrderStatus(
                        rs.getInt(1),
                        rs.getString(2));

            }
        }catch (Exception e){

        }
        return null;
    }

}
