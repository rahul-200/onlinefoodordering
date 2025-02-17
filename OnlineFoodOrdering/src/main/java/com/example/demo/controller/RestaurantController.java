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
    private MenuItemService menuItemService;  

    // List all restaurants with search functionality
    @GetMapping
    public String listRestaurants(@RequestParam(value = "search", required = false) String search, Model model) {
        List<Restaurant> restaurants;
        if (search != null && !search.isEmpty()) {
            restaurants = restaurantService.searchRestaurantsByName(search);
        } else {
            restaurants = restaurantService.getAllRestaurants();
        }
        model.addAttribute("restaurants", restaurants);
        return "restaurant/list";
    }

    // View a specific restaurant, along with its menu items
    @GetMapping("/{id}")
    public String viewRestaurant(@PathVariable int id, Model model) {
        Restaurant restaurant = restaurantService.getRestaurantById(id);
        List<MenuItem> menuItems = menuItemService.getMenuItemsByRestaurantId(id);

        model.addAttribute("restaurant", restaurant);
        model.addAttribute("menuItems", menuItems);
        
        return "restaurant/view";
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
        restaurant.setRestaurantId(id); 
        restaurantService.updateRestaurant(restaurant);
        return "redirect:/restaurants";
    }

    // Delete a restaurant
    @GetMapping("/delete/{id}")
    public String deleteRestaurant(@PathVariable int id) {
        restaurantService.deleteRestaurant(id);
        return "redirect:/restaurants";
    }
}
