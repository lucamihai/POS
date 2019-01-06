/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import common.CashierDetails;
import entity.Cashier;
import entity.Product;
import static entity.Product_.barcode;
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
 * @author Mihai
 */
@Stateless
public class CashierBean {

    private static final Logger LOG = Logger.getLogger(CashierBean.class.getName());

    @PersistenceContext
    EntityManager entityManager;
    
    public List<CashierDetails> getAllCashiers(){
        LOG.info("Get all cashiers");
        
        try{
            Query query = entityManager.createQuery("SELECT c FROM Cashier c");
            List<Cashier> cashiers = (List<Cashier>)query.getResultList();
            return copyCashiersToDetails(cashiers);
        }
        
        catch(Exception e){
            throw new EJBException(e);
        }
    }
    public Boolean VerifyCashier(String email, String password){
        LOG.info("Verify if the cashier exist.");
       
        try{
            
            Query query = entityManager.createQuery("SELECT c FROM Cashier c WHERE c.email = :email and c.password = :password");
            query.setParameter("email", email);
            query.setParameter("password", password);
            List<Cashier> cashiers = (List<Cashier>)query.getResultList();
     
            if (cashiers.isEmpty()){
                return false;
            }
            else
                return true;
        }
        
        catch(Exception e){
            return true;
        }
    }
    
    public Boolean VerifyAdmin(String email,String password){
        LOG.info("Verify if the admin exist.");
       
        try{
            
            Query query = entityManager.createQuery("SELECT c FROM Cashier c WHERE c.email = :email and c.password=:password");
            query.setParameter("email", email);
            query.setParameter("password", password);
            List<Cashier> cashiers = (List<Cashier>)query.getResultList();
         
            if (cashiers.isEmpty()){
                return false;
            }
            else return true;
        }
        
        catch(Exception e){
            return false;
        }
    }
    
    
    List<CashierDetails> copyCashiersToDetails(List<Cashier> cashiers){
        List<CashierDetails> allCashierDetails = new ArrayList<CashierDetails>();
        
        for (Cashier cashier : cashiers){
            CashierDetails cashierDetails = new CashierDetails(
                    cashier.getId(),
                    cashier.getFirstname(),
                    cashier.getLastname(),
                    cashier.getEmail(),
                    cashier.getPassword()
            );
            
            allCashierDetails.add(cashierDetails);
        }
        
        return allCashierDetails;
    }
    
    public void createCashier(String firstName, String lastName, String email, String password, Boolean admin){
        LOG.info("Create cashier");
        
        Cashier cashier = new Cashier();
        cashier.setFirstname(firstName);
        cashier.setLastname(lastName);
        cashier.setEmail(email);
        cashier.setPassword(password);
        cashier.setAdmin(admin);
        
        
        entityManager.persist(cashier);
        
    }
  
}
