/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import common.ProductDetails;
import common.ShoppingCartItem;
import ejb.ProductBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mihai
 */
@WebServlet(name = "POS", urlPatterns = {"/POS"})
public class POS extends HttpServlet {

    @Inject
    ProductBean productBean;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet POS</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet POS at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<ShoppingCartItem> sessionShoppingCart;
        
        HttpSession session = request.getSession(false);
        if (session == null){
            
            request.setAttribute("errorMessage", "Session doesn't exist.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            processRequest(request, response);
            return;
        }
        else{
            
            if (session.getAttribute("email") == null){
                
                request.setAttribute("errorMessage", "Before accessing the POS, you must be logged in as a cashier.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                processRequest(request, response);
                return;
            }
            
            sessionShoppingCart = (ArrayList<ShoppingCartItem>)session.getAttribute("shoppingCart");

            if (sessionShoppingCart == null){
                sessionShoppingCart = new ArrayList<ShoppingCartItem>();
            }

            request.setAttribute("products", sessionShoppingCart);
            request.getRequestDispatcher("pos.jsp").forward(request, response);
            processRequest(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<ShoppingCartItem> sessionShoppingCart;
        
        HttpSession session = request.getSession(false);
        if (session == null){
            request.setAttribute("email", "-");
            return;
        }
        
        sessionShoppingCart = (ArrayList<ShoppingCartItem>)session.getAttribute("shoppingCart");

        if (sessionShoppingCart == null){
            sessionShoppingCart = new ArrayList<ShoppingCartItem>();
        }
        
        String action = request.getParameter("action");
        
        if (action.equals("enter")){
            
            String barcode = request.getParameter("barcode");
            ProductDetails product = productBean.getProductsByBarcode(barcode);

            if (product != null){
                ShoppingCartItem shoppingCartItem = new ShoppingCartItem(product, 1);
                sessionShoppingCart.add(shoppingCartItem);
            }
            
            if (product == null){
                request.setAttribute("errorMessage", "Product with barcode " + barcode + " doesn't exist");
            }
        }
        
        if (action.equals("removeProductFromShoppingCart")){
            String stringProductIndex = request.getParameter("productIndex");
            int productIndex = Integer.parseInt(stringProductIndex);
            
            sessionShoppingCart.remove(productIndex);
        }
        
        
        session.setAttribute("shoppingCart", sessionShoppingCart);
        request.setAttribute("products", sessionShoppingCart);
        request.getRequestDispatcher("pos.jsp").forward(request, response);
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
