<%--
  Created by IntelliJ IDEA.
  User: khosbayar
  Date: 2/6/18
  Time: 12:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp" %>

<div class="details_container" id="detailtitle">
    <img src="<c:out value="${cnew.coverImage}"/>" alt="<c:out value="${cnew.title}"/>"/>
    <div class="news_body">
        <div class="news_header">
            <div class="news_header_catdate">
                <span class="news_header_category section_breaking blink_me"><c:out value="${cnew.category}"/></span>&nbsp;&nbsp;<span
                    class="news_header_date"><c:out value="${cnew.publishedDate}"/></span>
            </div>
            <div class="news_header_title">
                <h1>
                    <c:out value="${cnew.title}"/>
                </h1>
            </div>
        </div>
        <!-- ASIDE BEGIN -->
        <div class="news_aside">
            <div class="news_aside_totalview_date">
                <p><span class="section_totalview"><img
                        src="<c:url value="/static/main/resources/contents/totalviews.png"/>"
                        alt="totalviews"/> <c:out value="${cnew.viewCount}"/> &nbsp; </span>
                    <span class="section_comments"><img
                            src="<c:url value="/static/main/resources/contents/comments.png"/>"
                            alt="comments"/> <c:out value="${cnew.comments.size()}"/> &nbsp; </span>
                </p>
            </div>
            <hr/>
            <div class="news_aside_published_by">
                <p>PUBLISHED BY:</p>
                <p><a class="publisher section_others" href="<c:url value="/authors">
                                <c:param name="email" value="${cnew.admin.email}"/>
                            </c:url>"><c:out
                        value="${cnew.admin.firstName} ${cnew.admin.lastName}"/></a></p>
                <a href="<c:url value="/authors">
                                <c:param name="email" value="${cnew.admin.email}"/>
                            </c:url>"><img src="<c:url value="${cnew.admin.image}"/>"
                                           alt="<c:out value="${cnew.admin.firstName}"/>"
                                           width="50px"/></a>
            </div>
            <hr/>
            <div class="news_aside_reactions">
                <div class="reactions_values">
                    <c:forEach items="${cnew.emotionPoints}" var="emotion">
                        <div id="reactions_value_<c:out value="${emotion.key}"/>"
                             style="height: <c:out value="${emotion.value*1}"/>px">

                        </div>
                    </c:forEach>
                </div>

                <a id="emotion1" class="anchoremotions"><img
                        src="<c:url value="/static/main/resources/contents/reactions/reaction_1.png"/>"
                        alt="Happy"
                        width="35px"></a>
                <a id="emotion2" class="anchoremotions"><img
                        src="<c:url value="/static/main/resources/contents/reactions/reaction_2.png"/>"
                        alt="Good"
                        width="35px"></a>
                <a id="emotion3" class="anchoremotions"><img
                        src="<c:url value="/static/main/resources/contents/reactions/reaction_3.png"/>"
                        alt="Normal"
                        width="35px"></a>
                <a id="emotion4" class="anchoremotions"><img
                        src="<c:url value="/static/main/resources/contents/reactions/reaction_4.png"/>"
                        alt="Bad"
                        width="35px"></a>
                <a id="emotion5" class="anchoremotions"><img
                        src="<c:url value="/static/main/resources/contents/reactions/reaction_5.png"/>"
                        alt="Hell"
                        width="35px"></a>
            </div>
        </div>
        <!-- ASIDE END -->
        <div class="news_body">
            <div class="news_section">

                <!-- INTRO PARAGRAPH -->
                <div class="intro_parag"><strong><c:out value="${cnew.introParagraph}"  escapeXml="false" /></strong></div>

                <!-- NEWS ATTRIBUTES -->
                <div class="news_attribute">
                    <c:forEach items="${cnew.attributes}" var="cnewattr">
                        <strong><c:out value="${cnewattr.title}" escapeXml="false" />:</strong> <span><c:out
                            value="${cnewattr.body}" escapeXml="false" /></span><br/>
                    </c:forEach>
                </div>
                <!-- NEWS SECTIONS BEGIN -->
                <c:forEach items="${cnew.sections}" var="cnewsection">
                    <div class="news_sections">
                        <strong class="news_sections_title section_others"><c:out
                                value="${cnewsection.title}"/></strong>
                        <p class="news_sections_parag"><c:out value="${cnewsection.paragraph}" escapeXml="false" /></p>
                        <c:forEach items="${cnewsection.images}" var="cnewsectionimages">
                            <div class="news_sections_img"><img src="<c:out value="${cnewsectionimages}"/>"
                                                                alt="<c:out value="${cnewsection.title}"/>"/></div>
                        </c:forEach>
                    </div>
                </c:forEach>
                <!-- NEWS SECTIONS END -->

                <!-- NEXT NEWS -->
                <div class="news_nextnews">
                    <div class="nextnews_upnext_label">
                        <span>UP NEXT</span>
                    </div>
                    <div class="nextnews_upnext_title">
                        <span><a class="anchor_upnext" href="<c:url value="/details">
                            <c:param name="newsid" value="${nextNew.id}" />
                        </c:url>"><c:out value="${nextNew.title}"/></a></span>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="news_footer">
        <div class="news_offering">
            <c:forEach var="recNew" items="${recommendedNews}">
                <div class="offering">
                    <a href="<c:url value="/details">
                <c:param name="newsid" value="${recNew.id}" />
            </c:url>"><img
                            src="<c:out value="${recNew.coverImage}"/>"
                            alt="<c:out value="${recNew.title}"/>"></a>
                    <div class="offering_category">
                        <span><c:out value="${recNew.category}"/>!</span>
                    </div>
                    <div class="offering_title">
                    <span><a class="section_others" href="<c:url value="/details">
                <c:param name="newsid" value="${recNew.id}" />
            </c:url>"><c:out value="${recNew.title}"/></a></span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="timeline_input_title">
        <span><img src="<c:out value="/static/main/resources/contents/comment_input2.png" />" alt="Comment input"
                   width="25px"/></span><span>WRITE A COMMENT</span>
    </div>
    <div class="timeline_comments">
        <div class="timeline_input">
            <div><input type="text" id="comment_name" placeholder="Write a name here" required name="comment_name">
            </div>
            <div><textarea placeholder="Write your comment here" rows="6" name="comment_body" required
                           id="comment_body"></textarea></div>
            <input type="hidden" id="cnewsid" value="${cnew.id}"/>
            <div>
                <button id="comment_send">POST IT</button>
            </div>
            <p id="comment_alertparag">Lets be creative! Write a comment with at least 10 characters to be
                creative!</p>
        </div>
        <div id="comment_container">
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
        </div>
        <div class="takemetopdiv">
            <a id="takemetotop" href="#detailtitle"><img width="32px"
                                                         src="<c:url value="/static/main/resources/contents/up-arrow.png"/>"
                                                         alt="Up arrow"></a>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>