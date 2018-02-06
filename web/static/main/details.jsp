<%--
  Created by IntelliJ IDEA.
  User: khosbayar
  Date: 2/6/18
  Time: 12:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp" %>

<div class="details_container">
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
        <div class="news_body">
            <div class="news_section">

                <!-- INTRO PARAGRAPH -->
                <div class="intro_parag"><strong><c:out value="${cnew.introParagraph}"/></strong></div>

                <!-- NEWS ATTRIBUTES -->
                <div class="news_attribute">
                    <c:forEach items="${cnew.attributes}" var="cnewattr">
                        <strong><c:out value="${cnewattr.title}"/>:</strong> <span><c:out
                            value="${cnewattr.body}"/></span><br/>
                    </c:forEach>
                </div>
                <!-- NEWS SECTIONS BEGIN -->
                <c:forEach items="${cnew.sections}" var="cnewsection">
                    <div class="news_sections">
                        <strong class="news_sections_title section_others"><c:out
                                value="${cnewsection.title}"/></strong>
                        <p class="news_sections_parag"><c:out value="${cnewsection.paragraph}"/></p>
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
                        <span><a class="anchor_upnext" href="#">7 ХОНОГИЙН ТОЙМ: "СУПЕР" САР + БРУНО "МАРС" + "УСГҮЙ" ДЭЛХИЙ </a></span>
                    </div>
                </div>
            </div>
            <!-- ASIDE BEGIN -->
            <div class="news_aside">
                <div class="news_aside_totalview_date">
                    <p><span class="section_totalview"><img
                            src="<c:url value="static/main/resources/contents/totalviews.png"/>"
                            alt="totalviews"/> <c:out value="${cnew.viewCount}"/> &nbsp; </span>
                        <span class="section_comments"><img
                                src="<c:url value="static/main/resources/contents/comments.png"/>"
                                alt="comments"/> <c:out value="${cnew.comments.size()}"/> &nbsp; </span>
                    </p>
                </div>
                <hr/>
                <div class="news_aside_published_by">
                    <p>PUBLISHED BY:</p>
                    <p><a class="publisher section_others" href="#"><c:out value="${cnew.admin.firstName} ${cnew.admin.lastName}"/></a></p>
                    <a href="#"><img src="<c:url value="${cnew.admin.image}"/>"
                                     alt="<c:out value="${cnew.admin.firstName}"/>"
                                     width="50px"/></a>
                </div>
                <hr/>
                <div class="news_aside_reactions">
                    <a href="#"><img src="<c:url value="static/main/resources/contents/reactions/reaction_1.png"/>"
                                     alt="Happy"
                                     width="35px"></a>
                    <a href="#"><img src="<c:url value="static/main/resources/contents/reactions/reaction_2.png"/>"
                                     alt="Good"
                                     width="35px"></a>
                    <a href="#"><img src="<c:url value="static/main/resources/contents/reactions/reaction_3.png"/>"
                                     alt="Normal"
                                     width="35px"></a>
                    <a href="#"><img src="<c:url value="static/main/resources/contents/reactions/reaction_4.png"/>"
                                     alt="Bad"
                                     width="35px"></a>
                    <a href="#"><img src="<c:url value="static/main/resources/contents/reactions/reaction_5.png"/>"
                                     alt="Hell"
                                     width="35px"></a>
                </div>
            </div>
            <!-- ASIDE END -->
        </div>
    </div>
    <div class="news_footer">
        <div class="news_offering">
            <div class="offering">
                <a href=""><img
                        src="http://www.unreadtoday.batudigital.a2hosted.com/app/webroot/files/420c4b2f598fe4d18cde12feda4de191.jpg"
                        alt="offering_1"></a>
                <div class="offering_category">
                    <span>BREAKING!</span>
                </div>
                <div class="offering_title">
                    <span><a class="section_others" href="#">АРАБЫН ХӨГЖИЛ БУЮУ ДУБАЙ, АБУ ДАБИ ХОТУУДААР АЯЛСАН ТЭМДЭГЛЭЛ #2</a></span>
                </div>
            </div>
            <div class="offering">
                <a href=""><img src="http://www.unread.today/app/webroot/files/8d6dfcb2a4d94f53534aef78ea05590c.jpg"
                                alt="offering_2"></a>
                <div class="offering_category">
                    <span>BREAKING!</span>
                </div>
                <div class="offering_title">
                    <span><a class="section_others" href="#">АРАБЫН ХӨГЖИЛ БУЮУ ДУБАЙ, АБУ ДАБИ ХОТУУДААР АЯЛСАН ТЭМДЭГЛЭЛ #2</a></span>
                </div>
            </div>
            <div class="offering">
                <a href=""><img
                        src="http://www.unreadtoday.batudigital.a2hosted.com/app/webroot/files/cb093a5fdcfcbf1c379e75d3474b548f.jpg"
                        alt="offering_3"></a>
                <div class="offering_category">
                    <span>BREAKING!</span>
                </div>
                <div class="offering_title">
                    <span><a class="section_others" href="#">АРАБЫН ХӨГЖИЛ БУЮУ ДУБАЙ, АБУ ДАБИ ХОТУУДААР АЯЛСАН ТЭМДЭГЛЭЛ #2</a></span>
                </div>
            </div>
        </div>
    </div>
    <div class="timeline_input_title">
        <span><img src="<c:out value="static/main/resources/contents/comment_input2.png" />" alt="Comment input" width="25px"/></span><span>WRITE A COMMENT</span>
    </div>
    <div class="timeline_comments">
        <div class="timeline_input">
            <div><input type="text" id="comment_name" placeholder="Write a name here" required name="comment_name">
            </div>
            <div><textarea placeholder="Write your comment here" rows="6" name="comment_body" required
                           id="comment_body"></textarea></div>
            <div>
                <button id="comment_send">POST IT</button>
            </div>
            <p id="comment_alertparag">Lets be creative! Write a comment with at least 100 characters to be
                creative!</p>
        </div>
        <ul class="timeline">
            <!-- Item 1 -->
            <li>
                <div class="direction-r">
                    <div class="flag-wrapper">
                        <span class="hexa"></span>
                        <span class="flag">Lorem ipsum.</span>
                        <span class="time-wrapper"><span class="time">Feb 2015</span></span>
                    </div>
                    <div class="desc">Lorem ipsum Nisi labore aute do aute culpa magna nulla voluptate exercitation
                        deserunt proident.
                    </div>
                </div>
            </li>

            <!-- Item 2 -->
            <li>
                <div class="direction-l">
                    <div class="flag-wrapper">
                        <span class="hexa"></span>
                        <span class="flag">Lorem ipsum Anim.</span>
                        <span class="time-wrapper"><span class="time">Dec 2014</span></span>
                    </div>
                    <div class="desc">Lorem ipsum In ut sit in dolor nisi ex magna eu anim anim tempor dolore aliquip
                        enim cupidatat laborum dolore.
                    </div>
                </div>
            </li>

            <!-- Item 3 -->
            <li>
                <div class="direction-r">
                    <div class="flag-wrapper">
                        <span class="hexa"></span>
                        <span class="flag">Lorem Occaecat.</span>
                        <span class="time-wrapper"><span class="time">July 2014</span></span>
                    </div>
                    <div class="desc">Lorem ipsum Minim labore Ut cupidatat quis qui deserunt proident fugiat pariatur
                        cillum cupidatat reprehenderit sit id dolor consectetur ut.
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>