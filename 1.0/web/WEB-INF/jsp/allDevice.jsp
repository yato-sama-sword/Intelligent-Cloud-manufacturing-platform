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
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
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
        <a href="">设备信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/super/allDevice" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/super/allDevice" >
            <input class="layui-input" placeholder="请输入设备名" name="devicename" id="devicename">
            <button class="layui-btn"  lay-submit="" href=""><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <%--模态弹窗添加--%>
    <button type="button" data-toggle="modal" data-target="#addDeviceModal" class="btn btn-primary mb-2">
        <i class="fas fa-box-open"></i>&nbsp;新建设备
    </button>

    <%--表格数据--%>
    <table class="layui-table" >
        <thead>
        <tr>
            <th>ID</th>
            <th>设备类型名称</th>
            <th>设备名称</th>
            <th>规格</th>
            <th>描述</th>
            <th>设备编号</th>
            <th>设备状态</th>
            <th>租用状态</th>
            <th>所属工厂</th>
            <th>操作</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${deviceList}" var="device">
            <tr>
                <td class="myid">${device.ID}</td>
                <td>${device.deviceType.typename}</td>
                <td>${device.devicename}</td>
                <td>${device.norms}</td>
                <td>${device.describe}</td>
                <td>${device.deviceno}</td>
                <td>
                    <c:choose>
                        <c:when test="${device.devicestatus == 0}">关机中</c:when>
                        <c:when test="${device.devicestatus == 1}">生产中</c:when>
                        <c:when test="${device.devicestatus == 2}">闲置中</c:when>
                        <c:when test="${device.devicestatus == 3}">故障中</c:when>
                    </c:choose>
                </td>
                <!--不是自用设备的设备全是产能中心的哦-->
                <td>
                    <c:choose>
                        <c:when test="${device.rentstatus == 0}">自用设备</c:when>
                        <c:when test="${device.rentstatus == 1}">租用中</c:when>
                        <c:when test="${device.rentstatus == 2}">未租用</c:when>
                    </c:choose>
                </td>
                <td>${device.factory.factoryname}</td>
                <td class="td-manage">
                    <c:if test="${device.devicestatus == 3}">
                        <a class="layui-table-link" href="${pageContext.request.contextPath}/super/repairDevice/${device.ID}">
                            修缮设备
                        </a>
                    </c:if>

                    <a title="更新"
                       data-deviceID="${device.ID}"
                       data-devicedevicename="${device.devicename}"
                       data-devicenorms="${device.norms}"
                       data-devicedescribe="${device.describe}"
                       id="updateDeviceHref"  data-toggle="modal" data-target="#updateDeviceModal" >
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" href="${pageContext.request.contextPath}/super/delDevice/${device.ID}">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="modal fade" id="addDeviceModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">新建设备</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/super/addDevice">
                    <div class="form-group">
                        <label>设备类型</label>
                        <select id="addDeviceModalType"
                                class="form-control" onchange="deviceTypeSelectOnchange()" name="typeid">
                            <c:forEach items="${deviceTypeList}" var="deviceType">--%>
                                <option value="${deviceType.ID}">${deviceType.typename}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>设备名称</label>
                        <input id="addDeviceModalDevicename"
                               class="form-control"
                               required name="devicename">
                    </div>

                    <div class="form-group">
                        <label>规格</label>
                        <input id="addDeviceModalNorms"
                               class="form-control"
                               required name="norms">
                    </div>

                    <div class="form-group">
                        <label>描述</label>
                        <input id="addDeviceModalDescribe" class="form-control"
                               required name="describe">
                    </div>

                    <div class="form-group">
                        <label>所属工厂</label>
                        <select id="addDeviceModalFactroy"
                                class="form-control" onchange="factorySelectOnchange()" name="factoryid">
                            <option value= "0" selected>无所属工厂</option>
                            <c:forEach items="${factoryList}" var="factory">--%>
                                <option value="${factory.ID}">${factory.factoryname}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-info" placeholder="提交">
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="updateDeviceModal" tabindex="-1" role="dialog"
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
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/super/updateDevice">
                    <div class="form-group" style="display: none">
                        <label>设备</label>
                        <input id="updateDeviceModalDeviceId"
                               class="form-control" name="ID" required>
                    </div>

                    <div class="form-group">
                        <label>设备名称</label>
                        <input id="updateDeviceModalDevicename"
                               class="form-control" name="devicename" required>
                    </div>

                    <div class="form-group">
                        <label>设备规格</label>
                        <input id="updateDeviceModalNorms"
                               class="form-control" name="norms" required>
                    </div>

                    <div class="form-group">
                        <label>设备描述</label>
                        <input id="updateDeviceModalDescribe" class="form-control" name="describe" required>
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

    $('#updateDeviceModal').on('show.bs.modal', function (e) {
        let deviceID = e.relatedTarget.getAttribute('data-deviceID')
        let devicename= e.relatedTarget.getAttribute('data-devicedevicename')
        let devicenorms= e.relatedTarget.getAttribute('data-devicenorms')
        let devicedescribe = e.relatedTarget.getAttribute('data-devicedescribe')

        //TODO 完成传参
        // $('#proedit_modal_procode')
        $('#updateDeviceModalDeviceId').val(deviceID)
        $('#updateDeviceModalDevicename').val(devicename)
        $('#updateDeviceModalNorms').val(devicenorms)
        $('#updateDeviceModalDescribe').val(devicedescribe)
    });
    <!-- 以下是为了确保layui可以用 -->
    layui.use('form', function () {
        var form = layui.form,
            $ = layui.$;
        form.render()
    });
</script>