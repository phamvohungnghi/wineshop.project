/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Products;
import models.ProductsJpaController;

/**
 *
 * @author HUNG NGHI
 */
@WebServlet(name = "FilterController", urlPatterns = {"/loc_sanpham"})
public class FilterController extends HttpServlet {

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

        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
        String sort = request.getParameter("sort");

        List<Products> lst = new ProductsJpaController().findProductsEntities();
        List<Products> newlst = new ArrayList<>();

        for (Products p : lst) {
            int newPrice;
            if (p.getPrice().compareTo(p.getDiscountPrice()) > 0) {
                newPrice = p.getDiscountPrice().intValue();
            } else {
                newPrice = p.getPrice().intValue();
            }

            boolean okee = true;
            //lọc giá tiền theo khoảng
            if (price != null && !price.isEmpty()) {
                if (price.equals("under1m")) {
                    if (newPrice >= 1000000) {
                        okee = false;
                    }
                } else if (price.equals("1mto5m")) {
                    if (newPrice > 5000000 || newPrice < 1000000) {
                        okee = false;
                    }
                } else if (price.equals("5mto15m")) {
                    if (newPrice > 15000000 || newPrice < 5000000) {
                        okee = false;
                    }
                } else if (price.equals("above15m")) {
                    if (newPrice <= 15000000) {
                        okee = false;
                    }
                }
            }
            //lọc sản phẩm theo có discount hay không
            if (discount != null && !discount.isEmpty()) {
                boolean isDiscount = p.getDiscountPrice().compareTo(p.getPrice()) < 0;

                if (discount.equals("discounted")) {
                    if (!isDiscount) {
                        okee = false;
                    }
                } else if (discount.equals("notDiscounted")) {
                    if (isDiscount) {
                        okee = false;
                    }
                }
            }
            if (okee) {
                newlst.add(p);
            }
        }
        //lọc theo giá từ thấp -> cao và ngược lại
        if (sort != null && !sort.isEmpty()) {
            if (sort.equals("asc")) {
                Collections.sort(newlst, new Comparator<Products>() {
                    @Override
                    public int compare(Products p1, Products p2) {
                        int price1;
                        if (p1.getPrice().compareTo(p1.getDiscountPrice()) > 0) {
                            price1 = p1.getDiscountPrice().intValue();
                        } else {
                            price1 = p1.getPrice().intValue();
                        }

                        int price2;
                        if (p2.getPrice().compareTo(p2.getDiscountPrice()) > 0) {
                            price2 = p2.getDiscountPrice().intValue();
                        } else {
                            price2 = p2.getPrice().intValue();
                        }

                        return price1 - price2;
                    }
                });
            } else if (sort.equals("desc")) {
                Collections.sort(newlst, new Comparator<Products>() {
                    @Override
                    public int compare(Products p1, Products p2) {
                        int price1;
                        if (p1.getPrice().compareTo(p1.getDiscountPrice()) > 0) {
                            price1 = p1.getDiscountPrice().intValue();
                        } else {
                            price1 = p1.getPrice().intValue();
                        }

                        int price2;
                        if (p2.getPrice().compareTo(p2.getDiscountPrice()) > 0) {
                            price2 = p2.getDiscountPrice().intValue();
                        } else {
                            price2 = p2.getPrice().intValue();
                        }

                        return price2 - price1;
                    }
                });
            }
        }
        request.setAttribute("productList", newlst);
request.getRequestDispatcher("index.jsp").forward(request, response);

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
protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
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
protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
public String getServletInfo
            
                
                
        
        
            () {
        return "Short description";
        }// </editor-fold>

}
