<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="styles/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="login-container">
                <h1>Sign In</h1>
                <form action="dang_nhap" method="post">
                    <div class="input-group">
                        <label for="user">Username:</label> 
                        <input type="text" id="user" name="user" >
                        
                        <label for="pass">Password:</label> 
                        <input type="password" id="pass" name="pass" > 
                    </div>
                    <div class="btn-container">
                        <input type="submit" name="btAction" value="Sign In" class="btn btn-submit"> 
                        <input type="reset" value="Reset" class="btn btn-reset">  
                    </div>
                </form>
                <%
                    String message = (String) request.getAttribute("err");
                    if(message != null) {
                %>
                <p style="color:red"> <%= message %> </p>
                <%  }  %>
            </div>  
            
        </div>
            <style>
*{
margin: 0;
padding: 0;
box-sizing: border-box;
font-family: Arial, sans-serif;
}

.container {
    text-align: center;
}

body {
display: flex;
justify-content: center;
align-items: center;
height: 100vh;
background: #f4f4f4;
}

.login-container {
background: #ffffff;
padding: 20px;
border-radius: 8px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
width: 350px;
text-align: center;
}

h1 {
margin-bottom: 20px;
color: #333;
}

.input-group {
margin-bottom: 15px;
text-align: left;
}

label {
font-weight: bold;
display: block;
margin-bottom: 5px;
}

input {
width: 100%;
padding: 10px;
border: 1px solid #ccc;
border-radius: 5px;
font-size: 16px;
}

.btn-container {
display: flex;
justify-content: space-between;
margin-top: 10px;
}

.btn {
width: 48%;
padding: 10px;
border: none;
border-radius: 5px;
font-size: 16px;
cursor: pointer;
}

.btn-submit {
background: #007bff;
color: white;
}

.btn-reset {
background: #ccc;
}

.link-container {
margin-top: 15px;
font-size: 14px;
}

.link-container a {
color: #007bff;
text-decoration: none;
}

.link-container a:hover {
text-decoration: underline;
}
</style>

    </body>
</html>

