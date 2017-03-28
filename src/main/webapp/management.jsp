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
        /*window.onload=showCheckBox();
        function showCheckBox() {
            //var power=$("input[name='"+power+"']").val();
            //选择所有的name属性等于'power'的input元素
            //var power = $("input[name='power']").val();
            alert("123");
            $("input[name='power']").each(function(i){
                alert($(this).val());
                if($(this).val()==1) {
                    $(this).attr('checked',true);
                }else{
                    $(this).attr('checked',false);
                }
            });
        }*/
        /*不可更改*/
       $(function(){
            $("input[type='checkbox']").click(function(){
                this.checked = !this.checked;
            });
        });

        window.onload=function check() {
            var box = document.getElementsByName("power");
            for(var i=0;i<box.length;i++){
                if(box[i].value==1){
                    box[i].checked=true;
                }else{
                    box[i].checked=false;
                }
            }
        }

        function setPurview(id) {
            var winSet = window.open('setPurview.jsp?id='+id,' _blank','width=750,height=565,top=80,left=80,toolbar=no, menubar=no, scrollbars=no, resizable=no')
            /*监听事件*/
            var loop = setInterval(function() {
                if(winSet.closed) {
                    clearInterval(loop);
                    //alert('closed');
                    //parent.location.reload();
                    window.location.href = "/manage";
                }
            }, 1);
        }
    </script>
</head>
<body>
<form action="#">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">管理员权限设置</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
                    <button type="submit" class="button border-red"><span class="icon-trash-o"></span> 批量删除</button>
                    <button type="button" class="button border-blue" id="addManager"><span class="icon-edit"></span> 添加管理员</button>
                </li>
            </ul>
        </div>
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
                <th>权限设置</th>
                <th>删除</th>
            </tr>
            <c:forEach items="${purviews}" var="view">
                <tr>
                    <td><input type="checkbox" name="id[]" value="1" />${view.manager.name}</td>
                    <td><input type="checkbox" name="power" value="${view.sysset}" onclick="return false"></td>
                    <td><input type="checkbox" name="power" value="${view.readerset}" onclick="return false"></td>
                    <td><input type="checkbox" name="power" value="${view.bookset}" onclick="return false"></td>
                    <td><input type="checkbox" name="power" value="${view.borrowback}" onclick="return false"></td>
                    <td><input type="checkbox" name="power" value="${view.sysquery}" onclick="return false"></td>
                    <td><a href="javascript:setPurview(${view.id})">权限设置</a></td>
                    <td><div class="button-group">
                        <a class="button border-red" href="javascript:void(0)" onclick="return del(${view.id})">
                            <span class="icon-trash-o"></span> 删除
                        </a></div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</form>
<script type="text/javascript">

    function del(id){
        if(confirm("您确定要删除吗?")){
            window.location.href="/delete/"+id;
        }
    }

    /*添加*/
    $("#addManager").click(function(){
        var winObj = window.open('addManager.jsp',' _blank','width=750,height=565,top=80,left=80,toolbar=no, menubar=no, scrollbars=no, resizable=no')
        /*监听事件*/
        var loop = setInterval(function() {
            if(winObj.closed) {
                clearInterval(loop);
                //alert('closed');
                //parent.location.reload();
                window.location.href = "/manage";
            }
        }, 1);
    })

    //定义callback方法，用于回调
    function callback() {
//        parent.location.reload();
//        refreshWin();
        alert("123");
    }
    //刷新当前页面
    function refreshWin() {
    //调用刷新页面的方法，此处manage为刷新页面对应的方法
    //也就是说，如果页面有个刷新按钮，
    //则点击按钮提交的类名就是此处的类名
        var url = '/manage';
        window.location.href = url;
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
