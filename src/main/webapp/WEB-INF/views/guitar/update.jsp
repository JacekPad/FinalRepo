<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../constants/header.jsp"/>
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
                                    <h2>Edit Guitar</h2>
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
                <script src="<c:url value="/resources/js/custom/stringSearch.js"/>"></script>
<jsp:include page="../constants/footer.jsp"/>