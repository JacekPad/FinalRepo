<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div style="opacity: 90%" class="topbar">
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="full">
            <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i>
            </button>
            <div class="right_topbar col-sm-2">
                <div class="icon_info">
                    <ul class="user_profile_dd w-100 pr-lg-3">
                        <li class="w-100">
                            <a class="dropdown-toggle" data-toggle="dropdown"><span class="name_user">
                                <sec:authorize access="isAuthenticated()">
                                    <sec:authentication property="principal.username"/>
                                </sec:authorize>
                            </span></a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile"><spring:message code="topbar.profile"/></a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/password_change"><spring:message code="topbar.passChange"/></a>
                                <form method="post" action="<c:url value="/logout"/>">
                                    <input class="dropdown-item" type="submit" value="<spring:message code="topbar.logout"/>">
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
