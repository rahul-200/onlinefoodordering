package com.example.demo.service;

import com.example.demo.model.MenuItem;
import com.example.demo.repository.MenuItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuItemService {

    @Autowired
    private MenuItemRepository menuItemRepository;

    // Get list of menu items by restaurant ID
    public List<MenuItem> getMenuItemsByRestaurantId(int restaurantId) {
        return menuItemRepository.findByRestaurantRestaurantId(restaurantId);
    }

    public MenuItem getMenuItemById(int menuItemId) {
        return menuItemRepository.findById(menuItemId).orElse(null);
    }

    public void addMenuItem(MenuItem menuItem) {
        menuItemRepository.save(menuItem);
    }

    public void updateMenuItem(MenuItem menuItem) {
        // Ensure the menu item exists before updating
        if (menuItemRepository.existsById(menuItem.getItemId())) {
            menuItemRepository.save(menuItem);
        }
    }

    public void deleteMenuItem(int menuItemId) {
        menuItemRepository.deleteById(menuItemId);
    }
}
