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
    <link rel="stylesheet" href="<c:url value="/resources/css/css/animate.css"/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/responsive.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-select.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/perfect-scrollbar.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/custom.css"/>"/>
</head>
<body class="dashboard dashboard_1">
<div class="full_container">
    <div class="inner_container">
        <!-- Sidebar  -->
        <jsp:include page="/WEB-INF/views/constants/sidebar.jsp"/>
        <!-- end sidebar -->
        <!-- right content -->
        <div style="background-size: 100%; background-image: url(/resources/images/3845477.jpg)" id="content">
            <!-- topbar -->
            <jsp:include page="/WEB-INF/views/constants/topbar.jsp"/>
            <!-- end topbar -->
            <!-- dashboard inner -->
            <div class="midde_cont">
                <div style="opacity: 95%" class="container-fluid">

                    <div class="row column_title">
                        <div class="col-md-12">
                            <div style="opacity: 1%" class="page_title">
                            </div>
                        </div>
                    </div>
                    <div class="row column1">
                        <div class="w-100 h-100">
                            <div class="white_shd full margin_bottom_30">
                                <div class="full graph_head">
                                    <form:form method="post" modelAttribute="user">
                                    <form:hidden path="id"/>
                                    <form:hidden path="roles"/>
                                    <form:hidden path="created"/>
                                    <div class="heading1 margin_0">
                                        <h2>
                                            User profile
                                        </h2>
                                    </div>
                                    <div class="float-right">
                                        <input id="submitChanges" class="btn cur-p btn-danger" type="submit"
                                               value="Save changes" disabled>
                                    </div>
                                </div>
                                <div class="table_section padding_infor_info">
                                    <div>
                                        <div class="p-3 d-inline-flex w-25">
                                            User name:
                                        </div>
                                        <div class="d-inline-flex w-50">
                                            <div class="label_field d-inline-flex p-3 w-100">
                                                <form:input id="username" cssClass="w-100" path="username"
                                                            disabled="true"/>
                                                <form:errors path="username"/>
                                                <button id="usernameUnlock"
                                                        class="btn cur-p btn-outline-secondary fa fa-unlock"></button>
                                            </div>
                                            <div>

                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="p-3 d-inline-flex w-25">
                                            Email:
                                        </div>
                                        <div class="d-inline-flex w-50">
                                            <div class="label_field d-inline-flex p-3 w-100">
                                                <form:input id="email" cssClass="w-100" path="email" disabled="true"/>
                                                <form:errors path="email"/>
                                                <button id="emailUnlock"
                                                        class="btn cur-p btn-outline-secondary fa fa-unlock"></button>
                                            </div>
                                        </div>
                                    </div>
                                    DELETE THIS: <form:input path="password"/>
                                    </form:form>
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
                <script src="<c:url value="/resources/js/custom/userProfile.js"/>"></script>

<jsp:include page="/WEB-INF/views/constants/footer.jsp"/>