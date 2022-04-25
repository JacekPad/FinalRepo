<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                    <section class="section">
                        <div class="card">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>Add guitar</h2>
                                </div>
                            </div>

                            <div class="card-body">
                                <form:form cssClass="row" modelAttribute="guitar" method="post" action="/user/guitars/update">

                                    <div class="col-md-6">
                                        <spring:message code="guitar.guitarName"/>:
                                        <form:hidden path="id"/>
                                        <form:hidden path="created"/>
                                        <form:input cssClass="form-control" path="name"/>
                                        <form:errors path="name"/> <br>
                                        <spring:message code="guitar.guitarType"/>:
                                        <form:select cssClass="form-control" path="type" items="${types}"/>
                                        <form:errors path="type"/><br>
                                        <spring:message code="guitar.guitarMaintenance"/>:
                                        <form:select cssClass="form-control" items="${maintenanceMonths}"
                                                     path="maintenanceFreq"/> <br>

                                    </div>
                                    <div class="col-md-6">
                                        <spring:message code="guitar.stringBrand"/>:
                                        <form:select id="stringBrands" itemLabel="brand" cssClass="form-control"
                                                     items="${brands}" path="stringBrand"/> <br>

                                        <spring:message code="guitar.stringType"/>:
                                        <form:select id="stringTypes" cssClass="form-control" path="stringType"/> <br>

                                        <spring:message code="guitar.stringSize"/>:
                                        <form:select id="stringSizes" cssClass="form-control" path="stringSize"/> <br>

                                        <spring:message code="guitar.stringMaintenance"/>:
                                        <form:select cssClass="form-control" items="${stringChangeMonths}"
                                                     path="stringFreq"/><br>

                                    </div>
                                    <div class="col justify-content-md-center">
                                        <input class="btn btn-block" type="submit" value="<spring:message code="button.send"/>">
                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </section>
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
                <script src="<c:url value="/resources/js/custom/stringSearch.js"/>"></script>

<jsp:include page="/WEB-INF/views/constants/footer.jsp"/>