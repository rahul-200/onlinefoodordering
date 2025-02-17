package com.example.demo.service;

import com.example.demo.model.Cart;
import com.example.demo.model.MenuItem;
import org.springframework.stereotype.Service;
import jakarta.servlet.http.HttpSession;

@Service
public class CartService {
    private static final String CART_SESSION_KEY = "cart";

    public void addItemToCart(HttpSession session, MenuItem item) {
        Cart cart = getCart(session);
        cart.addItem(item);
        session.setAttribute(CART_SESSION_KEY, cart); // Ensure cart is saved back to session
    }

    public Cart getCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute(CART_SESSION_KEY);
        if (cart == null) {
            cart = new Cart();
            session.setAttribute(CART_SESSION_KEY, cart);
        }
        return cart;
    }
    
    public void removeItemFromCart(HttpSession session, int itemId) {
        Cart cart = getCart(session);
        cart.removeItem(itemId);
        session.setAttribute(CART_SESSION_KEY, cart); // Update the session
    }
}