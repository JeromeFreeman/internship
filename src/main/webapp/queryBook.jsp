<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib  uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="/css/pintuer.css">
    <link rel="stylesheet" href="/css/admin.css">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/js/pintuer.js"></script>
</head>
<body>
<div class="panel-head"><strong><span class="icon-pencil-square-o"></span>图书档案查询</strong></div>
    <div class="panel-head">
        <strong><span class="icon-edit"></span></strong>
        请选择查询条件：
        <form action="/queryBook" method="post">
        <select name="queryType" class="input-sm">
            <option value="1">条形码</option>
            <option value="2">类别</option>
            <option value="3">书名</option>
            <option value="4">作者</option>
            <option value="5">出版社</option>
            <option value="6">书架</option>
        </select>
        <input type="text" class="form-control" id="queryCont" name="queryCont" placeholder="请输入搜索内容">
        <input type="submit" value="查询" onclick="return queryBook()">
            <span id="error" style="color: red">${error}</span>
        </form>
    </div>
    <div>
    <table class="table table-hover text-center" style="font-size: 12px">
        <tr>
            <th>条形码</th>
            <th>图书名称</th>
            <th>图书类型</th>
            <th>出版社</th>
            <th>书架</th>
        </tr>
        <c:forEach items="${bookInfos}" var="bookInfo">
            <tr>
                <td>${bookInfo.barcode}</td>
                <td>${bookInfo.bookname}</td>
                <td>${bookInfo.bookType.typename}</td>
                <td>${bookInfo.publishing.pubname}</td>
                <td>${bookInfo.bookcase.name}</td>
            </tr>
        </c:forEach>
    </table>
    </div>
<script type="text/javascript">
    function queryBook() {
        var queryCont = $('#queryCont').val();
        if (queryCont!=""){
            return true;
        }else{
            alert("请输入搜索内容")
            return false;
        }
    }
</script>

</body>
</html>
