package com.example.tmdt.dao;

import com.example.tmdt.beans.Category;
import com.example.tmdt.beans.Product;
import com.example.tmdt.db.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    private static CategoryDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private CategoryDao() {
    }

    public static CategoryDao getInstance() {
        if (instance == null) {
            instance = new CategoryDao();
        }
        return instance;
    }
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByCID(String cid, int index, int size, int sortCode, int conditionCode, int filterCode, String seperate, int colorCode) {
        String sortBy = "";
        String condition = "";
        String filterText = "";
        String colorText = "";

//        check sắp xếp theo ?
        switch (sortCode){
            case 0:
                sortBy = "total_sold";
                break;
            case 1:
                sortBy = "name";
                break;
            case 2:
                sortBy = "sellprice";
                break;
        }

//        check điều kiện sắp xếp
        switch (conditionCode){
            case 0:
                condition = "ASC";
                break;
            case 1:
                condition = "DESC";
                break;
        }
//        check filter by price
        switch (filterCode){
            case 1:
                filterText = seperate + " sellprice < 100";
                break;
            case 2:
                filterText = seperate + " sellprice > 100 and sellprice < 200 ";
                break;
            case 3:
                filterText = seperate + " sellprice > 200 and sellprice < 300 ";
                break;
            case 4:
                filterText = seperate + " sellprice > 300 and sellprice < 400 ";
                break;
            case 5:
                filterText = seperate + " sellprice > 400 ";
                break;
        }

//        check filter by color
        switch (colorCode){
            case 1:
                colorText = " and color = 'Đen' ";
                break;
            case 2:
                colorText = " and color = 'Trắng' ";
                break;
            case 3:
                colorText = " and color = 'Đỏ' ";
                break;
            case 4:
                colorText = " and color = 'Xanh dương' ";
                break;
            case 5:
                colorText = " and color = 'Xanh lá' ";
                break;

        }

        List<Product> list = new ArrayList<>();
        String query = "with x as (select *, ROW_NUMBER() over (order by " + sortBy + " " + condition + " ) as r from product\n" +
                " where cid = ? "+filterText+colorText+" ) \n" +
                "select * from x where r between ? and ?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,cid);
            ps.setInt(2,(index-1) * size + 1);
            ps.setInt(3,index * size);

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

    public Category getCategoryByCId(String cid){
        String query = "select * from category where `cid` = ?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,cid);
            rs = ps.executeQuery();
            while (rs.next()) {
               return new Category(rs.getInt(1),rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        CategoryDao p1 = new CategoryDao();
        List<Product> list = p1.getProductByCID("2",1,20,1,1,0,"and",1);
        for (Product c :
                list) {
            System.out.println(c);
        }
        System.out.println(p1.getCategoryByCId("3").getcName());
    }
}
