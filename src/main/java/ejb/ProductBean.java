/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import common.CashierDetails;
import common.ProductDetails;
import entity.Cashier;
import entity.Product;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author BAJENARUPAVEL-ALEXAN
 */
@Stateless
public class ProductBean {
 private static final Logger LOG = Logger.getLogger(ProductBean.class.getName());

    @PersistenceContext
    EntityManager entityManager;
    
    public List<ProductDetails> getAllCashiers(){
        LOG.info("Get all products");
        
        try{
            Query query = entityManager.createQuery("SELECT p FROM Product p");
            List<Product> products = (List<Product>)query.getResultList();
            return copyProductsToDetails(products);
        }
        
        catch(Exception e){
            throw new EJBException(e);
        }
    }
    
    List<ProductDetails> copyProductsToDetails(List<Product> products){
        List<ProductDetails> allProdustDetails = new ArrayList<ProductDetails>();
        
        for (Product product : products){
            ProductDetails productDetails = new ProductDetails(
                    product.getId(),
                   product.getBarcode(),
                    product.getName(),
                    product.getDescription(),
                    product.getImageName(),
                    product.getPrice()
            );
            
            allProdustDetails.add(productDetails);
        }
        
        return allProdustDetails;
    }
    
    public void createProduct( String barcode, String name, String description, String imageName, float price){
        LOG.info("Create product");

        try{
            Product product = new Product();
            product.setBarcode(barcode);
            product.setName(name);
            product.setDescription(description);
            product.setImageName(imageName);
            product.setPrice(price);            
            entityManager.persist(product);
        }
        catch(Exception ex){
            
        }
        
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
