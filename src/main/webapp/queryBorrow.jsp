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
        <strong><span class="icon-edit"></span></strong>请选择查询条件：
        <form action="/queryBorrow" method="post">
        <input type="checkbox" name="choose" value="1">
        <select name="queryType" class="input-sm">
            <option  value="1">图书条形码</option>
            <option  value="2">图书名称</option>
            <option  value="3">读者条形码</option>
            <option  value="4">读者名称</option>
        </select>
        <input type="text" class="form-control" id="queryCont" name="queryCont" placeholder="请输入搜索内容">
        <input type="submit" value="查询" onclick="return queryBook()">
            <span id="error" style="color: red">${error}</span><br/>
        <input type="checkbox" name="choose" value="2">
        借阅时间：从<input type="text" class="form-control" id="borrowTime" name="begin">
        到<input type="text" class="form-control" id="backTime" name="end">
        </form>
    </div>
    <div>
    <table class="table table-hover text-center" style="font-size: 12px">
        <tr>
            <th>图书条形码</th>
            <th>图书名称</th>
            <th>读者条形码</th>
            <th>读者名称</th>
            <th>借阅时间</th>
            <th>应还时间</th>
            <th>是否归还</th>
        </tr>
        <c:forEach items="${borrows}" var="borrow">
            <tr>
                <td>${borrow.bookInfo.barcode}</td>
                <td>${borrow.bookInfo.bookname}</td>
                <td>${borrow.reader.barcode}</td>
                <td>${borrow.reader.name}</td>
                <td>
                    <fmt:formatDate value="${borrow.borrowTime}" pattern="yyyy-MM-dd"/>
                </td>
                <td>
                    <fmt:formatDate value="${borrow.backTime}" pattern="yyyy-MM-dd"/>
                </td>
                <td>
                    <c:if test='${borrow.ifback==0}'>未还</c:if>
                    <c:if test='${borrow.ifback==1}'>已归还</c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
    </div>
<script type="text/javascript">
    function queryBook() {
        var queryCont = $('#queryCont').val();
        var begin = $('#borrowTime').val();
        var end = $('#backTime').val();
        var Checkbox=false;
        var choose = "x";
        $("input[name='choose']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
                choose = choose+$(this).val();
            }
        });
        //alert(choose);
        if (choose=='x1'){
            if (queryCont!=""){
                return true;
            }else{
                alert("请输入搜索内容");
                return false;
            }
        }else if(choose=='x2'){
            if(begin!=""&&end!=""){
                return true;
            }else{
                alert("请输入时间区间");
                return false;
            }
        }else if(choose=='x12'){
            if(queryCont!=""&&begin!=""&&end!=""){
                return true;
            }else{
                alert("请输入选择条件的全部信息");
                return false;
            }
        }else{
            alert("请先选择搜索条件");
            return false;
        }
    }
</script>

</body>
</html>
