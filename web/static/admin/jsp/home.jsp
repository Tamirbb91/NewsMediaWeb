<%--
  Created by IntelliJ IDEA.
  User: Tamir
  Date: 2/5/2018
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="static/admin/css/home.css"/>">
    <script src="<c:url value="static/admin/js/jquery.min.js"/>" type="text/javascript"></script>
    <script type="text/javascript" src="<c:url value="static/admin/js/home.js"/>"></script>
</head>
<body>
    <div id="header">
        <img src="<c:url value="static/admin/image/unread.png"/>">
        <img src="<c:url value="static/admin/image/menu.png"/>">
        <div id="admin_info">
            <div id="admin_profile">
                <img src="${admin.image}">
            </div>
            <div id="admin_name">
                ${admin.firstName} ${admin.lastName}
            </div>
            <div id="logout">
                <svg fill="#424242" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M0 0h24v24H0z" fill="none"/>
                    <path d="M10.09 15.59L11.5 17l5-5-5-5-1.41 1.41L12.67 11H3v2h9.67l-2.58 2.59zM19 3H5c-1.11 0-2 .9-2 2v4h2V5h14v14H5v-4H3v4c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"/>
                </svg>
            </div>
        </div>
    </div>
    <div id="contents">
        <c:forEach items="${myPost}" var="item">
            <div class="my_post">
                <div class="my_post_super">
                    <div class="my_post_category">${item.category}</div>
                    <div class="my_post_view_count">
                        <div class="my_post_view_count_icon">
                            <svg fill="#444" height="18" viewBox="0 0 24 24" width="18" xmlns="http://www.w3.org/2000/svg">
                                <path d="M0 0h24v24H0z" fill="none"/>
                                <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                            </svg>
                        </div>
                        <div class="my_post_view_count_number">
                                ${item.viewCount}
                        </div>
                        <div class="my_post_date">
                            ${item.publishedDate}
                        </div>
                    </div>
                </div>
                <div class="my_post_title">${item.title}</div>
                <div class="my_post_actions">
                    <div class="edit_post">
                        <svg fill="#444" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/>
                            <path d="M0 0h24v24H0z" fill="none"/>
                        </svg>
                    </div>
                    <div class="delete_post">
                        <svg fill="#444" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/>
                            <path d="M0 0h24v24H0z" fill="none"/>
                        </svg>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div id="toast">

    </div>
</body>
</html>
