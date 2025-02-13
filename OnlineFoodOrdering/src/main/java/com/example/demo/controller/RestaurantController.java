package com.example.demo.controller;

import com.example.demo.model.MenuItem;
import com.example.demo.model.Restaurant;
import com.example.demo.service.MenuItemService;
import com.example.demo.service.RestaurantService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/restaurants")
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    @Autowired
    private MenuItemService menuItemService;  // Add the MenuItemService

    // List all restaurants
    @GetMapping
    public String listRestaurants(Model model) {
        model.addAttribute("restaurants", restaurantService.getAllRestaurants());
        return "restaurant/list";
    }

    // View a specific restaurant, along with its menu items
    @GetMapping("/{id}")
    public String viewRestaurant(@PathVariable int id, Model model) {
        // Fetch the restaurant by its ID
        Restaurant restaurant = restaurantService.getRestaurantById(id);
        
        // Fetch the menu items associated with the restaurant
        List<MenuItem> menuItems = menuItemService.getMenuItemsByRestaurantId(id);

        // Add both restaurant and menu items to the model
        model.addAttribute("restaurant", restaurant);
        model.addAttribute("menuItems", menuItems);
        
        return "restaurant/view";  // Return the view to display the restaurant details and menu items
    }

    // Show the form to add a new restaurant
    @GetMapping("/add")
    public String addRestaurantForm(Model model) {
        model.addAttribute("restaurant", new Restaurant());
        return "restaurant/add";
    }

    // Add a new restaurant
    @PostMapping("/add")
    public String addRestaurant(@ModelAttribute Restaurant restaurant) {
        restaurantService.addRestaurant(restaurant);
        return "redirect:/restaurants";
    }

    // Show the form to edit an existing restaurant
    @GetMapping("/edit/{id}")
    public String editRestaurantForm(@PathVariable int id, Model model) {
        Restaurant restaurant = restaurantService.getRestaurantById(id);
        model.addAttribute("restaurant", restaurant);
        return "restaurant/edit";
    }

    // Edit an existing restaurant
    @PostMapping("/edit/{id}")
    public String editRestaurant(@PathVariable int id, @ModelAttribute Restaurant restaurant) {
        restaurant.setRestaurantId(id); // Ensure we update the correct restaurant
        restaurantService.updateRestaurant(restaurant);
        return "redirect:/restaurants";
    }

    // Delete a specific restaurant
    @GetMapping("/delete/{id}")
    public String deleteRestaurant(@PathVariable int id) {
        restaurantService.deleteRestaurant(id);
        return "redirect:/restaurants";
    }
}
