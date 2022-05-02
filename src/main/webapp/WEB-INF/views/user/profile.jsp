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
                    <div class="row column1">
                        <div class="w-100 h-100">
                            <div class="white_shd full margin_bottom_30">
                                <div class="full graph_head">
                                    <form:form method="post" modelAttribute="fakeUser">
                                    <div class="heading1 margin_0">
                                        <h2>
                                            <spring:message code="user.profile"/>
                                        </h2>
                                    </div>
                                    <div class="float-right">
                                        <input id="submitChanges" class="btn cur-p btn-danger" type="submit"
                                               value="<spring:message code="button.save"/>" disabled>
                                    </div>
                                </div>
                                <div class="table_section padding_infor_info">
                                    <div>
                                        <div class="p-3 d-inline-flex w-25">
                                            <spring:message code="user.userName"/>:
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
                                            <spring:message code="user.email"/>:
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
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="<c:url value="/resources/js/custom/userProfile.js"/>"></script>

<jsp:include page="../constants/footer.jsp"/>