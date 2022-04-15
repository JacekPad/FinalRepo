<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
    <title>Guitar Journal</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- site icon -->
    <!-- bootstrap css -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- site css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/responsive.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-select.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/perfect-scrollbar.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/custom.css"/>"/>
</head>
<body class="inner_page login">
<div style="background-size: 100%; background-image: url(/resources/images/3845477.jpg)" class="full_container">
    <div class="midde_cont">
        <div class="center verticle_center full_height justify-content-around">
            <div style="background-color:rgb(255,255,255,90%)" class="p-3 login_section">
                <div class="logo_login">
                    <div class="center">
                        <h2 style="color: white">Rejestracja</h2>
                    </div>
                </div>
                <div class="login_form">
                    <form:form modelAttribute="user" method="post" action="${pageContext.request.contextPath}/register">
                        <fieldset>
                            <div class="field d-flex">
                                <label class="label_field">User Name:</label>
                                <form:input path="username" placeholder="Type user name"/>
                                <form:errors path="username"/>
                            </div>
                            <div class="field d-flex">
                                <label class="label_field">Password:</label>
                                <form:password path="password" placeholder="Type password"/>
                                <form:errors path="password"/>
                            </div>
                            <div class="field d-flex">
                                <label class="label_field">Email Address:</label>
                                <form:input path="email" placeholder="Type email"/>
                                <form:errors path="email"/>
                            </div>
                            <div class="field margin_0">
                                <label class="label_field hidden">hidden label</label>
                                <input class="main_bt" type="submit" value="Sing in">
                            </div>
                        </fieldset>
                    </form:form>
                </div>
            </div>
            <div style="background-color:rgb(255,255,255,90%)" class="p-3 login_section">
                <div class="logo_login">
                    <div class="center">
                        <h2 style="color: white">Login</h2>
                    </div>
                </div>
                <div class="login_form">
                    <form method="post">
                        <%--                    <form:form modelAttribute="login" method="post">--%>
                        <div class="field d-flex">
                            <label class="label_field">User Name:</label>
                            <input type="text" name="username" placeholder="Type user name">
                            <%--                            <form:input path="userName"/>--%>
                        </div>
                        <div class="field d-flex">
                            <label class="label_field">Password:</label>
                            <input type="password" name="password" placeholder="Type password">
                            <%--                            <form:input path="h"/>--%>
                        </div>
                        <div class="field d-flex">
                            <label class="label_field hidden">:</label>

                        </div>
                        <div class="field margin_0">
                            <label class="label_field hidden">hidden label</label>
                            <input class="main_bt" type="submit" value="Log in">
                        </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                    <%--                    </form:form>--%>
                </div>
            </div>

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
<jsp:include page="/WEB-INF/views/constants/footer.jsp"/>