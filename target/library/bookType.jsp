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
<form action="#">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">图书类型管理</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
                    <button type="button" class="button border-red"><span class="icon-trash-o"></span> 批量删除</button>
                    <button type="button" class="button border-blue" id="addBookType"><span class="icon-edit"></span> 添加类型</button>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center" style="font-size: 12px;">
            <tr>
                <th width="100"></th>
                <th width="500">图书类型名称</th>
                <th width="400">可借天数</th>
                <th>修改</th>
                <th>删除</th>
            </tr>
            <c:set var="index" value="0" />
            <c:forEach items="${bookTypes}" var="bType">
                <tr>
                    <td><input type="checkbox" name="id[]" value="1" /></td>
                    <td>${bType.typename}</td>
                    <td>${bType.days}</td>
                    <td><div class="button-group"> <a class="button border-blue" href="javascript:void(0)" onclick="return updateBook(${bType.id})"><span class="icon-edit"></span> 修改</a> </div></td>
                    <td><div class="button-group"> <a class="button border-red" href="javascript:void(0)" onclick="return del(${bType.id})"><span class="icon-trash-o"></span> 删除</a> </div></td>
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
            window.location.href="/delBookType?id="+id;
        }
    }
    //添加
    $("#addBookType").click(function(){
        var add = window.open('addBookType.jsp',' _blank','width=300,height=300,top=500,left=500,toolbar=no, menubar=no, scrollbars=no, resizable=no')
        /*监听事件*/
        var loop = setInterval(function() {
            if(add.closed) {
                clearInterval(loop);
                //alert('closed');
                //parent.location.reload();
                window.location.href = "/bookType";
            }
        }, 1);
    })
    //更新
    function updateBook(id) {
        var set = window.open('setBookType.jsp?id='+id,' _blank','width=300,height=300,top=500,left=500,toolbar=no, menubar=no, scrollbars=no, resizable=no')
        /*监听事件*/
        var loop = setInterval(function() {
            if(set.closed) {
                clearInterval(loop);
                //alert('closed');
                //parent.location.reload();
                window.location.href = "/bookType";
            }
        }, 1);
    }


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
</script>
</body></html>
