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
                                <form method="post">
                                    <form:form method="post" modelAttribute="user">
                                        <form:hidden path="email"/>
                                        <form:hidden path="roles"/>
                                        <form:hidden path="username"/>
                                        <form:hidden path="created"/>
                                        <form:hidden path="id"/>
                                        <input type="hidden" value="${previousPassword}" name="previousPassword">
                                    <div class="full graph_head">
                                        <div class="heading1 margin_0">
                                            <h2>
                                                <spring:message code="user.changePassword"/>
                                            </h2>
                                        </div>
                                        <div class="float-right">
                                            <input id="submitChanges" class="btn cur-p btn-info" type="submit"
                                                   value="<spring:message code="button.save"/>">
                                        </div>
                                    </div>
                                    <div class="table_section padding_infor_info">
                                        <div>
                                            <div class="p-3 d-inline-flex w-25">
                                                <spring:message code="user.oldPassword"/>:
                                            </div>
                                            <div class="d-inline-flex w-50">
                                                <div class="label_field d-inline-flex p-3 w-100">
                                                    <input id="oldPassword" class="w-100" type="password" name="typedOldPassword"
                                                           placeholder="<spring:message code="user.oldPassword"/>">
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="p-3 d-inline-flex w-25">
                                                <spring:message code="user.password"/>:
                                            </div>
                                            <div class="d-inline-flex w-50">
                                                <div class="label_field d-inline-flex p-3 w-100">
                                                    <form:password id="newPassword" cssClass="w-100" path="password" placeholder = "password"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div>
                                            <div class="p-3 d-inline-flex w-25">
                                                <spring:message code="user.password"/>:
                                            </div>
                                            <div class="d-inline-flex w-50">
                                                <div class="label_field d-inline-flex p-3 w-100">
                                                    <input id="newPassword2" class="w-100" type="password" name="newPassword2"
                                                           placeholder="password again">
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="p-3 d-inline-flex w-25">
                                            </div>
                                            <div class="d-inline-flex w-50">
                                                <div class="label_field d-inline-flex p-3 w-100">
                                                    <form:errors path="password"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    </form:form>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="<c:url value="/resources/js/custom/userProfile.js"/>"></script>

<jsp:include page="../constants/footer.jsp"/>