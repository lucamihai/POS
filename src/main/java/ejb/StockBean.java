/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import common.ProductDetails;
import common.StockDetails;
import entity.Product;
import entity.Stock;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
public class StockBean {
 private static final Logger LOG = Logger.getLogger(StockBean.class.getName());

    @PersistenceContext
    EntityManager entityManager;
    
    public List<StockDetails> getAllStocks(){
        LOG.info("Get all stoks");
        
        try{
            Query query = entityManager.createQuery("SELECT s FROM Stock s");
            List<Stock> stocks = (List<Stock>)query.getResultList();
            return copyStoksToDetails(stocks);
        }
        
        catch(Exception e){
            throw new EJBException(e);
        }
    }
    
    List<StockDetails> copyStoksToDetails(List<Stock> stocks){
        List<StockDetails> allStockDetails = new ArrayList<StockDetails>();
        
        for (Stock stock : stocks){
            StockDetails stockDetails = new StockDetails(
                   stock.getId(),
                   stock.getIdProduct(),
                   stock.getAmount()
            );
            
            allStockDetails.add(stockDetails);
        }
        
        return allStockDetails;
    }
    
    public void createStock(Integer idProduct, Integer amount){
        LOG.info("Create stock");

        try{
            Stock stock = new Stock();
           stock.setIdProduct(idProduct);
            stock.setAmount(amount);
            entityManager.persist(stock);
        }
        catch(Exception ex){
            
        }
        
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
