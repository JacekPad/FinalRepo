<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div style="opacity: 90%" class="topbar">
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="full">
            <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i>
            </button>
            <div class="right_topbar">
                <div class="icon_info">
                    <ul class="user_profile_dd">
                        <li>
                            <a class="dropdown-toggle" data-toggle="dropdown"><span class="name_user">
                                <sec:authorize access="isAuthenticated()">
                                    <sec:authentication property="principal.username"/>
                                </sec:authorize>
                            </span></a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile">My Profile</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/password_change">Change password</a>
                                <a class="dropdown-item" href="help.html">Help</a>
                                <form method="post" action="<c:url value="/logout"/>">
                                    <input class="dropdown-item" type="submit" value="Log out">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </form>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>
