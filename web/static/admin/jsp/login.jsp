<%--
  Created by IntelliJ IDEA.
  User: Tamir
  Date: 2/5/2018
  Time: 3:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cu" uri="http://www.customtag.com" %>
<html>
<head>
    <title>Admin login</title>
    <link rel="stylesheet" href="<c:url value="/static/admin/css/login.css"/>">
    <link rel="icon" type="image/png" href="<c:url value="/static/admin/image/announcement.png"/>">
    <script type="text/javascript" src="<c:url value="/static/admin/js/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/admin/js/login.js"/>"></script>
</head>
<body>
    <div id="header">
        <img id="logo" src="<c:url value='/static/admin/image/logo.png'/>" alt="header logo">
    </div>
    <div id="login">
         <p id="login_header">Admin login</p>
         <input id="email" type="text" name="email" placeholder="Email address" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
         <input id="password" type="password" name="password" placeholder="Password">
         <input id="login_button" type="button" value="Login">
        <p id="notice">
            * <em>If you are not admin. Please dont try to login </em>
        </p>
    </div>
    <cu:toast/>
    <%--<div id="toast">--%>
    <%--</div>--%>
</body>
</html>
