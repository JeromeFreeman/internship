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
    <title>后台管理中心</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery-3.1.1.min.js"></script>
</head>
<body  style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
    </div>
    <div class="head-l"><a class="button button-little bg-green" href="library.jsp" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="login.jsp"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <c:if test="${manager.purview.sysset==1}">
        <h2><span class="icon-pencil-square-o"></span>系统设置</h2>
        <ul style="display:block">
            <li><a href="/manage" target="right"><span class="icon-caret-right"></span>管理员设置</a></li>
            <li><a href="/cases" target="right"><span class="icon-caret-right"></span>书架管理</a></li>
        </ul>
    </c:if>
    <c:if test="${manager.purview.readerset==1}">
        <h2><span class="icon-pencil-square-o"></span>读者管理</h2>
        <ul>
            <li><a href="/readerType" target="right"><span class="icon-caret-right"></span>读者类型管理</a></li>
            <li><a href="/readers" target="right"><span class="icon-caret-right"></span>读者档案管理</a></li>
        </ul>
    </c:if>
    <c:if test="${manager.purview.bookset==1}">
        <h2><span class="icon-pencil-square-o"></span>图书管理</h2>
        <ul>
            <li><a href="/bookType" target="right"><span class="icon-caret-right"></span>图书类型管理</a></li>
            <li><a href="/book" target="right"><span class="icon-caret-right"></span>图书档案管理</a></li>
        </ul>
    </c:if>
    <c:if test="${manager.purview.borrowback==1}">
        <h2><span class="icon-pencil-square-o"></span>图书借还</h2>
        <ul>
            <li><a href="/borrow.jsp" target="right"><span class="icon-caret-right"></span>图书借阅</a></li>
            <li><a href="/renew.jsp" target="right"><span class="icon-caret-right"></span>图书续借</a></li>
            <li><a href="/reback.jsp" target="right"><span class="icon-caret-right"></span>图书归还</a></li>
        </ul>
    </c:if>
    <c:if test="${manager.purview.sysquery==1}">
        <h2><span class="icon-pencil-square-o"></span>系统查询</h2>
        <ul>
            <li><a href="/queryBook.jsp" target="right"><span class="icon-caret-right"></span>图书档案查询</a></li>
            <li><a href="/queryBorrow.jsp" target="right"><span class="icon-caret-right"></span>图书借阅查询</a></li>
            <li><a href="/queryOut" target="right"><span class="icon-caret-right"></span>借阅到期提醒</a></li>
        </ul>
    </c:if>
    <h2><span class="icon-pencil-square-o"></span>更改口令</h2>
    <ul>
    </ul>
</div>
<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a href="#" target="right" class="icon-home"> 首页</a></li>
    <li><a href="#" id="a_leader_txt">网站信息</a></li>
    <li><b>当前语言：</b><span style="color:red;">中文</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li>
</ul>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="rank.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
    <p>来源:<a href="http://down.admin5.com/" target="_blank">A5源码</a></p>
</div>
</body>
</html>
