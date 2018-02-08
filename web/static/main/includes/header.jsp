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
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/static/main/resources/css/style.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/static/main/resources/css/comments.css" /> "/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/static/main/resources/css/animations.css" />"/>
    <link rel="icon" type="image/png" href="<c:url value="/static/main/resources/contents/announcement.png"/>">
    <script type="text/javascript" src="<c:url value="/static/main/resources/js/jquery-3.3.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/main/resources/js/scripts.js"/>"></script>
</head>
<body>
<header>
    <div class="header">
        <div class="header_icon">
            <a href="<c:url value="/main"/>">
                <img width="160px" src="<c:url value="/static/main/resources/contents/logo.png"/>" alt="Readmore..."/>
            </a>
        </div>
        <div class="vl"></div>
        <div class="header_menu_btn">
            <div class="dropdown">
                <a id="menu_dropbtn" class="dropbtn" href="#">
                    <img width="25px" src="<c:url value="/static/main/resources/contents/menu.png" />"
                         alt="dropdown menu"/>
                </a>
                <div class="dropdown-content">
                    <a href="
                            <c:url value="/category">
                                <c:param name="type" value="BREAKING"/>
                            </c:url>
                            ">BREAKING!</a>
                    <a href="
                            <c:url value="/category">
                                <c:param name="type" value="BUSINESS"/>
                            </c:url>">BUSINESS</a>
                    <a href="
                            <c:url value="/category">
                                <c:param name="type" value="HOW_I_WORK"/>
                            </c:url>
                            ">THIS IS HOW I WORK</a>
                    <a href="
                            <c:url value="/category">
                                <c:param name="type" value="APP_REVIEW"/>
                            </c:url>
                            ">APPLICATION REVIEW</a>
                    <a href="
                            <c:url value="/category">
                                <c:param name="type" value="BOOK_REVIEW"/>
                            </c:url>
                            ">BOOK REVIEW</a>

                </div>
            </div>
        </div>
        <div id="fixed_animations">
            <a id="fixedemotion1" href="<c:url value="/category">
                                <c:param name="emotion" value="1"/>
                            </c:url>" class="fixedanchoremotions"><img
                    src="<c:url value="/static/main/resources/contents/reactions/reaction_1.png"/>"
                    alt="Happy"
                    width="35px"></a><br/>
            <a id="fixedemotion2" href="<c:url value="/category">
                                <c:param name="emotion" value="2"/>
                            </c:url>" class="fixedanchoremotions"><img
                    src="<c:url value="/static/main/resources/contents/reactions/reaction_2.png"/>"
                    alt="Good"
                    width="35px"></a><br/>
            <a id="fixedemotion3" href="<c:url value="/category">
                                <c:param name="emotion" value="3"/>
                            </c:url>" class="fixedanchoremotions"><img
                    src="<c:url value="/static/main/resources/contents/reactions/reaction_3.png"/>"
                    alt="Normal"
                    width="35px"></a><br/>
            <a id="fixedemotion4" href="<c:url value="/category">
                                <c:param name="emotion" value="4"/>
                            </c:url>" class="fixedanchoremotions"><img
                    src="<c:url value="/static/main/resources/contents/reactions/reaction_4.png"/>"
                    alt="Bad"
                    width="35px"></a><br/>
            <a id="fixedemotion5" href="<c:url value="/category">
                                <c:param name="emotion" value="5"/>
                            </c:url>" class="fixedanchoremotions"><img
                    src="<c:url value="/static/main/resources/contents/reactions/reaction_5.png"/>"
                    alt="Hell"
                    width="35px"></a>
        </div>
    </div>
</header>