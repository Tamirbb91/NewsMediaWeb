<%--
  Created by IntelliJ IDEA.
  User: khosbayar
  Date: 2/6/18
  Time: 12:07 PM
  To change this template use File | Settings | File Templates.
--%>
<footer>
    <div class="footer">
        <p class="footer_corners_label">CORNERS</p>
        <p class="footer_corners_menu">
            <a href="
                            <c:url value="/category">
                                <c:param name="type" value="BREAKING"/>
                            </c:url>
                            ">BREAKING!</a><br />
            <a href="
                            <c:url value="/category">
                                <c:param name="type" value="BUSINESS"/>
                            </c:url>">BUSINESS</a><br />
            <a href="
                            <c:url value="/category">
                                <c:param name="type" value="HOW_I_WORK"/>
                            </c:url>
                            ">THIS IS HOW I WORK</a><br />
            <a href="
                            <c:url value="/category">
                                <c:param name="type" value="APP_REVIEW"/>
                            </c:url>
                            ">APPLICATION REVIEW</a><br />
            <a href="
                            <c:url value="/category">
                                <c:param name="type" value="BOOK_REVIEW"/>
                            </c:url>
                            ">BOOK REVIEW</a>
        </p>
        <hr class="footer_silverline" />
        <div class="footer_logo"><img width="200px" src="<c:url value="/static/main/resources/contents/footer_logo.png"/>" alt="readmore_logo" />	</div>
        <p class="footer_quote">KNOWLEDGE IS EVERYTHING, READ EVERYDAY, READ MORE.</p>
        <p>
            <a href="https://www.facebook.com" target="_blank">
                <img src="<c:url value="/static/main/resources/contents/facebook.png"/>" alt="Facebook" width="32" />                </a>&nbsp;
            <a href="https://www.twitter.com" target="_blank">
                <img src="<c:url value="/static/main/resources/contents/twitter.png"/>" alt="Twitter" width="32" />                </a>&nbsp;
            <a href="https://www.instagram.com" target="_blank">
                <img src="<c:url value="/static/main/resources/contents/instagram.png"/>" alt="Instagram" width="32" />                </a>
        </p>
        <p class="footer_developedlabel">Developed by:</p>
        <p class="footer_developers">KHOSBAYAR BUYANDALAI <span class="bluespan">/</span> TAMIR BATMUNKH</p>
        <p class="bluespan">Educational use only (MUM - CS472 course - 2018)</p>

    </div>
</footer>
</body>
</html>