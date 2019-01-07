/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Mihai
 */
@Getter
@Setter
public class ShoppingCartItem {
    ProductDetails product;
    int quantity;
    
    public ShoppingCartItem(ProductDetails product, int quantity){
        this.product = product;
        this.quantity = quantity;
    }
}
