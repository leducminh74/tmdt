package com.example.tmdt.beans;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart implements Serializable {
    private static final long serialVersionUID = 1L;
    private static Cart instance;
    private Map<Integer, Product> data;

    private Cart() {
        data = new HashMap<>();
    }

    public static Cart getInstance() {
        if (instance == null) {
            instance = new Cart();
        }
        return instance;
    }

    //get product by Id
    public Product get(int id) {
        return data.get(id);
    }

    //put product to cart
    public void put(Product product) {
        if (data.containsKey(product.getId())) {
            upQuantity(product.getId());
        } else {
            product.setQuantitySold(1);
            data.put(product.getId(), product);
        }
    }

    public void upQuantity(int id) {
        Product p = data.get(id);
        if (p.getQuantitySold() < p.getQuantity()) {
            p.setQuantitySold(p.getQuantitySold() + 1);
        }
    }

    public void downQuantity(int id) {
        Product p = data.get(id);
        if (p.getQuantitySold() > 0) {
            p.setQuantitySold(p.getQuantitySold() - 1);
        }
    }

    public void updateQuantity(int id, int quantity) {
        Product p = data.get(id);
        p.setQuantitySold(quantity);
    }

    //remove product
    public Product remove(int id) {
        return data.remove(id);
    }

    // get total price
    public double total() {
        double total = 0;
        for (Product p : data.values()) {
            total += p.total();
        }
        return ((double) Math.round(total * 100) / 100);
    }

    // get total quantity sold
    public int quantity() {
        int quantity = 0;
        for (Product p : data.values()) {
            quantity += p.getQuantitySold();
        }
        return quantity;
    }

    // get list product
    public Collection<Product> getData() {
        return data.values();
    }

    //count number of item
    public int countNumberOfItem() {
        int sum = 0;
        for (Product p: data.values()) {
            sum += 1;
        }
        return sum;
}
}
