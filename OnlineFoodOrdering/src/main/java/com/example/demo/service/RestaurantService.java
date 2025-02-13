package com.example.demo.service;

import com.example.demo.model.Restaurant;
import com.example.demo.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RestaurantService {

    @Autowired
    private RestaurantRepository restaurantRepository;

    // Get all restaurants
    public List<Restaurant> getAllRestaurants() {
        return restaurantRepository.findAll();
    }

    // Get a restaurant by its ID
    public Restaurant getRestaurantById(int restaurantId) {
        return restaurantRepository.findById(restaurantId).orElse(null);
    }

    // Add a new restaurant
    public void addRestaurant(Restaurant restaurant) {
        restaurantRepository.save(restaurant);
    }

    // Update an existing restaurant
    public void updateRestaurant(Restaurant restaurant) {
        restaurantRepository.save(restaurant); // This will save an updated restaurant
    }

    // Delete a restaurant by its ID
    public void deleteRestaurant(int restaurantId) {
        restaurantRepository.deleteById(restaurantId);
    }
}
