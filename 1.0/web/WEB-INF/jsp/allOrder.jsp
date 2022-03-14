<%--
  Created by IntelliJ IDEA.
  User: YaTo
  Date: 2021/7/15
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title></title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script src="${pageContext.request.contextPath}/layui_exts/excel.js"></script>

    <style type="text/css">
        .layui-table{
            text-align: center;
        }
        .layui-table th{
            text-align: center;
        }
    </style>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">订单信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/super/allOrder" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/super/allOrder" >
            <input class="layui-input" placeholder="请输入订单ID" name="ID" id="ID">
            <button class="layui-btn"  lay-submit="" href=""><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <%--表格数据--%>
    <table class="layui-table" >
        <thead>
        <tr>
            <th>ID</th>
            <th>订单编号</th>
            <th>产品</th>
            <th>订购数量</th>
            <th>投标截止日期</th>
            <th>交付截止日期</th>
            <th>订单状态</th>
            <th>工厂</th>
            <th>发布人</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderList}" var="order">
            <tr>
                <td class="myid">${order.ID}</td>
                <td>${order.orderno}</td>
                <td>${order.product.productname}</td>
                <td>${order.ordernum}</td>
                <td>${order.deaddate}</td>
                <td>${order.deliverdate}</td>
                <td>
                    <c:choose>
                        <c:when test="${order.orderstatus == 1}">已保存</c:when>
                        <c:when test="${order.orderstatus == 2}">已发布</c:when>
                        <c:when test="${order.orderstatus == 3}">已选标</c:when>
                        <c:when test="${order.orderstatus == 4}">已排产</c:when>
                        <c:when test="${order.orderstatus == 5}">已完工</c:when>
                        <c:when test="${order.orderstatus == 6}">已发货</c:when>
                        <c:when test="${order.orderstatus == 7}">已收货</c:when>
                        <c:when test="${order.orderstatus == 8}">已完成</c:when>
                    </c:choose>
                </td>
                <td>${order.factory.factoryname}</td>
                <td>${order.userinfo.username}</td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

</div>

</body>
</html>

<script>
    <!-- 以下是为了确保layui可以用 -->
    layui.use('form', function () {
        var form = layui.form,
            $ = layui.$;
        form.render()
    });
</script>

