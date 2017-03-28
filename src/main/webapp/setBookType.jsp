<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib  uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>addType</title>
</head>
<body>
<form method="post" action="/setBookType">
    <c:forEach var="bType" items="${bookTypes}">
        <c:if test="${bType.id==param.id}">
            类型名称：<input type="text" name="typename" value="${bType.typename}"><br>
            可借数量：<input type="text" name="days" value="${bType.days}"><br>
            <input type="hidden" name="id" value="${bType.id}">
            <input type="submit" value="提交">
        </c:if>
    </c:forEach>

</form>
</body>
</html>
