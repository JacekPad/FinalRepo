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
                                <a class="fa fa-arrow-left" href="${pageContext.request.contextPath}/user/songs/list"> Back to the list</a>
                            </div>
                        </div>
                    </div>
                    <div class="row column1">
                        <div class="w-100 h-100">
                            <div class="white_shd full margin_bottom_30">
                                <div class="full graph_head">
                                    <div class="heading1 margin_0">
                                        <h2>
                                            Add a song
                                        </h2>
                                    </div>
                                </div>
                                <div class="table_section padding_infor_info">
                                    <div>
                                        <form:form modelAttribute="song" method="post">
                                            <div class="d-inline-flex">
                                                <div class="p-3">
                                                    Guitar type:
                                                </div>
                                                <div class="p-3">
                                                    <form:select items="${guitarTypes}" path="guitarType"/>
                                                    <form:input id="songName" path="name" />
                                                    <form:errors path="name"/>
                                                    <form:input id="songAuthor" path="author"/>
                                                    <form:errors path="author"/>
                                                    <form:input id="songUrl" path="url"/>

                                                </div>
                                            </div>

                                            <div class="d-inline-flex float-right p-3">
                                                <input class="btn btn-info" type="submit" value="Create"/>
                                            </div>
                                        </form:form>
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
                                                            Artist/Band:
                                                            <input id="apiArtist" class="form-control" type="text"
                                                                   name="artistName"
                                                                   placeholder="Artist/Band name">
                                                        </label>
                                                        <label>
                                                            Song name:
                                                            <input id="apiName" class="form-control" type="text"
                                                                   name="songName"
                                                                   placeholder="Song name">
                                                        </label>
                                                        <button id="apiSearch" class="btn btn-info" type="submit">
                                                            <i class="fa fa-search"></i>
                                                            Search
                                                        </button>
                                                    </form>
                                                </div>
                                                <div>
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th class="col-sm-4">Song name</th>
                                                            <th class="col-sm-3">Artist Name</th>
                                                            <th class="col-sm-2">Actions</th>
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
                                            </div>
                                            <div id="uploadDiv" class="hidden">
                                                <div class="card-body">
                                                    <form>
                                                        <label>
                                                            Artist/Band:
                                                            <input id="uploadAuthor" class="form-control" type="text"
                                                                   name="artistName"
                                                                   placeholder="Artist/Band name">
                                                        </label>
                                                        <label>
                                                            Song name:
                                                            <input id="uploadName" class="form-control" type="text" name="songName"
                                                                   placeholder="Song name">
                                                        </label>
                                                        <button id="uploadButton" class="btn btn-info"
                                                                type="submit">
                                                            <i class="fa fa-upload"></i>
                                                            Upload
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="p-3">
                                        <div id="apiContent">
                                            API PREVIEW:
                                        </div>
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
                <script src="<c:url value="/resources/js/chart_custom_style1.js"/>"></script>
                <script src="<c:url value="/resources/bootstrap.bundle.min.js"/>"></script>
                <script src="<c:url value="/resources/js/custom/radioboxShowHide.js"/>"></script>
                <script src="<c:url value="/resources/js/custom/ApiSongSearch.js"/>"></script>

<jsp:include page="/WEB-INF/views/constants/footer.jsp"/>