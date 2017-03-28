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
<div class="panel-head"><strong><span class="icon-pencil-square-o"></span>图书归还</strong></div>
    <div class="panel-head"><strong>
        <span class="icon-user"></span>读者验证&nbsp;&nbsp;&nbsp;条形码：</strong>
        <input type="text" class="form-control" id="barcode" name="barcode" placeholder="请输入条形码">
        <input type="button" value="查询" onclick="borrowReader()">
    </div>
<table class="table table-hover">
    <tbody>
    <tr>
        <td>姓&nbsp;&nbsp;名：<input type="text" name="name" id="name" value="${rebackReader.name}" readonly="readonly"/></td>
        <td>性&nbsp;&nbsp;别：<input type="text" name="sex" id="sex" value="${rebackReader.sex}" readonly="readonly"/></td>
        <td>读者类型：<input type="text" name="typeid" id="typename" value="${rebackReader.readerType.name}" readonly="readonly"/></td>
    </tr>
    <tr>
        <td>证件类型：<input type="text" name="paperType" id="paperType" value="${rebackReader.paperType}" readonly="readonly"/></td>
        <td>读者号码：<input type="text" name="paperNo" id="paperNo" value="${rebackReader.paperNo}" readonly="readonly"/></td>
        <td>可借数量：<input type="text" name="number" id="number" value="${rebackReader.number}" readonly="readonly"/></td>
    </tr>
    </tbody>
</table>
<hr/>
<div class="panel-head"><strong><span class="icon-user"></span>借阅未还的图书信息</strong></div>
    <table class="table table-hover text-center" style="font-size: 12px">
        <tr>
            <th></th>
            <th>图书名称</th>
            <th>借阅时间</th>
            <th>应还时间</th>
            <th>出版社</th>
            <th>书架</th>
            <th>价格(元)</th>
            <th>状态</th>
            <th><input type="button" value="完成归还" onclick="rebackBook()"></th>
        </tr>
        <c:forEach items="${rebackBooks}" var="borrow">
            <tr>
                <td>
                    <form method="post" action="#" id="borrowForm">
                    <input type="checkbox" name="id[]" value="${borrow.id}"/>
                    <input type="hidden" name="bookid" value="${borrow.bookid}" id="bookid"/>
                    <input type="hidden" name="readerid" value="${borrow.readerid}" id="readerid"/>
                    <input type="hidden" name="operator" value="${manager.name}"/>
                    </form>
                </td>
                <td><input type="text" name="bookname" id="bookname" value="${borrow.bookInfo.bookname}" readonly="readonly"/></td>
                <td>
                    <input type="text" name="borrowTime" id="borrowTime" value="<fmt:formatDate value="${borrow.borrowTime}" pattern="yyyy-MM-dd"/>" readonly="readonly"/>
                </td>
                <td>
                    <input type="text" name="backTime" id="backTime" value="<fmt:formatDate value="${borrow.backTime}" pattern="yyyy-MM-dd"/>" readonly="readonly"/>
                </td>
                <td><input type="text" name="publish" id="publish" value="${borrow.bookInfo.publishing.pubname}" readonly="readonly"/></td>
                <td><input type="text" name="bookcase" id="bookcase" value="${borrow.bookInfo.bookcase.name}" readonly="readonly"/></td>
                <td><input type="text" name="price" id="price" value="${borrow.bookInfo.price}" readonly="readonly"/></td>
                <td><input type="text" name="ifback" id="${borrow.id}" value="<c:if test='${borrow.ifback==0}'>未还</c:if><c:if test='${borrow.ifback==1}'>已归还</c:if>" readonly="readonly"/></td>
            </tr>
        </c:forEach>
    </table>
<script type="text/javascript">
    function rebackBook() {
        var name = $('#name').val();
        if(name!=""){
            var Checkbox=false;
            var borrowId = "";
            $("input[name='id[]']").each(function(){
                if (this.checked==true) {
                    Checkbox=true;
                    borrowId = borrowId +　$(this).val() + ",";
                }
            });
            alert("全部id:"+borrowId);
            if (Checkbox){
                var t=confirm("确认要归还选中的图书？");
                if (t==false) {return false}
                else {
                    $.post(
                        '/rebackBook',
                        {"borrowId":borrowId},
                        function (result) {
                            if (result&&result['success']){
                                $("input[name='id[]']").each(function(){
                                    if (this.checked==true) {
                                        $('#'+$(this).val()).val("已归还");
                                    }
                                });
                                alert("归还成功!刷新");
                            }else{
                                alert(result['error']);
                            }
                        }
                    );
                };
            }
            else{
                alert("请选择您要续借的图书!");
                return false;
            }
        }else{
            alert("还没有没有读者借阅信息！");
        }
    }

    function borrowReader() {
        var barcode = $('#barcode').val();
        if (barcode!=""){
            window.location.href="/rebackBookInfo/"+barcode;
        }else{
            alert("请输入条形码")
        }
    }
</script>

</body>
</html>
