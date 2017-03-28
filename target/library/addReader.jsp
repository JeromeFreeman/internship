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
<div class="panel admin-panel" >
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加读者档案信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="/addReader">
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="name" data-validate="required:请输入姓名" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>性别：</label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="sex" value="男" id="optionsRadios1" checked>男
                    </label>
                    <label>
                        <input type="radio" name="sex" value="女" id="optionsRadios2" >女
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>条形码：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="barcode" data-validate="required:请输入条形码" />
                    <div class="tips"></div>
                </div>
            </div>
            <if condition="$iscid eq 1">
                <div class="form-group">
                    <div class="label">
                        <label>读者类型：</label>
                    </div>
                    <div class="field">
                        <select name="typeid" class="input-sm">
                            <c:forEach items="${readerTypeList}" var="readerTypes">
                                <option value="${readerTypes.id}">${readerTypes.name}</option>
                            </c:forEach>
                        </select>
                        <div class="tips"></div>
                    </div>
                </div>
            </if>
            <div class="form-group">
                <div class="label">
                    <label>职业：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="vocation" data-validate="required:请输入职业" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>出生日期：</label>
                </div>
                <div class="field">
                    <script src="js/laydate/laydate.js"></script>
                    <input type="text" class="laydate-icon input w50" name="birthday" onclick="laydate({istime: true, format: 'YYYY/MM/DD'})" value=""  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>有效证件：</label>
                </div>
                <div class="field">
                    <select name="paperType" class="input-sm">
                        <c:forEach items="${readerList}" var="readerPaperType">
                            <option value="${readerPaperType.paperType}">${readerPaperType.paperType}</option>
                        </c:forEach>
                    </select>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>证件号码：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="paperNo" data-validate="number:证件号码必须为数字" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>电话：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="tel"  data-validate="number:电话必须为数字" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>Email：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="email"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>备注：</label>
                </div>
                <div class="field">
                    <textarea class="input" name="remark" style=" height:90px;"></textarea>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                    <button class="button bg-main icon-check-square-o" type="button"> 返回</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body></html>
