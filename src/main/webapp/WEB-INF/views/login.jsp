<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="constants/header.jsp"/>
<body class="inner_page login">
<div style="background-size: 100%; background-image: url(/resources/images/3845477.jpg)" class="full_container">
    <div class="midde_cont">
        <div class="center verticle_center full_height justify-content-around">
            <div style="background-color:rgb(255,255,255,90%)" class="p-3 login_section">
                <div class="logo_login">
                    <div class="center">
                        <h2 style="color: white"><spring:message code="app.registration"/></h2>
                    </div>
                </div>
                <div class="login_form">
                    <form:form modelAttribute="user" method="post" action="${pageContext.request.contextPath}/register">
                        <fieldset>
                            <div class="field d-flex">
                                <label class="label_field"><spring:message code="user.userName"/>:</label>
                                <form:input path="username" placeholder="Type user name"/>
                            </div>
                            <form:errors path="username"/>

                            <div class="field d-flex">
                                <label class="label_field"><spring:message code="user.password"/>:</label>
                                <form:password path="password" placeholder="Type password"/>
                            </div>
                            <form:errors path="password"/>

                            <form method="post">
                            <div class="field d-flex">
                                <label class="label_field"><spring:message code="user.password"/>:</label>
                                <input type="password" name="password2" placeholder="Type password again">
                            </div>
                            <div class="field d-flex">
                                <label class="label_field"><spring:message code="user.email"/>:</label>
                                <form:input path="email" placeholder="Type email"/>
                            </div>
                                <form:errors path="email"/>
                                <div class="field margin_0">
                                    <label class="label_field hidden">hidden label</label>
                                    <input class="main_bt" type="submit" value="<spring:message code="button.singIn"/>">
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </fieldset>
                    </form:form>
                </div>
            </div>
            <div style="background-color:rgb(255,255,255,90%)" class="p-3 login_section">
                <div class="logo_login">
                    <div class="center">
                        <h2 style="color: white"><spring:message code="app.logIn"/></h2>
                    </div>
                </div>
                <div class="login_form">
                    <form method="post">
                        <div class="field d-flex">
                            <label class="label_field"><spring:message code="user.userName"/>:</label>
                            <input type="text" name="username" placeholder="Type user name">
                        </div>
                        <div class="field d-flex">
                            <label class="label_field"><spring:message code="user.password"/>:</label>
                            <input type="password" name="password" placeholder="Type password">
                        </div>
                        <div class="field d-flex">
                            <label class="label_field hidden">:</label>
                        </div>
                        <div class="field margin_0">
                            <label class="label_field hidden">hidden label</label>
                            <input class="main_bt" type="submit" value="<spring:message code="button.logIn"/>">
                        </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<jsp:include page="constants/footer.jsp"/>