package com.example.tmdt.dao;

import com.example.tmdt.beans.Account;
import com.example.tmdt.beans.Infomation;
import com.example.tmdt.db.DBConnect;


import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDao {
    private static AccountDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private AccountDao() {
    }

    public static AccountDao getInstance() {
        if (instance == null) {
            instance = new AccountDao();
        }
        return instance;
    }

    public Account getAccountById(String a_id){
        String query ="select * from account where `user_id` = ? ";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            rs = ps.executeQuery();
            while (rs.next()){
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

    public Account login(String user, String pass){
        String query ="select * from account where `username` = ? and `password` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,user);
            if(user.equals("admin")){
                ps.setString(2,pass);
            }else{
                ps.setString(2,hashPassword(pass));
            }
            rs = ps.executeQuery();
            while (rs.next()){
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

    public Account checkUserExist(String user){
        String query ="select * from account where `username` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,user);
            rs = ps.executeQuery();
            while (rs.next()){
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

    public Account checkEmailExist(String email){
        String query ="select * from account where `email` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,email);
            rs = ps.executeQuery();
            while (rs.next()){
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

    public void register(String user, String pass, String email,String phoneNumber){
        String query ="insert into account (`username`, `password`,`email`,`phone_number`,`role`,`status`) values (?,?,?,?,0,0)";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,user);
            ps.setString(2,hashPassword(pass));
            ps.setString(3,email);
            ps.setString(4,phoneNumber);
            ps.executeUpdate();
        }catch (Exception e){

        }

    }

    public void toSeller(int uId){
        String query ="update account set `role` = 2 where `user_id` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,uId);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

    public void changePassword(Account a, String newPass){
        int user_id = a.getUserId();
        String query ="update account set `password` = ? where `user_id` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,hashPassword(newPass));
            ps.setInt(2,user_id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }


    public boolean checkPasswordCorrect(Account a, String password){
        String a_id = String.valueOf(a.getUserId());
        String passwordCheck = getAccountById(a_id).getPassword();
        if(passwordCheck.equals(hashPassword(password))){
            return true;
        }
        return false;

    }


    public Account activeAccount(String email, String hashPass){
        String query ="select * from account where `email` = ? and `password` = ? and `status` = 0";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,email);
            ps.setString(2,hashPass);
            rs = ps.executeQuery();
            if (rs.next()){
                active(email,hashPass);
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


    private void active(String email, String hashPass){
        String query ="update account set `status` = 1 where `email` = ? and `password` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,email);
            ps.setString(2,hashPass);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

    public String hashPassword(String password){
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte byteData[] = md.digest();
            BigInteger number = new BigInteger(1,byteData);
            return number.toString(16);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public Infomation info(int id, String name, String address) {
        String query ="update info_user set user_name = ?, user_address = ? where user_id = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,name);
            ps.setString(2,address);
            ps.setInt(3,id);

            ps.executeUpdate();

        }catch (Exception e){

        }
        return null;

    }

    public Infomation viewInfo(int id){
        String query ="select * from info_user where user_id = ? ";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                return new Infomation(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));

            }
        }catch (Exception e){

        }
        return null;

    }

    public Account getIDLast() {
        String query= "SELECT * FROM account \n" +
                "\n" +
                "ORDER BY user_id DESC \n" +
                "\n" +
                "LIMIT 1;";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()){
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
    public Infomation add_user(int id) {
        String query = "INSERT INTO info_user (user_id) VALUES (?)";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,id);

            ps.executeUpdate();
        }catch (Exception e){

        }
        return null;
    }


    public static void main(String[] args) {
//        Account a = AccountDao.getInstance().login("admin","admin");
//        Account b = AccountDao.getInstance().checkAccountExist("admin");
//        System.out.println(AccountDao.getInstance().hashPassword("abc"));
        AccountDao a1 = new AccountDao();
        Account a = a1.getAccountById("18");
        System.out.println(a);

    }


}
