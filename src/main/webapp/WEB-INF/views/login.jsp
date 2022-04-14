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
<div class="full_container">
    <div class="midde_cont">
        <div class="center verticle_center full_height justify-content-around">
            <div class="p-3 login_section">
                <div class="logo_login">
                    <div class="center">
                        <h2 style="color: white">Rejestracja</h2>
                    </div>
                </div>
                <div class="login_form">
                    <form:form modelAttribute="user" method="post">
                        <fieldset>
                            <div class="field d-flex">
                                <label class="label_field">User Name:</label>
                                <form:input path="userName" placeholder = "Type user name"/>
                                <form:errors path="userName"/>
                            </div>
                            <div class="field d-flex">
                                <label class="label_field">Password:</label>
                                <form:password path="password" placeholder = "type password"/>
                                <form:errors path="password"/>
                            </div>
                            <div class="field d-flex">
                                <label class="label_field">Email Address:</label>
                                <form:input path="email" placeholder = "type email"/>
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
            <div class="p-3 login_section">
                <div class="logo_login">
                    <div class="center">
                        <h2 style="color: white">Login</h2>
                    </div>
                </div>
                <div class="login_form">
                    <form method="post" action="${pageContext.request.contextPath}/login">
                        <%--                    <form:form modelAttribute="login" method="post">--%>
                        <div class="field d-flex">
                            <label class="label_field">User Name:</label>
                            <input type="text" name="userName">
                            <%--                            <form:input path="userName"/>--%>
                        </div>
                        <div class="field d-flex">
                            <label class="label_field">Password:</label>
                            <input type="password" name="password">
                            <%--                            <form:input path="h"/>--%>
                        </div>
                        <div class="field margin_0">
                            <label class="label_field hidden">hidden label</label>
                            <input class="main_bt" type="submit" value="Log in">
                        </div>
                    </form>
                    <%--                    </form:form>--%>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- wow animation -->
<script src="js/animate.js"></script>
<!-- select country -->
<script src="js/bootstrap-select.js"></script>
<!-- nice scrollbar -->
<script src="js/perfect-scrollbar.min.js"></script>
<script>
    var ps = new PerfectScrollbar('#sidebar');
</script>
<!-- custom js -->
<script src="js/custom.js"></script>
</body>
<jsp:include page="/WEB-INF/views/constants/footer.jsp"/>