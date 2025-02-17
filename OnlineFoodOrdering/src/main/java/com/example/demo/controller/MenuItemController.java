package com.example.demo.controller;

import com.example.demo.model.MenuItem;
import com.example.demo.model.Restaurant;
import com.example.demo.service.CartService;
import com.example.demo.service.MenuItemService;
import com.example.demo.service.RestaurantService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/restaurants/{restaurantId}/menu")
public class MenuItemController {

    @Autowired
    private MenuItemService menuItemService;

    @Autowired
    private RestaurantService restaurantService;
    
    @Autowired
    private CartService cartService;

    // List all menu items for a restaurant
    @GetMapping
    public String viewMenu(@PathVariable("restaurantId") int restaurantId, Model model) {
        Restaurant restaurant = restaurantService.getRestaurantById(restaurantId);
        List<MenuItem> menuItems = menuItemService.getMenuItemsByRestaurantId(restaurantId);

        model.addAttribute("restaurant", restaurant);
        model.addAttribute("menuItems", menuItems);
        return "menu/list";
    }

    // Show form to add a new menu item
    @GetMapping("/add")
    public String addMenuItemForm(@PathVariable("restaurantId") int restaurantId, Model model) {
        Restaurant restaurant = restaurantService.getRestaurantById(restaurantId);
        MenuItem menuItem = new MenuItem();
        menuItem.setRestaurant(restaurant);

        model.addAttribute("menuItem", menuItem);
        model.addAttribute("restaurant", restaurant);
        return "menu/add";
    }

    // Add a new menu item to the restaurant
    @PostMapping("/add")
    public String addMenuItem(@PathVariable("restaurantId") int restaurantId, @ModelAttribute MenuItem menuItem) {
        menuItem.setRestaurant(restaurantService.getRestaurantById(restaurantId));
        menuItemService.addMenuItem(menuItem);
        return "redirect:/restaurants/" + restaurantId + "/menu";
    }

    // Delete a menu item
    @GetMapping("/delete/{menuItemId}")
    public String deleteMenuItem(@PathVariable("restaurantId") int restaurantId, @PathVariable("menuItemId") int menuItemId) {
        menuItemService.deleteMenuItem(menuItemId);
        return "redirect:/restaurants/" + restaurantId + "/menu";
    }

    // Show form to edit an existing menu item
    @GetMapping("/edit/{menuItemId}")
    public String editMenuItemForm(@PathVariable("restaurantId") int restaurantId, @PathVariable("menuItemId") int menuItemId, Model model) {
        MenuItem menuItem = menuItemService.getMenuItemById(menuItemId);
        model.addAttribute("menuItem", menuItem);
        model.addAttribute("restaurant", restaurantService.getRestaurantById(restaurantId));
        return "menu/edit";
    }

    // Edit an existing menu item
    @PostMapping("/edit/{menuItemId}")
    public String editMenuItem(@PathVariable("restaurantId") int restaurantId,
                                @PathVariable("menuItemId") int menuItemId,
                                @ModelAttribute MenuItem menuItem) {
        menuItem.setRestaurant(restaurantService.getRestaurantById(restaurantId));
        menuItem.setItemId(menuItemId);  // Ensure the itemId is set correctly for update
        menuItemService.updateMenuItem(menuItem);
        return "redirect:/restaurants/" + restaurantId + "/menu";
    }
    
    @GetMapping("/add-to-cart/{menuItemId}")
    public String addToCart(@PathVariable("restaurantId") int restaurantId,
                           @PathVariable("menuItemId") int menuItemId,
                           HttpSession session) {
        MenuItem menuItem = menuItemService.getMenuItemById(menuItemId);
        cartService.addItemToCart(session, menuItem);
        return "redirect:/restaurants/" + restaurantId + "/menu";
    }
    
}
