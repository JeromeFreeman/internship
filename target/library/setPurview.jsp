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
        /*初始值*/
        window.onload=function check() {
            var box = document.getElementsByClassName("power")
            for(var i=0;i<box.length;i++){
                if(box[i].value==1){
                    box[i].checked=true;
                }else{
                    box[i].checked=false;
                }
            }
        }
        /*获取修改后的值*/
        function modify() {
            var box = document.getElementsByClassName("power")
            var array = new Array(5);
            for(var i=0;i<box.length;i++){
                //alert("修改前"+box[i].value);
                if(box[i].checked==true){
                    box[i].value = 1;
                    //alert("修改后选中"+box[i].value);
                }else{
                    box[i].value = 0;
                    //alert("修改后没选中"+box[i].value);
                }
            }
        }
    </script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span>  管理员权限设置</strong></div>
    <div class="body-content">
            <form method="post" action="/setPurview">
                <div class="panel admin-panel">
                    <div class="panel-head"><strong class="icon-reorder">管理员权限设置</strong></div>
                    <%--<h3>
                        <a onclick="window.open('addManager.jsp',' _blank','width=750,height=565,top=80,left=80,toolbar=no, menubar=no, scrollbars=no, resizable=no');">编辑</a>
                    </h3>--%>
                    <table class="table table-hover text-center" style="font-size: 12px">
                        <tr>
                            <th width="120">管理员名称</th>
                            <th>系统设置</th>
                            <th>读者管理</th>
                            <th>图书管理</th>
                            <th>图书借还</th>
                            <th>系统查询</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${purviews}" var="view">
                            <c:if test="${param.id==view.id}">
                            <tr>
                                <td>${view.manager.name}</td>
                                <td><input type="checkbox" class="power" name="sysset" value="${view.sysset}"></td>
                                <td><input type="checkbox" class="power" name="readerset" value="${view.readerset}"></td>
                                <td><input type="checkbox" class="power" name="bookset" value="${view.bookset}"></td>
                                <td><input type="checkbox" class="power" name="borrowback" value="${view.borrowback}"></td>
                                <td><input type="checkbox" class="power" name="sysquery" value="${view.sysquery}"></td>
                            </tr>
                            <tr>
                                <input type="hidden" name="id" value="${view.id}">
                                <td><input type="submit" value="提交" onclick="modify()"></td>
                            </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
            </form>
    </div>
</div>
</body></html>
