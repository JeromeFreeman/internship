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
<form method="post" action="#">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">图书排行榜</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
                    <button type="submit" class="button border-red"><span class="icon-trash-o"></span> 批量删除</button>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center" style="font-size: 12px">
            <tr>
                <th width="100">排名</th>
                <th>图书条形码</th>
                <th>图书名称</th>
                <th>图书类型</th>
                <th>书架</th>
                <th width="15%">出版社</th>
                <th width="100">作者</th>
                <th>定价(元)</th>
                <th>借阅次数</th>
                <th>操作</th>
            </tr>
            <c:set var="index" value="0" />
            <c:forEach items="${bookList}" var="book">
            <tr>
                <td><input type="checkbox" name="id[]" value="1" />
                    <c:set var="index" value="${index+1}" />${index}
                </td>
                <td>${book.barcode}</td>
                <td>${book.bookname}</td>
                <td>${book.bookType.typename}</td>
                <td>${book.bookcase.name}</td>
                <td>${book.publishing.pubname}</td>
                <td>${book.author}</td>
                <td>${book.price}</td>
                <td>${book.del}</td>
                <td><div class="button-group"> <a class="button border-red" href="javascript:void(0)" onclick="return del(1)"><span class="icon-trash-o"></span> 删除</a> </div></td>
            </tr>
            </c:forEach>
            <tr>
                <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">

    function del(id){
        if(confirm("您确定要删除吗?")){

        }
    }

    $("#checkall").click(function(){
        $("input[name='id[]']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    function DelSelect(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var t=confirm("您确认要删除选中的内容吗？");
            if (t==false) return false;
        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }

</script>
</body></html>
