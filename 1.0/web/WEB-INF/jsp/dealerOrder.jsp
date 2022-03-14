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
    <meta name="viewport" content="width=order-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
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
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">我的订单</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/dealer/dealerOrder" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/dealer/dealerOrder" >
            <input class="layui-input" placeholder="请输入订单ID" name="ID" id="ID">
            <button class="layui-btn"  lay-submit="" href=""><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <%--模态弹窗添加--%>
    <button type="button" data-toggle="modal" data-target="#addOrderModal" class="btn btn-primary mb-2">
        <i class="fas fa-box-open"></i>&nbsp;新建订单
    </button>

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
                <td>${order.factory.factoryname}</td>
                <td class="td-manage">

                    <c:choose>
                        <c:when test="${order.orderstatus == 1}">

                        <a title="更新"
                       data-orderID="${order.ID}"
                       data-orderordernum="${order.ordernum}"
                       data-orderdeaddate="${order.deaddate}"
                       data-orderdeliverdate="${order.deliverdate}"
                       id="updateOrderHref"  data-toggle="modal" data-target="#updateOrderModal" >
                        <i class="layui-icon">&#xe642;</i>
                        </a>
                        <a title="删除" href="${pageContext.request.contextPath}/dealer/delOrder/${order.ID}">
                        <i class="layui-icon">&#xe640;</i>
                         </a>
                            <a class="layui-table-link" href="${pageContext.request.contextPath}/dealer/updateOrderStatus/${order.ID}">
                                发布
                            </a>
                        </c:when>
                        <c:when test="${order.orderstatus == 2}">
                            <a class="layui-table-link" href="${pageContext.request.contextPath}/dealer/toChooseBid/${order.ID}">
                                投标详情
                            </a>
                        </c:when>
                        <c:when test="${order.orderstatus == 6}">
                            <a class="layui-table-link" href="${pageContext.request.contextPath}/dealer/updateOrderStatus/${order.ID}">
                                收货
                            </a>
                        </c:when>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>

        </tbody>

    </table>

</div>

<div class="modal fade" id="addOrderModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">新建订单</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/dealer/createOrder">
                    <div class="form-group">
                        <label>产品</label>
                        <select id="addOrderModalType"
                                class="form-control"  name="productid">
                            <c:forEach items="${productList}" var="product">--%>
                                <option value="${product.ID}">${product.productname}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>订购数目</label>
                        <input id="addOrderModalOrdername"
                               class="form-control"
                               required name="ordernum">
                    </div>

                    <div class="form-group">
                        <label>投标截止日期</label>
                        <input id="addOrderModalDeaddate"
                               class="form-control"
                               type="date"
                               required name="deaddate">
                    </div>
                    <div class="form-group">
                        <label>交付截止日期</label>
                        <input id="addOrderModalDeliverdate"
                               class="form-control"
                               type="date"
                               required name="deliverdate">
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-info" placeholder="提交">
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="updateOrderModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="testModalLabel">更新订单</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/dealer/updateOrder">
                    <div class="form-group" style="display: none">
                        <label>订单id</label>
                        <input id="updateOrderModalOrderId"
                            class="form-control"
                            required name="ID"
                        >
                    </div>

                    <div class="form-group">
                        <label>订购数目</label>
                        <input id="updateOrderModalOrdernum"
                               class="form-control"
                               required name="ordernum">
                    </div>

                    <div class="form-group">
                        <label>投标截止日期</label>
                        <input id="updateOrderModalDeaddate"
                               class="form-control"
                               type="date"
                               required name="deaddate">
                    </div>
                    <div class="form-group">
                        <label>交付截止日期</label>
                        <input id="updateOrderModalDeliverdate"
                               class="form-control"
                               type="date"
                               required name="deliverdate">
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-info" placeholder="提交">
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<script>

    $('#updateOrderModal').on('show.bs.modal', function (e) {
        let orderID = e.relatedTarget.getAttribute('data-orderId')
        let orderdeaddate = e.relatedTarget.getAttribute('data-orderdeaddate')
        let orderdeliverdate = e.relatedTarget.getAttribute('data-orderdeliverdate')
        let ordernum = e.relatedTarget.getAttribute('data-orderordernum')
        //TODO 完成传参
        // $('#proedit_modal_procode')
        $('#updateOrderModalOrderId').val(orderID)
        $('#updateOrderModalDeaddate').val(orderdeaddate)
        $('#updateOrderModalDeliverdate').val(orderdeliverdate)
        $('#updateOrderModalOrdernum').val(ordernum)

    });
    <!-- 以下是为了确保layui可以用 -->
    layui.use('form', function () {
        var form = layui.form,
            $ = layui.$;
        form.render()
    });

</script>

</body>
</html>



