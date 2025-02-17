package com.example.demo.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<MenuItem> items = new ArrayList<>();

    public void addItem(MenuItem item) {
        items.add(item);
    }

    public List<MenuItem> getItems() {
        return items;
    }

    public void clearCart() {
        items.clear();
    }
    
    public void removeItem(int itemId) {
        items.removeIf(item -> item.getItemId() == itemId);
    }
}