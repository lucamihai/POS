/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import common.StockDetails;
import ejb.StockBean;
import ejb.UpdateBean;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author BAJENARUPAVEL-ALEXAN
 */
@WebServlet(name = "UpdateAmount", urlPatterns = {"/UpdateAmount"})
public class UpdateAmount extends HttpServlet {
    
    @Inject
    UpdateBean updateBean;
    
    @Inject
    StockBean stockBean;
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
            out.println("<title>Servlet UpdateAmount</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAmount at " + request.getContextPath() + "</h1>");
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
        
        List<StockDetails> stocks = stockBean.getAllStocks();
        
        HttpSession session = request.getSession(false);
        if (session == null){
            
            request.setAttribute("errorMessage", "Session doesn't exist.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            processRequest(request, response);
            return;
        }
        else{
            String userType = (String)session.getAttribute("userType");
            if (userType == null || userType != "admin"){
                
                request.setAttribute("errorMessage", "The stock can be managed only by an admin");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                processRequest(request, response);
                return;
            }
            
            if (stocks != null && !stocks.isEmpty())
                request.setAttribute("stocks", stocks);
        
            request.setAttribute("title", "Update stock");
            request.getRequestDispatcher("stockManaging.jsp").forward(request, response);
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

        String productBarcode = request.getParameter("productBarcode");
        Integer ammount = Integer.parseInt(request.getParameter("ammount"));
        
        Boolean updateIsSuccesful = updateBean.UpdateAmount(productBarcode, ammount);
        if (updateIsSuccesful)
            request.setAttribute("errorMessage", "Quantity succesfully modified");
        else
            request.setAttribute("errorMessage", "Quantity couldn't be modified");
        
        List<StockDetails> stocks = stockBean.getAllStocks();
        
        if (stocks != null && !stocks.isEmpty())
            request.setAttribute("stocks", stocks);
        
        request.setAttribute("title", "Update stock");
        request.getRequestDispatcher("stockManaging.jsp").forward(request, response);
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
