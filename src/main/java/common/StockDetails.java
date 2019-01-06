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
 * @author BAJENARUPAVEL-ALEXAN
 */
@Getter
@Setter
public class StockDetails {
    
    private Long id;
    String productBarcode;
    int ammount;

    public StockDetails(Long id, String productBarcode, int ammount) {
        this.id = id;
        this.productBarcode = productBarcode;
        this.ammount = ammount;
    }
}
