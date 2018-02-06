<%--
  Created by IntelliJ IDEA.
  User: Tamir
  Date: 2/5/2018
  Time: 3:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin login</title>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
    <script src="../../js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/login.js"></script>
</head>
<body>
    <div id="header">
        <img src="../image/unread.png">
    </div>
    <div id="login">
         <p id="login_header">Admin login</p>
         <input id="email" type="text" name="email" placeholder="Email address">
         <input id="password" type="password" name="password" placeholder="Password">
         <input id="login_button" type="button" value="Login">
        <p>
            * <em>If you are not admin. Please dont try to login </em>
        </p>
    </div>
    <div id="toast">
    </div>
</body>
</html>
