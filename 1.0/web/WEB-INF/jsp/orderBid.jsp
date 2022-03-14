<%--
  Created by IntelliJ IDEA.
  User: YaTo
  Date: 2021/7/15
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html>
<head>
    <title></title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=bid-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
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

<c:if test="${not empty error }">
    <script> alert('${error}')</script>
</c:if>


<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">可投标订单</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/factory/myBid" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/factory/myBid" >
            <input class="layui-input" placeholder="请输入订单ID" name="ID" id="ID">
            <button class="layui-btn"  lay-submit="" href=""><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <a class="alert-link" href="${pageContext.request.contextPath}/factory/allBid">投标列表</a>

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
            <th>发布人</th>
            <th>操作</th>
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
                <td>${order.userinfo.username}</td>
                <td>
                    <a class="layui-table-link" data-toggle="modal" data-target="#addBidModal"
                    data-orderid = "${order.ID}"> 投标 </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="modal fade" id="addBidModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">投标</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/factory/addBid">
                    <div class="form-group" style="display: none">
                        <label>订单id</label>
                        <input id="addBidModalOrderId"
                               class="form-control"
                            name="orderid">
                    </div>

                    <div class="form-group">
                        <label>投标价格</label>
                        <input id="addBidModalBidPrice"
                               class="form-control"
                               required name="bidprice">
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-info" placeholder="提交">
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<script>
    $('#addBidModal').on('show.bs.modal', function (e) {
        let orderid = e.relatedTarget.getAttribute('data-OrderId')

        //TODO 完成传参
        // $('#proedit_modal_procode')
        $('#addBidModalOrderId').val(orderid)
    });
    <!-- 以下是为了确保layui可以用 -->
    layui.use('form', function () {
        var form = layui.form,
            $ = layui.$;
        form.render()
    });
</script>

