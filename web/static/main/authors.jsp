<%--
  Created by IntelliJ IDEA.
  User: khosbayar
  Date: 2/7/18
  Time: 6:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>

<div class="authors_container">
    <div class="author_info">
        <h2 class="author_name"><c:out value="${admin.firstName}"/> <c:out value="${admin.lastName}"/></h2>
        <p class="author_email"><a href="mailto:<c:out value="${admin.email}"/>"><c:out value="${admin.email}"/></a></p>
        <img class="author_image" src="<c:out value="${admin.image}"/>" alt="<c:out value="${admin.firstName}"/>"/>
        <p class="author_total">Published <c:out value="${news.size()}"/> posts</p>
    </div>
    <hr/>
    <c:forEach items="${news}" var="news" varStatus="status">
        <%--<div class="section section_solid swing">--%>
        <div class="section_outer">
            <div class="author_section swing">
                <p><span class="section_category section_breaking blink_me"><c:out
                        value="${news.category}"/></span><span class="section_totalview">- &nbsp; <img
                        src="<c:url value="/static/main/resources/contents/totalviews.png"/>" alt="totalviews"/> <c:out
                        value="${news.viewCount}"/> &nbsp; </span> <span class="section_comments"><img
                        src="<c:url value="/static/main/resources/contents/comments.png"/>" alt="comments"/> <c:out
                        value="${news.comments.size()}"/> &nbsp; </span></p>
                <a href="
                    <c:url value="/details">
                        <c:param name="newsid" value="${news.id}" />
                    </c:url>"><c:out value="${news.title}"/></a>
            </div>
            <div class="author_section_image">
                <div class="section_image_inner">
                    <a href="<c:url value="/details">
                        <c:param name="newsid" value="${news.id}" />
                        </c:url>">
                        <img src="<c:out value="${news.coverImage}" />" alt="<c:out value="${news.title}" />">
                    </a>
                </div>
            </div>
            <input type="hidden" class="newsids_class" name="currentids[]" value="<c:out value="${news.id}"/>"/>
        </div>
    </c:forEach>

</div>

<%@ include file="includes/footer.jsp" %>