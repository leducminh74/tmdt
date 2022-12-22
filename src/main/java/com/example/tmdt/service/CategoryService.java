package com.example.tmdt.service;

import com.example.tmdt.beans.Category;
import com.example.tmdt.beans.Product;
import com.example.tmdt.dao.CategoryDao;

import java.util.List;

public class CategoryService {
    private static  CategoryService instance;

    private CategoryService(){
    }

    public static CategoryService getInstance() {
        if (instance == null) {
            instance = new CategoryService();
        }
        return instance;
    }

    public List<Category> getAllCategory() {
        return CategoryDao.getInstance().getAllCategory();
    }

    public List<Product> getProductByCID(String cid, int index, int size, int sortCode, int conditionCode,int filterCode, String seperate, int colorCode) {
        return CategoryDao.getInstance().getProductByCID(cid, index, size,sortCode,conditionCode, filterCode, seperate,colorCode);
    }

    public Category getCategoryByCId(String cid){
        return CategoryDao.getInstance().getCategoryByCId(cid);
    }
}
