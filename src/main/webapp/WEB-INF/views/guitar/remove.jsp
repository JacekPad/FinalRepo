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
        <div id="content">
            <!-- topbar -->
            <jsp:include page="/WEB-INF/views/constants/topbar.jsp"/>
            <!-- end topbar -->
            <!-- dashboard inner -->
            <div class="midde_cont">
                <div class="container-fluid">

                    <div class="row column_title">
                        <div class="col-md-12">
                            <div class="page_title">
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
                                        <button class="btn btn-block" type="button"><spring:message code="button.add"/></button>
                                    </div>
                                </div>

                                <div class="table_section padding_infor_info">
                                    <div class="table-responsive-sm">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th><spring:message code="guitar.guitar"/></th>
                                                <th class="col-sm-4"><spring:message code="app.created"/></th>
                                                <th class="col-sm-2"><spring:message code="app.actions"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>Guitar name auto</td>
                                                <td>Date created auto</td>
                                                <td>
                                                    <div class="d-flex flex-row justify-content-md-between w-50">
                                                        <div>
                                                            <a href="/update">
                                                                <i class="fa fa-pencil"></i>
                                                            </a>
                                                        </div>
                                                        <div>
                                                            <a href="/remove">
                                                                <i class="fa fa-trash"></i>
                                                            </a>
                                                        </div>
                                                        <div>
                                                            <button type="button"
                                                                    class="btn accordion-button collapsed fa fa-plus fa-border"
                                                                    data-bs-toggle="collapse"
                                                                    data-bs-target="#collapseOne"></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <div id="collapseOne" class="accordion-collapse collapse"
                                                         data-bs-parent="#myAccordion">
                                                        <div class="card-body">
                                                            <div class="d-flex flex-row justify-content-md-start padding-bottom_1">
                                                                <div class="p-3">{Guitar name}</div>
                                                                <div class="p-3">{Guitar type}</div>
                                                            </div>
                                                            <div class="d-flex flex-row justify-content-md-start">
                                                                <div class="d-flex flex-row">
                                                                    <span class="p-3">Strings brand:</span>
                                                                    <span class="p-3">{string brand}</span>
                                                                </div>
                                                                <div class="d-flex flex-row">
                                                                    <span class="p-3">Strings size:</span>
                                                                    <span class="p-3">{String size}</span>
                                                                </div>
                                                            </div>

                                                            <div class="d-flex flex-row justify-content-md-start">
                                                                <div class="d-flex flex-row">
                                                                    <span class="p-3">String change:</span>
                                                                    <span class="p-3">{xx-yy-zzzz}</span>
                                                                    <a class="blue1_color p-3" href="#">Update string change
                                                                        <i class="fa fa-refresh"></i>
                                                                    </a>
                                                                    <span class="p-3">Guitar maintenance:</span>
                                                                    <span class="p-3">{xx-yy-zzzz}</span>
                                                                    <a class="blue1_color p-3" href="#">Update guitar maintenance
                                                                        <i class="fa fa-refresh"></i>
                                                                    </a>
                                                                </div>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </td>
                                            </tr>



                                            <tr>
                                                <td>DELETE THIS</td>
                                                <td>Date created auto</td>
                                                <td>
                                                    Edit
                                                    Remove
                                                    <button type="button"
                                                            class="btn accordion-button collapsed fa fa-plus fa-border"
                                                            data-bs-toggle="collapse"
                                                            data-bs-target="#collapseTwo"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <div id="collapseTwo" class="accordion-collapse collapse"
                                                         data-bs-parent="#myAccordion">
                                                        <div class="card-body">
                                                            <div class="d-flex flex-row justify-content-md-start padding-bottom_1">
                                                                <div class="p-3">{Guitar name}</div>
                                                                <div class="p-3">{Guitar type}</div>
                                                            </div>
                                                            <div class="d-flex flex-row justify-content-md-start">
                                                                <div class="d-flex flex-row">
                                                                    <span class="p-3">Strings brand:</span>
                                                                    <span class="p-3">{string brand}</span>
                                                                </div>
                                                                <div class="d-flex flex-row">
                                                                    <span class="p-3">Strings size:</span>
                                                                    <span class="p-3">{String size}</span>
                                                                </div>
                                                            </div>
                                                            <div class="d-flex flex-row justify-content-md-start">
                                                                <div class="d-flex flex-row">
                                                                    <span class="p-3">String change:</span>
                                                                    <span class="p-3">{xx-yy-zzzz}</span>
                                                                    <a class="blue1_color p-3" href="#">Update string change
                                                                        <i class="fa fa-refresh"></i>
                                                                    </a>
                                                                    <span class="p-3">Guitar maintenance:</span>
                                                                    <span class="p-3">{xx-yy-zzzz}</span>
                                                                    <a class="blue1_color p-3" href="#">Update guitar maintenance
                                                                        <i class="fa fa-refresh"></i>
                                                                    </a>
                                                                </div>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>DELETE THIS</td>
                                                <td>Date created auto</td>
                                                <td>
                                                    Edit
                                                    Remove
                                                    <button type="button"
                                                            class="btn accordion-button collapsed fa fa-plus fa-border"
                                                            data-bs-toggle="collapse"
                                                            data-bs-target="#dupa"></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <div id="dupa" class="accordion-collapse collapse"
                                                         data-bs-parent="#myAccordion">
                                                        <div class="card-body">
                                                            <div class="d-flex flex-row justify-content-md-start padding-bottom_1">
                                                                <div class="p-3">{Guitar name}</div>
                                                                <div class="p-3">{Guitar type}</div>
                                                            </div>
                                                            <div class="d-flex flex-row justify-content-md-start">
                                                                <div class="d-flex flex-row">
                                                                    <span class="p-3">Strings brand:</span>
                                                                    <span class="p-3">{string brand}</span>
                                                                </div>
                                                                <div class="d-flex flex-row">
                                                                    <span class="p-3">Strings size:</span>
                                                                    <span class="p-3">{String size}</span>
                                                                </div>
                                                            </div>
                                                            <div class="d-flex flex-row justify-content-md-start">
                                                                <div class="d-flex flex-row">
                                                                    <span class="p-3">String change:</span>
                                                                    <span class="p-3">{xx-yy-zzzz}</span>
                                                                    <a class="blue1_color p-3" href="#">Update string change
                                                                        <i class="fa fa-refresh"></i>
                                                                    </a>
                                                                    <span class="p-3">Guitar maintenance:</span>
                                                                    <span class="p-3">{xx-yy-zzzz}</span>
                                                                    <a class="blue1_color p-3" href="#">Update guitar maintenance
                                                                        <i class="fa fa-refresh"></i>
                                                                    </a>
                                                                </div>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </td>
                                            </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

<jsp:include page="../constants/footer.jsp"/>