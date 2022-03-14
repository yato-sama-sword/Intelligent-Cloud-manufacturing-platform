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
    <meta name="viewport" content="width=capacity-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
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
        <a href="${pageContext.request.contextPath}/factory/myDevice">我的设备</a>
        <a href="">产能配置</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/factory/toAddCapacity/${device.ID}" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so"  >
            <input class="layui-input" placeholder="请输入设备名" name="capacityname" id="capacityname">
            <button class="layui-btn"  lay-submit="" href=""><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <%--模态弹窗添加--%>
    <button type="button" data-toggle="modal" data-target="#addCapacityModal" class="btn btn-primary mb-2">
        <i class="fas fa-box-open"></i>&nbsp;配置产能
    </button>


    <%--表格数据--%>
    <table class="layui-table" >
        <thead>
        <tr>
            <th>ID</th>
            <th>设备名称</th>
            <th>产品名称</th>
            <th>速率</th>
            <th>操作</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${capacityList}" var="capacity">
            <tr>
                <td class="myid">${capacity.ID}</td>
                <td>${device.devicename}</td>
                <td>${capacity.product.productname}</td>
                <td>${capacity.velocity}</td>
                <td class="td-manage">
                    <a  data-toggle="modal" data-target="#updateCapacityModal"
                        data-capacityID="${capacity.ID}"
                        data-capacityVelocity="${capacity.velocity}">
                       更新产能
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="modal fade" id="addCapacityModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">配置产能</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/factory/addCapacity">
                    <div class="form-group" style="display: none">
                        <label>设备</label>
                        <input id="addCapacityModalDevice"
                               class="form-control"
                               required name="deviceid"
                            value="${device.ID}">
                    </div>

                    <div class="form-group">
                        <label>产品类型</label>
                        <select id="addCapacityModalProduct"
                                class="form-control"  name="productid">
                            <c:forEach items="${productList}" var="product">--%>
                                <option value="${product.ID}">${product.productname}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>产品产能：件/时</label>
                        <input id="addCapacityModalVelocity"
                               class="form-control"
                               required name="velocity">
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-info" placeholder="提交">
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="updateCapacityModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="testModalLabel">更新设备</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/factory/updateCapacity">
                    <div class="form-group" style="display: none">
                        <label>产能</label>
                        <input id="updateCapacityModalCapacityId"
                               class="form-control" name="capacityid" required>
                    </div>

                    <div class="form-group">
                        <label>产品产能：件/时</label>
                        <input id="updateCapacityModalVelocity"
                               class="form-control" name="velocity" required>
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

    $('#updateCapacityModal').on('show.bs.modal', function (e) {
        let capacityID = e.relatedTarget.getAttribute('data-capacityID')
        let velocity = e.relatedTarget.getAttribute('data-capacityVelocity')

        //TODO 完成传参
        // $('#proedit_modal_procode')
        $('#updateCapacityModalCapacityId').val(capacityID)
        $('#updateCapacityModalVelocity').val(velocity)
    });

    <!-- 以下是为了确保layui可以用 -->
    layui.use('form', function () {
        var form = layui.form,
            $ = layui.$;
        form.render()
    });
</script>