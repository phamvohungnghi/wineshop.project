<%-- 
    Document   : index
    Created on : Mar 14, 2026, 6:47:22 PM
    Author     : HUNG NGHI
--%>
<%@page import="models.ProductsJpaController"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@include file="menu.jspf" %>
        <%@include file="content.jspf" %>
        

        <%
    String lastViewed = "";

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("lastViewedProduct")) {
                String productId = c.getValue();

                ProductsJpaController pj = new ProductsJpaController();
                Products p = pj.findProducts(Integer.parseInt(productId));

                if (p != null) {
                    lastViewed = p.getProductName();
                }
            }
        }
    }
%>

<% if (!lastViewed.isEmpty()) { %>
<div style="margin:20px; padding:10px; background:#f8f4ee; border:1px solid #e5d7c3;">
    Viewed: <b><%= lastViewed %></b>
</div>
<% } %>
    </body>
</html>
