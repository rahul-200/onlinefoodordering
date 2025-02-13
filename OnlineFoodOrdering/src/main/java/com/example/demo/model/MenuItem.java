package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "master_menu_items")
public class MenuItem {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int itemId;

    @Column(name = "item_name", nullable = false, length = 100)
    private String itemName;

    @Column(name = "item_description", columnDefinition = "TEXT")
    private String itemDescription;

    @Column(name = "price", nullable = false)
    private double price;

    @Lob
    @Column(name = "image")
    private byte[] image;

    @Column(name = "item_type", length = 50)
    private String itemType;

    @Column(name = "available_from", nullable = false)
    private String availableFrom;

    @Column(name = "available_until", nullable = false)
    private String availableUntil;

    @ManyToOne
    @JoinColumn(name = "restaurant_id", nullable = false)
    private Restaurant restaurant;

    // Getters and setters
    public int getItemId() { return itemId; }
    public void setItemId(int itemId) { this.itemId = itemId; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public String getItemDescription() { return itemDescription; }
    public void setItemDescription(String itemDescription) { this.itemDescription = itemDescription; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public byte[] getImage() { return image; }
    public void setImage(byte[] image) { this.image = image; }

    public String getItemType() { return itemType; }
    public void setItemType(String itemType) { this.itemType = itemType; }

    public String getAvailableFrom() { return availableFrom; }
    public void setAvailableFrom(String availableFrom) { this.availableFrom = availableFrom; }

    public String getAvailableUntil() { return availableUntil; }
    public void setAvailableUntil(String availableUntil) { this.availableUntil = availableUntil; }

    public Restaurant getRestaurant() { return restaurant; }
    public void setRestaurant(Restaurant restaurant) { this.restaurant = restaurant; }
}
