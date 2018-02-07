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
    <link rel="stylesheet" type="text/css" href="../css/new.css">
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/jquery.cookie.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/new.js"></script>
</head>
<body>
<div id="header">
    <img id="logo" src="../image/unread.png">
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
    <div id="title">
        <h4>Title</h4>
        <textarea id="title_value" name="title" ></textarea>
    </div>
    <div id="category">
        <h4>Category</h4>
        <div id="category_value">
        <label><input name="category"  type="radio" value="BREAKING" checked>Breaking</label>
         <label><input name="category" type="radio" value="HOW_I_WORK">How I work</label>
         <label><input name="category" type="radio" value="APP_REVIEW">Application review</label>
         <label><input name="category" type="radio" value="BOOK_REVIEW">Book review</label>
         <label><input name="category" type="radio" value="BUSINESS">Business</label>
        </div>
    </div>
    <div id="cover_image">
        <h4>Cover image</h4>
        <%--<input id="cover_image_value" type="text" name="coverImage" value="">--%>
        <form id="coverImageUpload" enctype='multipart/form-data'>
            <input name="coverImage" type="file"/>
            <input type="button" value="Upload" />
        </form>
    </div>
    <div id="intro_paragraph">
        <h4>Intro paragraph</h4>
        <textarea id="intro_paragraph_value" name="introParagraph" value=""></textarea>
    </div>
    <div id="attributes">
        <h4>Attributes</h4>
        <div class="attribute">
            <h4>Attribute</h4>
            <div class="attribute_div">
                <input class="attribute_key" type="text" value="" placeholder="Key">
                <input class="attribute_value" type="text" value="" placeholder="Value">
            </div>
        </div>
        <div class="add_attribute">
            <span>Add attribute</span>
        </div>
    </div>
    <div id="sections">
        <h4>Sections</h4>
        <div class="section">
            <h4>Section</h4>
            <div class="section_title">
                <h4>Section title</h4>
                <textarea class="section_title_value"></textarea>
            </div>
            <div class="section_paragraph">
                <h4>Section paragraph</h4>
                <textarea class="section_paragraph_value"></textarea>
            </div>
            <div class="section_images">
                <h4>Section images</h4>
                <form class="sectionImageUpload" enctype='multipart/form-data'>
                    <input name="sectionImage" type="file" multiple/>
                    <input type="button" value="Upload" />
                </form>
                <input class="images_path" type="text" value="">
            </div>
        </div>
        <div class="section_add">
            <span>Add section</span>
        </div>
    </div>
    <div id="publish">
        <svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 0h24v24H0z" fill="none"/>
            <path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4L9 16.2z"/>
        </svg>
        <span>Publish</span>
    </div>
</div>
<div id="toast">
</div>
</body>
</html>
