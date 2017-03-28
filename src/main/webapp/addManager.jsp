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
        function formSubmit(){
            this.addForm.submit();
            //提交action到AddSocket类
            window.opener.callback();
            setTimeout("window.close()", 3000);
            //上述执行完成后，调用打开页面的callback方法，
            //此处是调用主页面的callback方法
            window.close();//当前页面关闭
        }
    </script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span>  添加管理员信息</strong></div>
    <div class="body-content">
        <%--target="_blank" onsubmit="window.opener=null;window.close();"--%>
        <form method="post" id="addForm" name="addForm" class="form-x" action="/addManager">
            <div class="form-group">
                <div class="label">
                    <label for="name">：管理员账号</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" id="name" name="name" size="50" placeholder="请输入管理员账号" data-validate="required:请输入管理员账号" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="password">新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="password" name="PWD" size="50" placeholder="请设置密码" data-validate="required:请设置密码,length#>=3:密码不能小于3位" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="renewpass">确认新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="renewpass" name="rePWD" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#PWD:两次输入的密码不一致" />
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                    <%--<input id="onSub" class="button bg-main icon-check-square-o" type="button" onclick="formSubmit();" value="提交2">--%>
                </div>
            </div>
        </form>
    </div>
</div>
</body></html>
