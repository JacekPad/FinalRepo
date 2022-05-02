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
                <div style="opacity: 95%" class="">

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
                                            <spring:message code="song.addSong"/>
                                        </h2>
                                    </div>
                                    <div class="float-right">
                                    <a style="opacity: 99%" class="fa fa-arrow-left" href="${pageContext.request.contextPath}/user/songs/list"><spring:message code="app.backToTheList"/></a>
                                    </div>
                                </div>
                                <form:form modelAttribute="song" method="post" enctype="multipart/form-data" accept = "image/*">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <div class="table_section padding_infor_info">
                                    <div>
                                            <div class="d-inline-flex">
                                                <div class="p-3">
                                                    <spring:message code="guitar.guitarType"/>
                                                </div>
                                                <div class="p-3">
                                                    <form:select items="${guitarTypes}" path="guitarType"/>
                                                    <form:hidden id="songName" path="name" />
                                                    <form:hidden id="songAuthor" path="author"/>
                                                    <form:hidden id="songUrl" path="url"/>
                                                </div>
                                            </div>

                                            <div class="d-inline-flex float-right p-3">
                                                <input class="btn btn-info" type="submit" value="<spring:message code="button.create"/>"/>
                                            </div>
                                    </div>
                                    <div class="row w-100 p-3">

                                        <div class="w-50">

                                            <div>
                                                <input type="radio" id="uploadChoice1"
                                                       name="upload" value="email" checked>
                                                <label for="uploadChoice1">API</label>
                                            </div>

                                            <div id="apiDiv" class="">
                                                <div class="card-body">
                                                    <form>
                                                        <label>
                                                            <spring:message code="song.artist"/>:
                                                            <input id="apiArtist" class="form-control" type="text"
                                                                   name="artistName"
                                                                   placeholder="<spring:message code="song.artist"/>">
                                                        </label>
                                                        <label>
                                                            <spring:message code="song.name"/>:
                                                            <input id="apiName" class="form-control" type="text"
                                                                   name="songName"
                                                                   placeholder="<spring:message code="song.name"/>">
                                                        </label>
                                                        <button id="apiSearch" class="btn btn-info" type="submit">
                                                            <i class="fa fa-search"></i>
                                                            <spring:message code="button.search"/>
                                                        </button>
                                                    </form>
                                                </div>
                                                <div>
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th class="col-sm-4"><spring:message code="song.name"/></th>
                                                            <th class="col-sm-3"><spring:message code="song.artist"/></th>
                                                            <th class="col-sm-2"><spring:message code="app.actions"/></th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="tableBody">
                                                        </tbody>
                                                    </table>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="w-50">
                                            <div class="">
                                                <input type="radio" id="uploadChoice2"
                                                       name="upload" value="phone">
                                                <label for="uploadChoice2">Upload</label>
                                                <label hidden></label>
                                            </div>
                                            <div id="uploadDiv" class="hidden">
                                                <div class="card-body">
                                                        <label>
                                                            <spring:message code="song.artist"/>:
                                                            <form:errors path="author"/>
                                                            <input id="uploadAuthor" class="form-control" type="text"
                                                                   name="artistName"
                                                                   placeholder="<spring:message code="song.artist"/>">
                                                        </label>
                                                        <label>
                                                            <spring:message code="song.name"/>:
                                                            <form:errors path="name"/>
                                                            <input id="uploadName" class="form-control" type="text" name="songName"
                                                                   placeholder="<spring:message code="song.name"/>">
                                                        </label>
                                                        <label>
                                                            <spring:message code="app.file"/>:
                                                            <input id="uploadFile" class="form-control" type="file" name="file">
                                                        </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </form:form>
                            </div>
                        </div>

                    </div>
                    <script src="<c:url value="/resources/js/custom/radioboxShowHide.js"/>"></script>
                    <script src="<c:url value="/resources/js/custom/ApiSongSearch.js"/>"></script>
<jsp:include page="../constants/footer.jsp"/>