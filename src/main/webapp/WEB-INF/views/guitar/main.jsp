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
                                            <spring:message code="guitar.guitars"/>
                                        </h2>
                                    </div>
                                    <div class="float-right">
                                        <a href="${pageContext.request.contextPath}/user/guitars/add" class="btn btn-info"> <spring:message code="button.add"/>   </a>
                                    </div>
                                </div>

                                <div class="table_section padding_infor_info">
                                    <div class="table-responsive-sm">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th> <spring:message code="guitar.guitar"/></th>
                                                <th class="col-sm-4"><spring:message code="app.created"/></th>
                                                <th class="col-sm-2"><spring:message code="app.actions"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${guitars}" var="guitar">
                                                <c:if test="${guitar.user.id == loggedUser.id}">
                                                <tr>
                                                    <td>${guitar.name}</td>
                                                    <td>${guitar.created}</td>
                                                    <td>
                                                        <div class="d-flex flex-row justify-content-md-between w-100">
                                                            <div>
                                                                <a href="${pageContext.request.contextPath}/user/guitars/update/${guitar.id}">
                                                                    <i style="color: gray" class="btn fa fa-pencil"><spring:message code="button.edit"/></i>
                                                                </a>
                                                            </div>
                                                            <div>
                                                                <a href="${pageContext.request.contextPath}/user/guitars/delete/${guitar.id}">
                                                                    <i style="color: gray" class="btn fa fa-trash"><spring:message code="button.delete"/></i>
                                                                </a>
                                                            </div>
                                                            <div>
                                                                <button style="background: none; border: none; color:gray;" type="button"
                                                                        class="btn accordion-button collapsed fa fa-plus"
                                                                        data-bs-toggle="collapse"
                                                                        data-bs-target="#collapse${guitar.id}"><spring:message code="button.expand"/></button>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <div id="collapse${guitar.id}" class="accordion-collapse collapse"
                                                             data-bs-parent="#myAccordion">
                                                            <div class="card-body">
                                                                <div class="d-flex flex-row justify-content-md-start padding-bottom_1">
                                                                    <div class="p-3">${guitar.name}</div>
                                                                    <div class="p-3">${guitar.type}</div>
                                                                </div>
                                                                <div class="d-flex flex-row justify-content-md-start">
                                                                    <div class="d-flex flex-row">
                                                                        <span class="p-3"><spring:message code="guitar.stringBrand"/>:</span>
                                                                        <span class="p-3">${guitar.stringBrand.brand}</span>
                                                                    </div>
                                                                    <div class="d-flex flex-row">
                                                                        <span class="p-3"><spring:message code="guitar.stringSize"/>:</span>
                                                                        <span class="p-3">${guitar.stringSize.size}</span>
                                                                    </div>
                                                                </div>

                                                                <div class="d-flex flex-row justify-content-md-start">
                                                                    <div class="d-flex flex-row">
                                                                        <span class="p-3"><spring:message code="guitar.stringChange"/>:</span>
                                                                        <span class="p-3">${guitar.stringChange}</span>
                                                                        <a data-freq="${guitar.stringFreq}" class="blue1_color p-3" href="/user/guitars/change/${guitar.id}"><spring:message code="guitar.stringChangeReset"/>
                                                                            <i class="fa fa-refresh"></i>
                                                                        </a>
                                                                        <span class="p-3"><spring:message code="guitar.guitarMaintenanceName"/>:</span>
                                                                        <span class="p-3">${guitar.maintenanceDate}</span>
                                                                        <a data-freq="${guitar.maintenanceFreq}" class="blue1_color p-3" href="/user/guitars/maintenance/${guitar.id}"><spring:message code="guitar.guitarMaintenanceReset"/>
                                                                            <i class="fa fa-refresh"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                        </div>
                                                    </td>
                                                </tr>
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