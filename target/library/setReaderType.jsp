<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib  uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>addType</title>
</head>
<body>
<form method="post" action="/setReaderType">
    <c:forEach var="reType" items="${readerTypes}">
        <c:if test="${reType.id==param.id}">
            类型名称：<input type="text" name="name" value="${reType.name}"><br>
            可借数量：<input type="text" name="number" value="${reType.number}"><br>
            <input type="hidden" name="id" value="${reType.id}">
            <input type="submit" value="提交">
        </c:if>
    </c:forEach>

</form>
</body>
</html>
