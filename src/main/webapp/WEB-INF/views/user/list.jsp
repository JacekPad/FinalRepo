<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/user/add"><spring:message code="button.add"/></a> <br>
<c:forEach items="${users}" var="user">

    ${user}
    <a href="/user/update/${user.id}"><spring:message code="button.edit"/></a>
    <a href="/user/delete/${user.id}"><spring:message code="button.delete"/></a>
    <br>


</c:forEach>


</body>
</html>
