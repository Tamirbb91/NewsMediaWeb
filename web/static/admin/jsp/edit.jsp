<%--
  Created by IntelliJ IDEA.
  User: Tamir
  Date: 2/5/2018
  Time: 10:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="static/admin/css/edit.css"/>">
    <link rel="icon" type="image/png" href="<c:url value="static/admin/image/announcement.png"/>">
    <script src="<c:url value="static/admin/js/jquery.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="static/admin/js/jquery.cookie.js"/>" type="text/javascript"></script>
    <script type="text/javascript" src="<c:url value="static/admin/js/edit.js"/>"></script>
</head>
<body>
<div id="header">
    <img id="logo" src="<c:url value="/static/admin/image/logo.png"/>" alt="header logo">
    <div id="admin_info">
        <div id="admin_profile">
            <img src="${admin.image}" alt="admin profile image">
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
<div id="contents" data-id="${editPost.id}">
    <div id="title">
        <h4>Title</h4>
        <textarea id="title_value" name="title" >${editPost.title}</textarea>
    </div>
    <div id="category">
        <h4>Category</h4>
        <div id="category_value">
        <label><input name="category"  type="radio" value="BREAKING" ${editPost.category == "BREAKING" ? "checked" : ""}>Breaking</label>
         <label><input name="category" type="radio" value="HOW_I_WORK" ${editPost.category == "HOW_I_WORK" ? "checked" : ""}>How I work</label>
         <label><input name="category" type="radio" value="APP_REVIEW" ${editPost.category == "APP_REVIEW" ? "checked" : ""}>Application review</label>
         <label><input name="category" type="radio" value="BOOK_REVIEW" ${editPost.category == "BOOK_REVIEW" ? "checked" : ""}>Book review</label>
         <label><input name="category" type="radio" value="BUSINESS" ${editPost.category == "BUSINESS" ? "checked" : ""}>Business</label>
        </div>
    </div>
    <div id="intro_paragraph">
        <h4>Intro paragraph</h4>
        <textarea id="intro_paragraph_value" name="introParagraph">${editPost.introParagraph}</textarea>
    </div>
    <div id="attributes">
        <h4>Attributes</h4>
        <c:forEach items="${editPost.attributes}" var="item">
            <div class="attribute">
                <h4>Attribute</h4>
                <div class="attribute_div">
                    <input class="attribute_key" type="text" value="${item.title}" placeholder="Key">
                    <input class="attribute_value" type="text" value="${item.body}" placeholder="Value">
                </div>
            </div>
        </c:forEach>
        <div class="add_attribute">
            <span>Add attribute</span>
        </div>
    </div>
    <div id="sections">
        <h4>Sections</h4>
        <c:forEach items="${editPost.sections}" var="item">
            <div class="section">
                <h4>Section</h4>
                <div class="section_title">
                    <h4>Section title</h4>
                    <textarea class="section_title_value">${item.title}</textarea>
                </div>
                <div class="section_paragraph">
                    <h4>Section paragraph</h4>
                    <textarea class="section_paragraph_value">${item.paragraph}</textarea>
                </div>
            </div>
        </c:forEach>
        <div class="section_add">
            <span>Add section</span>
        </div>
    </div>
    <div id="publish">
        <svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 0h24v24H0z" fill="none"/>
            <path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4L9 16.2z"/>
        </svg>
        <span>Update</span>
    </div>
</div>
<div id="toast">
</div>
</body>
</html>
