<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="topbar">
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="full">
            <div class="float-right">
                <div class="icon_info">
                    <a class="btn btn-info" href="${pageContext.request.contextPath}/login"><spring:message code="topbar.guestLogIn"/></a>
                </div>
            </div>
        </div>
    </nav>
</div>
