<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib  uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel-head"><strong><span class="icon-pencil-square-o"></span>图书借还</strong></div>
    <div class="panel-head"><strong>
        <span class="icon-user"></span>读者验证&nbsp;&nbsp;&nbsp;条形码：</strong>
        <input type="text" class="form-control" id="barcode" name="barcode" placeholder="请输入条形码">
        <input type="button" value="查询" onclick="borrowReader()">
    </div>
<table class="table table-hover">
    <tbody>
    <tr>
        <td>姓&nbsp;&nbsp;名：<input type="text" name="name" id="name" readonly="readonly"/></td>
        <td>性&nbsp;&nbsp;别：<input type="text" name="sex" id="sex" readonly="readonly"/></td>
        <td>读者类型：<input type="text" name="typeid" id="typename" readonly="readonly"/></td>
    </tr>
    <tr>
        <td>证件类型：<input type="text" name="paperType" id="paperType" readonly="readonly"/></td>
        <td>读者号码：<input type="text" name="paperNo" id="paperNo" readonly="readonly"/></td>
        <td>可借数量：<input type="text" name="number" id="number" readonly="readonly"/></td>
    </tr>
    </tbody>
</table>
<hr/>
<div class="panel-head" id="add">
    <strong><span class="icon-edit"></span>添加依据&nbsp;&nbsp;</strong>
    <input type="radio" name="check" value="barcode">图书条形码&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="radio" name="check" value="bookname">图书名称&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="barcode_bookname" id="queryBook">&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="查询" onclick="borrowBook()">&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="完成借阅" onclick="borrowInfo()">
</div>
<form method="post" action="#" id="borrowForm">
    <table class="table table-hover text-center" style="font-size: 12px">
        <tr>
            <th></th>
            <th>图书名称</th>
            <th>借阅时间</th>
            <th>应还时间</th>
            <th>出版社</th>
            <th>书架</th>
            <th>价格(元)</th>
        </tr>
        <%--<c:forEach items="${books}" var="book">--%>
            <tr>
                <td>
                    <input type="checkbox" name="id[]" value="1"/>
                    <input type="hidden" name="bookid" id="bookid"/>
                    <input type="hidden" name="readerid" id="readerid"/>
                    <input type="hidden" name="operator" value="${manager.name}"/>
                    <input type="hidden" name="ifback" value="0"/>
                </td>
                <td><input type="text" name="bookname" id="bookname"  readonly="readonly"/></td>
                <td><input type="text" name="borrowTime" id="borrowTime"  readonly="readonly"/></td>
                <td><input type="text" name="backTime" id="backTime"  readonly="readonly"/></td>
                <td><input type="text" name="publish" id="publish" readonly="readonly"/></td>
                <td><input type="text" name="bookcase" id="bookcase" readonly="readonly"/></td>
                <td><input type="text" name="price" id="price" readonly="readonly"/></td>
            </tr>
        <%--</c:forEach>--%>
    </table>
</form>

<script type="text/javascript">
    function borrowInfo() {
        var barcode = $('#barcode').val();
        var choosetype = $("input[name='check']:checked").val()
        var bookCondition = $('#queryBook').val();
        if(barcode!=""&&choosetype!=null&&bookCondition!=""){
            $.post(
                '/completeBorrow',
                $('#borrowForm').serialize(),
                function (result) {
                    if (result&&result['success']){
                        alert("借阅成功！如再次借阅请先刷新信息");
                    }else{
                        alert(result['error']);
                    }
                }
            );
        }else{
            alert("还没有没有借阅信息！");
        }

    }

    function borrowReader() {
        var barcode = $('#barcode').val();
        if (barcode!=""){
            $.get(
                '/borrowReader/'+barcode,
                {},
                function (result) {
                    if (result&&result['success']){
                        var borrowReader = result['data'];
                        var readerid = borrowReader['id'];
                        $('#readerid').val(readerid);
                        var name = borrowReader['name'];
                        $('#name').val(name);
                        var sex = borrowReader['sex'];
                        $('#sex').val(sex);
                        var readerType = borrowReader['readerType'];
                        var typename = readerType['name']
                        $('#typename').val(typename);
                        var paperType = borrowReader['paperType'];
                        $('#paperType').val(paperType);
                        var paperNo = borrowReader['paperNo'];
                        $('#paperNo').val(paperNo);
                        var number = borrowReader['number'];
                        $('#number').val(number);
                        //alert("number"+number);
                    }else {
                        var error = result['error'];
                        alert("提示："+error);
                    }
                }
            );
        }else{
            alert("请输入条形码")
        }
    }
    
    function borrowBook() {
        var choosetype = $("input[name='check']:checked").val()
        var bookCondition = $('#queryBook').val();
        if (choosetype!=null&&bookCondition!=""){
            //alert(choosetype+"="+bookCondition);
            var obj = {};
            $.get(
                '/borrowBook',
                {"bookCondition":bookCondition,"choosetype":choosetype},
                function (result) {
                    if (result&&result['success']){
                        var borrowBook = result['data'];
                        var bookid = borrowBook['id'];
                        var bookname = borrowBook['bookname'];
                        var borrowTime = borrowBook['borrowTime'];
                        var backTime = borrowBook['backTime'];
                        var price = borrowBook['price'];
                        $('#bookid').val(bookid);
                        $('#bookname').val(bookname);
                        $('#borrowTime').val(borrowTime);
                        $('#backTime').val(backTime);
                        $('#price').val(price);
                        //alert(borrowTime);
                        //alert(backTime);
                        var publishing = borrowBook['publishing'];
                        var pubname = publishing['pubname'];
                        $('#publish').val(pubname);
                        var bookcase = borrowBook['bookcase'];
                        var casename = bookcase['name']
                        $('#bookcase').val(casename);
                        //alert(casename+"  "+pubname);
                    }else{
                        alert(result['error']);
                    }
                }
            );

        }else{
            alert("选择搜索类型且输入正确内容");
        }
    }
</script>

</body>
</html>
