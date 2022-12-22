package com.example.tmdt.dao;

import com.example.tmdt.beans.Account;
import com.example.tmdt.beans.Order;
import com.example.tmdt.beans.OrderDetail;
import com.example.tmdt.beans.Product;
import com.example.tmdt.db.DBConnect;
import com.example.tmdt.service.AccountService;
import com.example.tmdt.service.ProductService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SellerDao {
    private static SellerDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private SellerDao() {
    }

    public static SellerDao getInstance() {
        if (instance == null) {
            instance = new SellerDao();
        }
        return instance;
    }

    public List<Product> getProductBySId(int sId) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product where `sid` = ?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,sId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDouble(8),
                        rs.getDouble(9),
                        rs.getString(10),
                        rs.getInt(11),
                        0,
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getTimestamp(14)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public List<OrderDetail> getOrderDetailBySId(int sId) {
        List<OrderDetail> list = new ArrayList<>();
        String query ="select * from orders_detail where `sid` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,sId);
            rs = ps.executeQuery();
            while (rs.next()){
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
        }catch (Exception e){

        }
        return list;
    }


    public void removeProduct(String id){
        String query = "delete from product where id = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

    public void addProduct(int sid,String name, String color, String brand, String description,String salientFeatures, String price, String sellPrice, String img, String quantity, String cid){
        String query = "insert into product (`sid`,`name`,`color`,`brand`,`description`,`salient_features`,`price`,`sellprice`,`img`,`quantity`,`cid`) values(?,?,?,?,?,?,?,?,?,?,?)";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,sid);
            ps.setString(2,name);
            ps.setString(3,color);
            ps.setString(4,brand);
            ps.setString(5,description);
            ps.setString(6,salientFeatures);
            ps.setString(7,price);
            ps.setString(8,sellPrice);
            ps.setString(9,img);
            ps.setString(10,quantity);
            ps.setString(11,cid);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }



    public void updateProduct(String id, String name,  String color, String brand, String description,String salientFeatures, String price, String sellPrice, String img, String quantity, String cid){
        String query = "update product set `name` = ?,`color` = ? ,`brand` = ?,`description` = ?,`salient_features` = ?, `price` = ?,`sellprice` = ?,`img` = ?,`quantity` = ?,`cid` = ? where id = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,name);
            ps.setString(2,color);
            ps.setString(3,brand);
            ps.setString(4,description);
            ps.setString(5,salientFeatures);
            ps.setString(6,price);
            ps.setString(7,sellPrice);
            ps.setString(8,img);
            ps.setString(9,quantity);
            ps.setString(10,cid);
            ps.setString(11,id);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //    get total revenue

    public double totalRevenue(List<OrderDetail> list){
        double total = 0;
        for (OrderDetail o: list) {
            total += (o.getPrice() * o.getQuantity());
        }
        return total;
    }


    public List<OrderDetail> getOrderDetailSuccess(int sId) {
        List<OrderDetail> list = new ArrayList<>();
        String query ="select * from orders_detail where `status` = 4 and `sid` = ?";
            try{
                conn = DBConnect.connect().getConnection();
                ps = conn.prepareStatement(query);
                ps.setInt(1,sId);
                rs = ps.executeQuery();
                while (rs.next()){
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
            }catch (Exception e){

            }

        return list;
    }


    public List<OrderDetail> getOrderDetailSuccessByMonth(int month, int sid) {
        List<OrderDetail> list = new ArrayList<>();
        String query ="select * from orders_detail where `status` = 4 and month(created_at) = ? and `sid` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,month);
            ps.setInt(2,sid);
            rs = ps.executeQuery();
            while (rs.next()){
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
        }catch (Exception e){

        }

        return list;
    }




//    get total revenue by month
    public double getRevenueByMonth(int month){
        String query ="select sum(total) from orders where `status` = 4 and month(created_at) = ? ";
        double total = 0;
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,month);
            rs = ps.executeQuery();
            while (rs.next()){
                total = rs.getDouble(1);
            }
        }catch (Exception e){

        }
        return  total;
    }

//    get total order pending status
    public int getTotalOrderStatusPending(int sid){
        String query ="select count(*) from orders where `status` = 1 and `sid` = ?";
        int count = 0;
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,sid);
            rs = ps.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
            }
        }catch (Exception e){

        }
        return  count;
    }


//    get all order detail by orderId
public List<OrderDetail> getAllOrderDetailByOrderId(String orderId) {
    List<OrderDetail> list = new ArrayList<>();
    String query = "select * from orders_detail where orders_id = ?";
    try {
        conn = DBConnect.connect().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1,orderId);
        rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new OrderDetail(rs.getInt(1),
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
        List<OrderDetail> orderDetailList = SellerDao.getInstance().getOrderDetailSuccessByMonth(12,36);
        System.out.println(SellerDao.getInstance().totalRevenue(orderDetailList));
    }


}
