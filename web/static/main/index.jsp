<%--
  Created by IntelliJ IDEA.
  User: khosbayar
  Date: 2/6/18
  Time: 12:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp" %>
<div class="container">
    <div class="container_news">
        <div class="bubble bubblecategory">
            <span class="section_breaking">Good morning!</span>
        </div>
        <c:forEach items="${newsList}" var="news" varStatus="status">
            <%--<div class="section section_solid swing">--%>
            <div class="section swing">
                <p><span class="section_category section_breaking blink_me"><c:out
                        value="${news.category}"/></span><span class="section_totalview">- &nbsp; <img
                        src="<c:url value="static/main/resources/contents/totalviews.png"/>" alt="totalviews"/> <c:out
                        value="${news.viewCount}"/> &nbsp; </span> <span class="section_comments"><img
                        src="static/main/resources/contents/comments.png" alt="comments"/> <c:out
                        value="${news.comments.size()}"/> &nbsp; </span></p>
                <div class=""><a href="
                    <c:url value="static/main/details.jsp">
                        <c:param name="newsid" value="${news.id}" />"
                    </c:url>"><c:out value="${news.title}"/></a></div>
            </div>
            <div class="section_image">
                <a href="<c:url value="static/main/details.jsp">
                        <c:param name="newsid" value="${news.id}" />"
                </c:url>"><img src="<c:out value="${news.coverImage}" />" alt="<c:out value="${news.title}" />"></a>
            </div>
        </c:forEach>

        <div class="div_readmore">
            <button id="btn_readmore"><span class="">Read more &nbsp; > &nbsp;</span></button>
        </div>

    </div>
</div>
<%@ include file="includes/footer.jsp" %>