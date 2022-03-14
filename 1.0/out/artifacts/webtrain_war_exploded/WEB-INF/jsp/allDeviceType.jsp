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
        <a href="">设备类型信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/super/allDeviceType" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/super/allDeviceType" >
            <input class="layui-input" placeholder="请输入设备类型名" name="typename" id="typename">
            <button class="layui-btn"  lay-submit="" href=""><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <%--模态弹窗添加--%>
    <button type="button" data-toggle="modal" data-target="#addDeviceTypeModal" class="btn btn-primary mb-2">
        <i class="fas fa-box-open"></i>&nbsp;新建设备类型
    </button>

    <%--表格数据--%>
    <table class="layui-table" >
        <thead>
        <tr>
            <th>ID</th>
            <th>设备类型名称</th>
            <th>描述</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${deviceTypeList}" var="deviceType">
            <tr>
                <td class="myid">${deviceType.ID}</td>
                <td>${deviceType.typename}</td>
                <td>${deviceType.describe}</td>
                <td class="td-manage">
                    <a title="更新"
                       data-deviceTypeID="${deviceType.ID}"
                       data-deviceTypetypename="${deviceType.typename}"
                       data-deviceTypedescribe="${deviceType.describe}"
                      

                       id="updateDeviceTypeHref"  data-toggle="modal" data-target="#updateDeviceTypeModal" >
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" href="${pageContext.request.contextPath}/super/delDeviceType/${deviceType.ID}">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

</div>

<div class="modal fade" id="addDeviceTypeModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">新建设备类型</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/super/addDeviceType">
                    <div class="form-group">
                        <label>类型名称</label>
                        <input id="addDeviceTypeModalTypename"
                               class="form-control"
                               required name="typename">
                    </div>
                    <div class="form-group">
                        <label>描述</label>
                        <input id="addDeviceTypeModalDescribe" class="form-control"
                               required name="describe">
                    </div>
                    
                    <div class="form-group">
                        <input type="submit" class="btn btn-info"placeholder="提交">
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="updateDeviceTypeModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="testModalLabel">更新设备类型</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/super/updateDeviceType">
                    <div class="form-group" style="display: none">
                        <label>设备类型</label>
                        <input id="updateDeviceTypeModalDeviceTypeId"
                               class="form-control" name="ID" required>
                    </div>

                    <div class="form-group">
                        <label>设备类型名称</label>
                        <input id="updateDeviceTypeModalTypename"
                               class="form-control" name="typename" required>
                    </div>
                    <div class="form-group">
                        <label>设备类型描述</label>
                        <input id="updateDeviceTypeModalDescribe" class="form-control" name="describe" required>
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

    $('#updateDeviceTypeModal').on('show.bs.modal', function (e) {
        let deviceTypeid = e.relatedTarget.getAttribute('data-deviceTypeId')
        let typename = e.relatedTarget.getAttribute('data-deviceTypetypename')
        let describe = e.relatedTarget.getAttribute('data-deviceTypedescribe')

        //TODO 完成传参
        // $('#proedit_modal_procode')
        $('#updateDeviceTypeModalDeviceTypeId').val(deviceTypeid)
        $('#updateDeviceTypeModalTypename').val(typename)
        $('#updateDeviceTypeModalDescribe').val(describe)
    });
    <!-- 以下是为了确保layui可以用 -->
    layui.use('form', function () {
        var form = layui.form,
            $ = layui.$;
        form.render()
    });
</script>

