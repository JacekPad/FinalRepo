<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav style="opacity: 90%" id="sidebar">
    <div class="sidebar_blog_2">
        <h4>Guitar Journal</h4>
        <ul class="list-unstyled components">
            <li>
                <a href="#element" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i
                        class="fa fa-diamond purple_color"></i> <span>Guitars</span></a>
                <ul class="collapse list-unstyled" id="element">
                    <li><a href="${pageContext.request.contextPath}/user/guitars/list">> <span>Guitar list</span></a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/user/guitars/add">> <span>Add new guitar</span></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#apps" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i
                        class="fa fa-object-group blue2_color"></i> <span>Songs</span></a>
                <ul class="collapse list-unstyled" id="apps">
                    <li><a href="${pageContext.request.contextPath}/user/songs/list">> <span>Song list</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/user/songs/add">> <span>Add new song</span></a></li>
                </ul>
                <sec:authorize access="hasRole('ADMIN')">
                    </li>
                        <li><a href="price.html"><i class="fa fa-briefcase blue1_color"></i> <span>User list</span></a>
                    </li>
                </sec:authorize>
<%--            <sec:authorize access="isAuthenticated()">--%>
<%--                <li>--%>
<%--                    <a href="contact.html">--%>
<%--                        <i class="fa fa-paper-plane red_color"></i> <span>Contact</span></a>--%>
<%--                </li>--%>
<%--            </sec:authorize>--%>
        </ul>
    </div>
</nav>
