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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加图书档案信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="/setBook">
        <c:forEach items="${books}" var="book">
            <c:if test="${book.id==param.id}">
            <input type="hidden" name="id" value="${book.id}">
            <div class="form-group">
                <div class="label">
                    <label>条形码：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="barcode" value="${book.barcode}" data-validate="required:请输入条形码" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>图书名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="bookname" value="${book.bookname}" data-validate="required:请输入图书名称" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>图书类型：</label>
                </div>
                <div class="field">
                    <select name="typeid" id="typeid" class="input-sm">
                        <c:forEach items="${bookTypes}" var="bookType">
                            <option value="${bookType.id}">${bookType.typename}</option>
                        </c:forEach>
                    </select>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>作者：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="author" value="${book.author}" data-validate="required:请输入作者" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>译者：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="translator" value="${book.translator}" data-validate="required:请输入译者" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>出版社：</label>
                </div>
                <div class="field">
                    <select name="ISBN" id="ISBN" class="input-sm">
                        <c:forEach items="${publishings}" var="publish">
                            <option value="${publish.ISBN}">${publish.pubname}</option>
                        </c:forEach>
                    </select>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>价格：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="price" value="${book.price}" data-validate="number:价格必须为数字" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>页码：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="page" value="${book.page}" data-validate="number:页码必须为数字" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>书架：</label>
                </div>
                <div class="field">
                    <select name="bookcaseId" id="bookcaseId" class="input-sm">
                        <c:forEach items="${bookcases}" var="bookcase">
                            <option value="${bookcase.id}">${bookcase.name}</option>
                        </c:forEach>
                    </select>
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
            <script type="text/javascript">
                window.onload=function choose() {
                    $("#bookcaseId").val("${book.bookcaseId}");
                    $("#typeid").val("${book.typeid}");
                    $("#ISBN").val("${book.ISBN}");
                }
            </script>
            </c:if>
        </c:forEach>
        </form>
    </div>
</div>

</body></html>

