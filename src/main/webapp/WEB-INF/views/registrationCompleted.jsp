<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="constants/header.jsp"/>

<body>
<div style="background-size: 100%; background-image: url(/resources/images/3845477.jpg)"  id="">
    <!-- topbar -->
    <jsp:include page="/WEB-INF/views/constants/topbarGuest.jsp"/>
    <!-- end topbar -->
    <!-- dashboard inner -->
    <div  class="center verticle_center full_height">
        <div style="background-color:rgb(255,255,255,90%)" class="login_section">
            <div style="background-color:rgb(255,255,255,90%)"  class="logo_login">
                <div class="center">
                    <h2 style="color: white">Guitar Journal</h2>
                </div>
            </div>
            <div style="color:black;" class="login_form full">
                <spring:message code="msg.registrationCompleted"/>
                <div class="center">
                    <a class="btn btn-info" href="${pageContext.request.contextPath}/login"><spring:message code="app.goBackMainPage"/></a>
                </div>
            </div>

        </div>
    </div>

    <jsp:include page="constants/footer.jsp"/>
