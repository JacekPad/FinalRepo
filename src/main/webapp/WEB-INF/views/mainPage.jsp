<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="constants/headerGuest.jsp"/>
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
            <div style="color:black;" class="login_form p-3">
                <p><spring:message code="msg.webDesc"/></p>
            </div>
        </div>
    </div>

    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/js/popper.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/animate.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap-select.js"/>"></script>
    <script src="<c:url value="/resources/js/owl.carousel.js"/>"></script>
    <script src="<c:url value="/resources/js/Chart.min.js"/>"></script>
    <script src="<c:url value="/resources/js/Chart.bundle.min.js"/>"></script>
    <script src="<c:url value="/resources/js/utils.js"/>"></script>
    <script src="<c:url value="/resources/js/analyser.js"/>"></script>
    <script src="<c:url value="/resources/js/perfect-scrollbar.min.js"/>"></script>
    <script> var ps = new PerfectScrollbar('#sidebar');</script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>
    <script src="<c:url value="/resources/js/chart_custom_style1.js"/>"></script>
    <script src="<c:url value="/resources/bootstrap.bundle.min.js"/>"></script>
</body>
</html>
