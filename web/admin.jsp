<%-- 
    Document   : admin
    Created on : Mar 16, 2026, 9:13:37 PM
    Author     : HUNG NGHI
--%>

<%@page import="models.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Users user = (Users) session.getAttribute("ttdn");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Admin Page</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            margin: 40px;
            text-align: center;
        }

        .box{
            width: 500px;
            margin: auto;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background: #f8f4ee;
        }

        h2{
            color: #7b1e3a;
        }

        a{
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            background: #8b5e3c;
            color: white;
            border-radius: 6px;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Admin Page</h2>
        <p>Welcome admin: <b><%= user.getUsername() %></b></p>
        <a href="san_pham">Return Page</a>
    </div>

    </body>
</html>
