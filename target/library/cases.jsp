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
    <script type="text/javascript">

        /*修改*/
        function caseModify(id) {
            var winSet = window.open('caseModify.jsp?id='+id,' _blank','width=650,height=550,top=120,left=120,toolbar=no, menubar=no, scrollbars=no, resizable=no')
            /*监听事件*/
            var loop = setInterval(function() {
                if(winSet.closed) {
                    clearInterval(loop);
                    //alert('closed');
                    //parent.location.reload();
                    window.location.href = "/cases";
                }
            }, 1);
        }



    </script>
</head>
<body>
<form method="post" action="#">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">书架设置</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
                    <button type="submit" class="button border-red"><span class="icon-trash-o"></span> 批量删除</button>
                    <button type="button" class="button border-blue" id="addCase"><span class="icon-edit"></span> 添加书架</button>&nbsp;&nbsp;
                    <span style="color: red">${error}</span>
                </li>
            </ul>
        </div>
        <%--<h3>
            <a onclick="window.open('addManager.jsp',' _blank','width=750,height=565,top=80,left=80,toolbar=no, menubar=no, scrollbars=no, resizable=no');">编辑</a>
        </h3>--%>
        <table class="table table-hover text-center" style="font-size: 12px; width: 75%">
            <tr>
                <th width="70%">书架名称</th>
                <th>修改</th>
                <th>删除</th>
            </tr>
            <c:forEach items="${bookcases}" var="cases">
                <tr>
                    <td><input type="checkbox" name="id[]" value="1" />${cases.name}</td>
                    <td><div class="button-group">
                        <a class="button border-yellow" href="javascript:caseModify(${cases.id})">
                            <span class="icon-edit"></span> 修改
                        </a></div>
                    </td>
                    <td><div class="button-group">
                        <a class="button border-red" href="javascript:void(0)" onclick="return del(${cases.id})">
                            <span class="icon-trash-o"></span> 删除
                        </a>
                    </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</form>
<script type="text/javascript">

    function del(id){
        if(confirm("您确定要删除吗?")){
            window.location.href="/caseDel?id="+id;
            //ajax?
        }
    }

    /*添加*/
    $("#addCase").click(function(){
        var winObj = window.open('addCase.jsp',' _blank','width=650,height=550,top=120,left=120,toolbar=no, menubar=no, scrollbars=no, resizable=no')
        /*监听事件*/
        var loop = setInterval(function() {
            if(winObj.closed) {
                clearInterval(loop);
                //alert('closed');
                //parent.location.reload();
                window.location.href = "/cases";
            }
        }, 1);
    })


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
