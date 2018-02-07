<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: khosbayar
  Date: 2/7/18
  Time: 12:33 PM
  To change this template use File | Settings | File Templates.
--%>
<c:forEach items="${morenews}" var="news" varStatus="status">
    <%--<div class="section section_solid swing">--%>
    <div class="section swing">
        <p><span class="section_category section_breaking blink_me"><c:out
                value="${news.category}"/></span><span class="section_totalview">- &nbsp; <img
                src="<c:url value="static/main/resources/contents/totalviews.png"/>" alt="totalviews"/> <c:out
                value="${news.viewCount}"/> &nbsp; </span> <span class="section_comments"><img
                src="static/main/resources/contents/comments.png" alt="comments"/> <c:out
                value="${news.comments.size()}"/> &nbsp; </span></p>
        <a href="
                    <c:url value="/details">
                        <c:param name="newsid" value="${news.id}" />
                    </c:url>"><c:out value="${news.title}"/></a>
    </div>
    <div class="section_image">
        <div class="section_image_inner">
            <a href="<c:url value="/details">
                        <c:param name="newsid" value="${news.id}" />
                        </c:url>">
                <img src="<c:out value="${news.coverImage}" />" alt="<c:out value="${news.title}" />">
            </a>
        </div>
    </div>
    <input type="hidden" class="newsids_class" name="currentids[]" value="<c:out value="${news.id}"/>" />
</c:forEach>