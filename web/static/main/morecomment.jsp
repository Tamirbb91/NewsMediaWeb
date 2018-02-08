<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: khosbayar
  Date: 2/7/18
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
<ul id="comment_timeline" class="timeline">
    <c:forEach items="${cnew.comments}" var="cnewcomment" varStatus="commentStat">
        <li>
            <div class="<c:choose><c:when test="${commentStat.index%2 eq 0}"><c:out value="direction-r" /></c:when><c:otherwise><c:out value="direction-l" /></c:otherwise></c:choose>">
                <div class="flag-wrapper">
                    <span class="hexa"></span>
                    <span class="flag"><c:out value="${cnewcomment.username}"/></span>
                    <span class="time-wrapper"><span class="time"><c:out
                            value="${cnewcomment.date}"/></span></span>
                </div>
                <div class="desc"><c:out value="${cnewcomment.comment}"/>
                </div>
            </div>
        </li>
    </c:forEach>
</ul>
