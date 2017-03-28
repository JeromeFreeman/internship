<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib  uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>addType</title>
</head>
<body>
<form method="post" action="/addBookType">
    类型名称：<input type="text" name="typename"><br>
    可借天数：<input type="text" name="days"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
