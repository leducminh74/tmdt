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

public class AdminDao {
    private static AdminDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private AdminDao() {
    }

    public static AdminDao getInstance() {
        if (instance == null) {
            instance = new AdminDao();
        }
        return instance;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
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

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query ="select * from account ";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7)
                ));
            }
        }catch (Exception e){

        }
        return list;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String query ="select * from orders";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Order(
                        rs.getInt(1),
                        AccountService.getInstance().getAccountById(rs.getString(2)),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9),
                        rs.getInt(10)
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

    public void addUser(String userName, String passWord, String email,String phoneNumber, String role){
        String query = "insert into account (`username`,`password`,`email`,`phone_number`,`role`,`status`) values(?,?,?,?,?,1)";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,userName);
            ps.setString(2,AccountDao.getInstance().hashPassword(passWord));
            ps.setString(3,email);
            ps.setString(4,phoneNumber);
            ps.setString(5,role);
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
    public double totalRevenue(){
        String query ="select sum(total) from orders where `status` = 4";
        double total = 0;
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                total = rs.getDouble(1);
            }
        }catch (Exception e){

        }
        return  total;
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
    public int getTotalOrderStatusPending(){
        String query ="select count(*) from orders where `status` = 1";
        int count = 0;
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
            }
        }catch (Exception e){

        }
        return  count;
    }

//    get total account is customer
    public int getTotalAccountIsCustomer(){
        String query ="select count(*) from account where `role` = 0";
        int count = 0;
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
            }
        }catch (Exception e){

        }
        return  count;
    }

    //    get total account is seller
    public int getTotalAccountIsSeller(){
        String query ="select count(*) from account where `role` = 2";
        int count = 0;
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
            }
        }catch (Exception e){

        }
        return  count;
    }

//    active account
    public Account activeAccount(String a_id){
        String query ="select * from account where `user_id` = ?  and `status` = 0";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            rs = ps.executeQuery();
            if (rs.next()){
                active(a_id);
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7));
            }
        }catch (Exception e){

        }
        return null;
    }


    private void active(String a_id){
        String query ="update account set `status` = 1 where `user_id` = ? ";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }
//

//    disable account
    public Account disableAccount(String a_id){
        String query ="select * from account where `user_id` = ?  and `status` = 1";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            rs = ps.executeQuery();
            if (rs.next()){
                disable(a_id);
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7));
            }
        }catch (Exception e){

        }
        return null;
    }

    private void disable(String a_id){
        String query ="update account set `status` = 2 where `user_id` = ? ";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }
//

//    enable account
    public Account enableAccount(String a_id){
        String query ="select * from account where `user_id` = ?  and `status` = 2";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            rs = ps.executeQuery();
            if (rs.next()){
                enable(a_id);
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7));
            }
        }catch (Exception e){

        }
        return null;
    }


    private void enable(String a_id){
        String query ="update account set `status` = 1 where `user_id` = ? ";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }
//

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

//


//  accept order

    public Order acceptOrder(String oId) {
        String query ="select * from orders where `orders_id` = ?  and `status` = 1";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            rs = ps.executeQuery();
            if (rs.next()){
                acceptO(oId);
                return new Order(
                        rs.getInt(1),
                        AccountService.getInstance().getAccountById(rs.getString(2)),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9),
                        rs.getInt(10)
                );
            }
        }catch (Exception e){

        }
        return null;
    }

    private void acceptO(String oId) {
        String query ="update orders set `status` = 2 where `orders_id` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }


    public OrderDetail acceptOrderDetail(String oId) {
        String query ="select * from orders_detail where `orders_id` = ?  and `status` = 1";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            rs = ps.executeQuery();
            if (rs.next()){
                acceptOD(oId);
                return new OrderDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        ProductService.getInstance().getProductById(rs.getString(3)),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getTimestamp(6),
                        rs.getTimestamp(7),
                        rs.getInt(8)
                );
            }
        }catch (Exception e){

        }
        return null;
    }

    private void acceptOD(String oId) {
        String query ="update orders_detail set `status` = 2 where `orders_id` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

//

//    next step order
    public Order nextStepOrder(String oId, String oStatus){
        String query ="select * from orders where `orders_id` = ?  and `status` < 4";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            rs = ps.executeQuery();
            if (rs.next()){
                nextStepO(oId,oStatus);
                return new Order(
                        rs.getInt(1),
                        AccountService.getInstance().getAccountById(rs.getString(2)),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9),
                        rs.getInt(10)
                );
            }
        }catch (Exception e){

        }
        return null;
    }

    private void nextStepO(String oId, String oStatus) {
        String query ="update orders set `status` = ? where `orders_id` = ?";
        int status = Integer.parseInt(oStatus);

        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,status + 1);
            ps.setString(2,oId);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }


    public OrderDetail nextStepOrderDetail(String oId, String oStatus){
        String query ="select * from orders_detail where `orders_id` = ?  and `status` < 4";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            rs = ps.executeQuery();
            if (rs.next()){
                nextStepOD(oId,oStatus);
                return new OrderDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        ProductService.getInstance().getProductById(rs.getString(3)),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getTimestamp(6),
                        rs.getTimestamp(7),
                        rs.getInt(8)
                );
            }
        }catch (Exception e){

        }
        return null;
    }

    private void nextStepOD(String oId, String oStatus) {
        String query ="update orders_detail set `status` = ? where `orders_id` = ?";
        int status = Integer.parseInt(oStatus);

        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,status + 1);
            ps.setString(2,oId);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }


//

//    cancel order
    public Order cancelOrder(String oId){
        String query ="select * from orders where `orders_id` = ?  and `status` between 1 and 3";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            rs = ps.executeQuery();
            if (rs.next()){
                cancelO(oId);
                return new Order(
                        rs.getInt(1),
                        AccountService.getInstance().getAccountById(rs.getString(2)),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9),
                        rs.getInt(10)
                );
            }
        }catch (Exception e){

        }
        return null;
    }

    private void cancelO(String oId) {
        String query ="update orders set `status` = 5 where `orders_id` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

    public OrderDetail cancelOrderDetail(String oId){
        String query ="select * from orders_detail where `orders_id` = ?  and `status` between 1 and 3";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            rs = ps.executeQuery();
            if (rs.next()){
                cancelOD(oId);
                return new OrderDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        ProductService.getInstance().getProductById(rs.getString(3)),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getTimestamp(6),
                        rs.getTimestamp(7),
                        rs.getInt(8)
                );
            }
        }catch (Exception e){

        }
        return null;
    }

    private void cancelOD(String oId) {
        String query ="update orders_detail set `status` = 5 where `orders_id` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

//

    public static void main(String[] args) {
        AdminDao a = new AdminDao();

        System.out.println(a.getRevenueByMonth(8));
    }



}
