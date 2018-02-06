<%--
  Created by IntelliJ IDEA.
  User: khosbayar
  Date: 2/6/18
  Time: 12:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Readmore</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value="resources/css/style.css" /> " />
    <link rel="stylesheet" type="text/css" href="<c:url value="resources/css/comments.css" /> " />
    <link rel="stylesheet" type="text/css" href="<c:url value="resources/css/animations.css" />" />
    <link rel="icon" type="image/png" href="<c:url value="resources/contents/announcement.png"/>">
    <script type="text/javascript" src="<c:url value="resources/js/jquery-3.3.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="resources/js/scripts.js"/>"></script>
</head>
<body>
<header>
    <div class="header">
        <div class="header_icon">
            <a href="<c:url value="index.jsp"/>">
                <img width="160px" src="<c:url value="resources/contents/logo.png"/>" alt="Readmore..." />
            </a>
        </div>
        <div class="vl"></div>
        <div class="header_menu_btn">
            <div class="dropdown">
                <a id="menu_dropbtn" class="dropbtn" href="#">
                    <img width="25px" src="<c:url value="resources/contents/menu.png" />" alt="dropdown menu" />
                </a>
                <div class="dropdown-content">
                    <a href="#">BREAKING!</a>
                    <a href="#">BUSINESS</a>
                    <a href="#">THIS IS HOW I WORK</a>
                    <a href="#">APPLICATION REVIEW</a>
                    <a href="#">BOOK REVIEW</a>
                </div>
            </div>
        </div>

    </div>
</header>