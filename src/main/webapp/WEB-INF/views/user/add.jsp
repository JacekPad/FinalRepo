<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jacek
  Date: 07.04.2022
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form modelAttribute="user" method="post">
    <spring:message code="user.userName"/>:
    <form:input path="userName"/>
    <form:errors path="userName"/> <br>

    <spring:message code="user.password"/>:
    <form:password path="password"/>
    <form:errors path="password"/> <br>

    <spring:message code="user.email"/>:
    <form:input path="email"/>
    <form:errors path="email"/> <br>
    
    <input type="submit" value="<spring:message code="button.send"/>">
</form:form>



</body>
</html>
