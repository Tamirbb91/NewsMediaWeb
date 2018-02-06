<%--
  Created by IntelliJ IDEA.
  User: khosbayar
  Date: 2/6/18
  Time: 12:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp" %>

<c:if test="${not empty category}" var="hasCategory"/>

<div class="container">
    <div class="container_news">
        <div class="bubble <c:if test="${hasCategory}"><c:out value="bubblecategory" /></c:if>">
            <span class="
                <c:choose>
                    <c:when test="${category eq 'BREAKING'}">
                        <c:out value="blink_me"/>
                    </c:when>
                    <c:otherwise>
                        <c:out value="section_others"/>
                    </c:otherwise>
                </c:choose>
                    ">
                <c:choose>
                    <c:when test="${hasCategory}">
                        <c:out value="${category}"/>
                    </c:when>
                    <c:otherwise>
                        <c:out value="Good morning!"/>
                    </c:otherwise>
                </c:choose>
            </span>
        </div>
        <c:forEach items="${news}" var="news" varStatus="status">
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
        </c:forEach>
        <div class="div_readmore">
            <button id="btn_readmore"><span class="">Read more &nbsp; > &nbsp;</span></button>
        </div>
    </div>
</div>
<%@ include file="includes/footer.jsp" %>