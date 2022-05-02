<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div style="opacity: 95%" class="full_height">
                    <div class="row column_title">
                        <div class="col-md-12">
                            <div style="opacity: 1%" class="page_title">
                            </div>
                        </div>
                    </div>
                    <div class="row column1">
                        <div class="w-50 h-100 p-3">
                            <div class="white_shd full margin_bottom_30">
                                <div class="full graph_head">
                                    <div class="heading1 margin_0">
                                        <h2>
                                            <spring:message code="song.activeSongs"/>
                                        </h2>
                                    </div>
                                    <div class="float-right">
                                        <a href="${pageContext.request.contextPath}/user/songs/add"
                                           class="btn btn-info" data-toggle="tooltip" data-placement="top" title
                                           data-original-title="blab"><spring:message code="button.add"/></a>
                                    </div>
                                </div>

                                <div class="table_section padding_infor_info">
                                    <div class="table-responsive-sm">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th><spring:message code="song.name"/></th>
                                                <th class="col-sm-2"><spring:message code="song.type"/></th>
                                                <th class="col-sm-3"><spring:message code="app.created"/></th>
                                                <th class="col-sm-2"><spring:message code="app.actions"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${songs}" var="song">
                                                <c:if test="${song.user.id == loggedUser.id}">
                                                    <c:if test="${song.active == 1}">
                                                        <tr id="${song.id}">
                                                            <td>${song.name} - ${song.author}</td>
                                                            <td>${song.guitarType}</td>
                                                            <td>${song.created}</td>
                                                            <td>
                                                                <div class="d-flex flex-row justify-content-md-between">
                                                                    <div>
                                                                        <c:if test="${song.hasFile == false}">
                                                                        <a href="${song.url}">
                                                                            <i class="fa fa-globe"></i>
                                                                        </a>
                                                                        </c:if>
                                                                        <c:if test="${song.hasFile == true}">
                                                                            <a href="/user/songs/show_file/${song.id}">
                                                                                <i class="fa fa-camera"></i>
                                                                            </a>
                                                                        </c:if>
                                                                    </div>
                                                                    <div>
                                                                        <a href="/user/songs/archive/${song.id}"
                                                                           type="button">
                                                                            <i class="fa fa-envelope"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div>
                                                                        <a href="/user/songs/delete/${song.id}"
                                                                           type="button">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="w-50 h-100 p-3">
                            <div class="white_shd full margin_bottom_30">
                                <div class="full graph_head">
                                    <div class="heading1 margin_0">
                                        <h2>
                                            <spring:message code="song.archivedSongs"/>
                                        </h2>
                                    </div>
                                </div>

                                <div class="table_section padding_infor_info">
                                    <div class="table-responsive-sm">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th><spring:message code="song.name"/></th>
                                                <th class="col-sm-2"><spring:message code="song.type"/></th>
                                                <th class="col-sm-3"><spring:message code="app.created"/></th>
                                                <th class="col-sm-2"><spring:message code="app.actions"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${songs}" var="song">
                                                <c:if test="${song.user.id == loggedUser.id}">
                                                    <c:if test="${song.active == 0}">
                                                        <tr>
                                                            <td>${song.name} - ${song.author}</td>
                                                            <td>${song.guitarType}</td>
                                                            <td>${song.created}</td>
                                                            <td>
                                                                <div class="d-flex flex-row justify-content-md-between">
                                                                    <div>
                                                                        <c:if test="${song.hasFile == false}">
                                                                            <a href="${song.url}">
                                                                                <i class="fa fa-globe"></i>
                                                                            </a>
                                                                        </c:if>
                                                                        <c:if test="${song.hasFile == true}">
                                                                            <a href="/user/songs/show_file/${song.id}">
                                                                                <i class="fa fa-camera"></i>
                                                                            </a>
                                                                        </c:if>
                                                                    </div>
                                                                    <div>
                                                                        <a href="/user/songs/active/${song.id}"
                                                                           type="button">
                                                                            <i class="fa fa-reply"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div>
                                                                        <a href="/user/songs/delete/${song.id}"
                                                                           type="button">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>


<jsp:include page="../constants/footer.jsp"/>