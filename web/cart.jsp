<%-- 
    Document   : cart
    Created on : Mar 14, 2026, 8:57:00 PM
    Author     : HUNG NGHI
--%>

<%@page import="models.Products"%>
<%@page import="java.util.Map"%>
<%@page import="models.ProductsJpaController"%>
<%@page import="models.CartShop"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <style>
            body{
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            h2{
                text-align: center;
                color: #7b1e3a;
            }

            table{
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            table, th, td{
                border: 1px solid #ccc;
            }

            th, td{
                padding: 12px;
                text-align: center;
            }

            .total-box{
                margin-top: 20px;
                text-align: right;
                font-size: 20px;
                font-weight: bold;
            }

            .button-box{
                margin-top: 25px;
                display: flex;
                justify-content: space-between;
            }

            .btn{
                padding: 10px 20px;
                text-decoration: none;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-weight: bold;
            }

            .return-btn{
                background: gray;
            }

            .buy-btn{
                background: #7b1e3a;
            }

            .empty-cart{
                text-align: center;
                margin-top: 30px;
                font-size: 18px;
            }
        </style>
    </head>
    <body>

        <h2>Shopping Cart</h2>

        <%
            CartShop cart = (CartShop) session.getAttribute("cart");
            ProductsJpaController pj = new ProductsJpaController();
        %>

        <% if (cart == null || cart.getItems().isEmpty()) { %>
        <div class="empty-cart">No product in here. Please add to cart product in main page</div>

        <div class="button-box">
            <a href="san_pham" class="btn return-btn">Return Page</a>
        </div>
        <% } else { %>

        <table>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>

            <%
                for (Map.Entry<String, Integer> entry : cart.getItems().entrySet()) {
                    String productId = entry.getKey();
                    int quantity = entry.getValue();

                    Products p = pj.findProducts(Integer.parseInt(productId));
                    if (p != null) {
                        int price = p.getDiscountPrice().intValue();
                        int itemTotal = price * quantity;
            %>
            <tr>
                <td><%= p.getProductName()%></td>
                <td><%= price%> VND</td>
                <td><%= quantity%></td>
                <td><%= itemTotal%> VND</td>
            </tr>
            <%
                    }
                }
            %>
        </table>

        <div class="total-box">
            Total Money: <%= cart.calculateValue()%> VND
        </div>

        <div class="button-box">
            <a href="san_pham" class="btn return-btn">Return Page</a>

            <form action="BuyController" method="post">
                <button type="submit" class="btn buy-btn">Buy</button>
            </form>
        </div>

        <% }%>

    </body>
</html>
