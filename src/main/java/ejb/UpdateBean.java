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
public class UpdateBean {
    private static final Logger LOG = Logger.getLogger(StockBean.class.getName());
    @PersistenceContext
    EntityManager entityManager;
    
  public Boolean UpdateAmount(String productBarcode, Integer amount){
        LOG.info("Update stock to " + amount + " for product with barcode " + productBarcode);
        
        try{
            Stock stock = getStockByProductBarcode(productBarcode);
            
            if (stock != null){
                stock.setAmmount(amount);
                entityManager.merge(stock);
                return true;
            }
            else return false;
        }
        
        catch(Exception e){
            return false;
        }
    }
  public Stock getStockByProductBarcode(String productBarcode){
        LOG.info("Get stock by productBarcode " + productBarcode);
        
        try{
            Query query = entityManager.createQuery("SELECT s FROM Stock s WHERE s.productBarcode = :productBarcode");
            query.setParameter("productBarcode", productBarcode);
            List<Stock> stocks = (List<Stock>)query.getResultList();
            
            if (stocks.isEmpty()){
                return null;
            }
            
            Stock stock = stocks.get(0);
            
            return stock;
        }
        
        catch(Exception e){
            throw new EJBException(e);
        }
    }
 
 
 
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
