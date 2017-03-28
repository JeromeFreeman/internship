<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib  uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>addType</title>
</head>
<body>
<form method="post" action="/addReaderType">
    类型名称：<input type="text" name="name"><br>
    可借数量：<input type="text" name="number"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
