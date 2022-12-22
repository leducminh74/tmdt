package com.example.tmdt.service;

import com.example.tmdt.beans.Product;
import com.example.tmdt.dao.ProductDao;

import java.util.List;

public class ProductService {
    private static  ProductService instance;

    private ProductService(){
    }

    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
        }
            return instance;
    }

    public List<Product> getAll(){
        return ProductDao.getInstance().getAll();
    }
    public List<Product> getTop8(){
        return ProductDao.getInstance().getTop8();
    }
    public List<Product> getTop8SortByDate(){
        return ProductDao.getInstance().getTop8SortByDate();
    }
    public List<Product> getNextTop8(int amount){
        return ProductDao.getInstance().getNextTop8(amount);
    }

    public List<Product> getProduct(int index, int size, int sortCode, int conditionCode) {
        return ProductDao.getInstance().getProduct(index, size,sortCode,conditionCode);
    }

    public Product getProductById(String id){
        return ProductDao.getInstance().getProductById(id);
    }
    public List<Product> getProductBySId(int sId){
        return ProductDao.getInstance().getProductBySId(sId);
    }

    public List<Product> getProductByGender(String gender){
        return ProductDao.getInstance().getProductByGender(gender);
    }

    public List<Product> getProductByBrand(String brand){
        return ProductDao.getInstance().getProductByBrand(brand);
    }

    public List<Product> searchByName(String txtSearch, int index, int size, int sortCode, int conditionCode){
        return ProductDao.getInstance().searchByName(txtSearch, index, size, sortCode,conditionCode);
    }

    public void updateProductQuantity(Product p, int quantitySold){
        ProductDao.getInstance().updateProductQuantity(p,quantitySold);
    }



}
