<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                                    <div class="heading1 margin_0">
                                        <h2>
                                            User list
                                        </h2>
                                    </div>
                                </div>

                                <div class="table_section padding_infor_info">
                                    <div class="table-responsive-sm">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>User name</th>
                                                <th class="col-sm-4">Email</th>
                                                <th class="col-sm-2">Created</th>
                                                <th class="col-sm-1">Roles</th>
                                                <th class="col-sm-1">Enabled</th>
                                                <th class="col-sm-3">Actions</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <input id="token" type="hidden" name="${_csrf.parameterName}"
                                                   value="${_csrf.token}"/>
                                            <c:forEach items="${users}" var="user">
                                                <tr>
                                                    <td>${user.username}</td>
                                                    <td>${user.email}</td>
                                                    <td>${user.created}</td>
                                                    <td id="userRole">
                                                        <c:forEach items="${user.roles}" var="role">
                                                            ${fn:substring(role.name,5,20)}
                                                        </c:forEach>
                                                    </td>
                                                    <td id="userEnabled${user.id}">
                                                        <c:if test="${user.enabled == 1}">
                                                            Yes
                                                        </c:if>
                                                        <c:if test="${user.enabled == 0}">
                                                            No
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-row justify-content-md-between w-100">
                                                            <div>
<%--                                                                <c:if test="${user.enabled == 1}">--%>
                                                                <span>
                                                                    <a data-id="${user.id}" class="blockUser"
                                                                       href="#">
                                                                        <i class="fa fa-lock"></i> Disable User
                                                                    </a>
                                                                    </span>
<%--                                                                </c:if>--%>
<%--                                                                <c:if test="${user.enabled == 0}">--%>
                                                                    <span>
                                                                    <a data-id="${user.id}" class="unblockUser"
                                                                       href="#">
                                                                        <i class="fa fa-unlock"></i> Enable User
                                                                    </a>
                                                                    </span>
<%--                                                                </c:if>--%>
                                                            </div>
                                                            <div>
                                                                <a data-id="${user.id}" class="adminUser" href="#">
                                                                    <i class="fa fa-diamond"></i> Give Admin
                                                                </a>
                                                            </div>
                                                            <div>
                                                                <a href="${pageContext.request.contextPath}/admin/user/delete/${user.id}">
                                                                    <i class="fa fa-trash"></i> Delete User
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
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
                <script src="<c:url value="/resources/js/custom/userRoleEdit.js"/>"></script>
                <script src="<c:url value="/resources/js/chart_custom_style1.js"/>"></script>
                <script src="<c:url value="/resources/bootstrap.bundle.min.js"/>"></script>

<jsp:include page="/WEB-INF/views/constants/footer.jsp"/>