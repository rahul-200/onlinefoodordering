package com.example.demo.model;

import java.time.LocalTime;
import java.util.List;
import jakarta.persistence.*;

@Entity
@Table(name = "restaurant")
public class Restaurant {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int restaurantId;

    @Column(name = "restaurant_name", nullable = false, length = 100)
    private String restaurantName;

    @Column(name = "user_name", nullable = false, length = 50)
    private String userName;

    @Column(name = "email", unique = true, nullable = false, length = 100)
    private String email;

    @Column(name = "password", nullable = false, length = 255)
    private String password;

    @Column(name = "contact", length = 15)
    private String contact;

    @Column(name = "address", columnDefinition = "TEXT")
    private String address;

    @Lob
    @Column(name = "image")
    private byte[] image;  // Handling BLOB data for image storage

    @Column(name = "open_hours", nullable = false)
    private LocalTime openHours;  // Using LocalTime for TIME data type

    @Column(name = "close_hours", nullable = false)
    private LocalTime closeHours;

    @OneToMany(mappedBy = "restaurant", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<MenuItem> menuItems;

    // Default Constructor
    public Restaurant() {}

    // Parameterized Constructor
    public Restaurant(String restaurantName, String userName, String email, String password,
                      String contact, String address, byte[] image, LocalTime openHours, LocalTime closeHours) {
        this.restaurantName = restaurantName;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.address = address;
        this.image = image;
        this.openHours = openHours;
        this.closeHours = closeHours;
    }

    // Getters and Setters
    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public LocalTime getOpenHours() {
        return openHours;
    }

    public void setOpenHours(LocalTime openHours) {
        this.openHours = openHours;
    }

    public LocalTime getCloseHours() {
        return closeHours;
    }

    public void setCloseHours(LocalTime closeHours) {
        this.closeHours = closeHours;
    }

    public List<MenuItem> getMenuItems() {
        return menuItems;
    }

    public void setMenuItems(List<MenuItem> menuItems) {
        this.menuItems = menuItems;
    }
}
