package com.example.tmdt.dao;

import com.example.tmdt.beans.Payment;
import com.example.tmdt.db.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PaymentDao {
    private static PaymentDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public PaymentDao() {

    }

    public static PaymentDao getInstance() {
        if (instance == null) {
            instance = new PaymentDao();
        }
        return instance;
    }

    public Payment getPaymentByPaymentId(int pid){
        String query ="select * from payment where `payment_id` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,pid);
            rs = ps.executeQuery();
            while (rs.next()){
                return new Payment(
                        rs.getInt(1),
                        rs.getString(2));

            }
        }catch (Exception e){

        }
        return null;
    }

}
