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
    <meta name="viewport" content="width=product-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
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
        <a href="">产品信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/super/allProduct" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/super/allProduct" >
            <input class="layui-input" placeholder="请输入产品名" name="productname" id="productname">
            <button class="layui-btn"  lay-submit="" href=""><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <%--模态弹窗添加--%>
    <button type="button" data-toggle="modal" data-target="#addProductModal" class="btn btn-primary mb-2">
        <i class="fas fa-box-open"></i>&nbsp;新建产品
    </button>

    <%--表格数据--%>
    <table class="layui-table" >
        <thead>
        <tr>
            <th>ID</th>
            <th>产品类型名称</th>
            <th>产品名称</th>
            <th>规格</th>
            <th>描述</th>
            <th>产品编号</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productList}" var="product">
            <tr>
                <td class="myid">${product.ID}</td>
                <td>${product.productType.typename}</td>
                <td>${product.productname}</td>
                <td>${product.norms}</td>
                <td>${product.describe}</td>
                <td>${product.productno}</td>
                <td class="td-manage">
                    <a title="更新"
                       data-productID="${product.ID}"
                       data-productproductname="${product.productname}"
                       data-productnorms="${product.norms}"
                       data-productdescribe="${product.describe}"
                       id="updateProductHref"  data-toggle="modal" data-target="#updateProductModal" >
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" href="${pageContext.request.contextPath}/super/delProduct/${product.ID}">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="modal fade" id="addProductModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">新建产品</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/super/addProduct">
                    <div class="form-group">
                        <label>产品类型</label>
                        <select id="addProductModalType"
                                class="form-control" onchange="productTypeSelectOnchange()" name="typeid">
                            <c:forEach items="${productTypeList}" var="productType">--%>
                                <option value="${productType.ID}">${productType.typename}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>产品名称</label>
                        <input id="addProductModalProductname"
                               class="form-control"
                               required name="productname">
                    </div>

                    <div class="form-group">
                        <label>规格</label>
                        <input id="addProductModalNorms"
                               class="form-control"
                               required name="norms">
                    </div>

                    <div class="form-group">
                        <label>描述</label>
                        <input id="addProductModalDescribe" class="form-control"
                               required name="describe">
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-info" placeholder="提交">
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="updateProductModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="testModalLabel">更新产品</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/super/updateProduct">
                    <div class="form-group" style="display: none">
                        <label>产品</label>
                        <input id="updateProductModalProductId"
                               class="form-control" name="ID" required>
                    </div>

                    <div class="form-group">
                        <label>产品名称</label>
                        <input id="updateProductModalProductname"
                               class="form-control" name="productname" required>
                    </div>

                    <div class="form-group">
                        <label>产品规格</label>
                        <input id="updateProductModalNorms"
                               class="form-control" name="norms" required>
                    </div>

                    <div class="form-group">
                        <label>产品描述</label>
                        <input id="updateProductModalDescribe" class="form-control" name="describe" required>
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

    $('#updateProductModal').on('show.bs.modal', function (e) {
        let productID = e.relatedTarget.getAttribute('data-productID')
        let productname= e.relatedTarget.getAttribute('data-productproductname')
        let productnorms= e.relatedTarget.getAttribute('data-productnorms')
        let productdescribe = e.relatedTarget.getAttribute('data-productdescribe')

        //TODO 完成传参
        // $('#proedit_modal_procode')
        $('#updateProductModalProductId').val(productID)
        $('#updateProductModalProductname').val(productname)
        $('#updateProductModalNorms').val(productnorms)
        $('#updateProductModalDescribe').val(productdescribe)
    });
    <!-- 以下是为了确保layui可以用 -->
    layui.use('form', function () {
        var form = layui.form,
            $ = layui.$;
        form.render()
    });
</script>

