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
        <a href="">用户信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/super/allUserinfo" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/super/allUserinfo" >
            <input class="layui-input" placeholder="请输入用户名" name="username" id="username">
            <button class="layui-btn"  lay-submit="" href=""><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>


<%--模态弹窗添加--%>
<button type="button" data-toggle="modal" data-target="#addUserinfoModal" class="btn btn-primary mb-2">
    <i class="fas fa-box-open"></i>&nbsp;新建用户
</button>



<%--表格数据--%>
    <table class="layui-table" >
        <thead>
        <tr>
            <th>ID</th>
            <th>账号</th>
            <th>密码</th>
            <th>真实姓名</th>
            <th>联系方式</th>
            <th>用户类型</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${userinfoList}" var="userinfo">
            <tr>
                <td class="mid">${userinfo.ID}</td>
                <td>${userinfo.account}</td>
                <td>${userinfo.password}</td>
                <td>${userinfo.username}</td>
                <td>${userinfo.mobile}</td>
                <td>${userinfo.role.rolename}</td>
                <td class="td-manage">
                    <a title="更新"
                       data-userinfoID="${userinfo.ID}"
                       data-userinfoaccount="${userinfo.account}"
                       data-userinfopassword="${userinfo.password}"
                       data-userinfousername="${userinfo.username}"
                       data-userinfomobile="${userinfo.mobile}"

                       id="updateUserinfoHref"  data-toggle="modal" data-target="#updateUserinfoModal" >
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" href="${pageContext.request.contextPath}/super/delUserinfo/${userinfo.ID}">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<div class="modal fade" id="addUserinfoModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">新建用户</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/super/addUserinfo">
                    <div class="form-group">
                        <label>账号</label>
                        <input id="addUserinfoModalAccount"
                               class="form-control"
                        required name="account">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input id="addUserinfoModalPassword" class="form-control"
                        required name="password">
                    </div>
                    <div class="form-group">
                        <label>真实姓名</label>
                        <input id="addUserinfoModalUsername"
                               class="form-control"
                               name="username"
                               required>
                    </div>
                    <div class="form-group">
                        <label>联系方式</label>
                        <input id="addUserinfoModalMobile"
                               class="form-control"
                        required name="mobile">
                    </div>
                    <div class="form-group">
                        <label>用户类型</label>
                        <select id="addUserinfoModalRole"
                                class="form-control" onchange="userinfoSelectOnchange()" name="roleid">
                            <c:forEach items="${roleList}" var="role">--%>
                                <option value="${role.ID}">${role.rolename}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group" style="display: none" id="addUserinfo1">
                        <label >工厂名</label>
                        <input id="addUserinfoModalFactoryname"
                               class="form-control"
                               name="factoryname"
                        >
                    </div>
                    <div class="form-group" style="display: none" id="addUserinfo2">
                        <label>工厂介绍</label>
                        <input id="addUserinfoModalIntorduction"
                               class="form-control"
                               name="introduction"
                        >
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-info"placeholder="提交">
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="updateUserinfoModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="testModalLabel">更新用户</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">
                <form accept-charset="utf-8" action="${pageContext.request.contextPath}/super/updateUserinfo">
                    <div class="form-group" style="display: none">
                        <label>用户id</label>
                        <input id="updateUserinfoModalUserinfoId"
                               class="form-control" name="ID" required>
                    </div>

                    <div class="form-group">
                        <label>账号</label>
                        <input id="updateUserinfoModalAccount"
                               class="form-control" name="account" required>
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input id="updateUserinfoModalPassword" class="form-control" name="password" required>
                    </div>
                    <div class="form-group">
                        <label>真实姓名</label>
                        <input id="updateUserinfoModalUsername"
                               class="form-control"
                               required name="username">
                    </div>
                    <div class="form-group">
                        <label>联系方式</label>
                        <input id="updateUserinfoModalMobile"
                               class="form-control"
                                name="mobile"
                                required>
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
    $('#updateUserinfoModal').on('show.bs.modal', function (e) {
        let userinfoid = e.relatedTarget.getAttribute('data-userinfoId')
        let account = e.relatedTarget.getAttribute('data-userinfoaccount')
        let password = e.relatedTarget.getAttribute('data-userinfopassword')
        let username = e.relatedTarget.getAttribute('data-userinfousername')
        let mobile = e.relatedTarget.getAttribute('data-userinfomobile')

        //TODO 完成传参
        // $('#proedit_modal_procode')
        $('#updateUserinfoModalUserinfoId').val(userinfoid)
        $('#updateUserinfoModalAccount').val(account)
        $('#updateUserinfoModalPassword').val(password)
        $('#updateUserinfoModalUsername').val(username)
        $('#updateUserinfoModalMobile').val(mobile)
    });

    <!-- 以下是为了确保layui可以用 -->
    layui.use('form', function () {
        var form = layui.form,
            $ = layui.$;
        /*添加弹出框*/
        $("#addUserinfoBtn").click(function () {

            layer.open({
                type: 1,
                title: ['增加工厂'],
                skin: "myclass",
                area: ["50%"],
                anim: 2,
                content: $("#addUserinfo").html(),
                success: function (layero, index) {
                    // 重新渲染弹层中的下拉选择框select
                    form.render();
                }
            })
        });

        /*添加弹出框*/
        $("#updateUserinfoBtn").click(function () {
            layer.open({
                type: 1,
                title: "更新工厂",
                skin: "myclass",
                area: ["50%"],
                anim: 2,
                content: $("#updateUserinfo").html(),
                success: function (layero, index) {
                    // 重新渲染弹层中的下拉选择框select
                    form.render();
                }
            });
        });
    });

    function userinfoSelectOnchange() {
        let role = document.getElementById("addUserinfoModalRole");
        let index = role.selectedIndex;
        if (role.options[index].value == 2) {
            let factoryname = document.getElementById("addUserinfo1");
            factoryname.style.display = 'block';
            let introduction = document.getElementById("addUserinfo2");
            introduction.style.display = 'block';
        } else {
            let factoryname = document.getElementById("addUserinfo1");
            factoryname.style.display = 'none';
            let introduction = document.getElementById("addUserinfo2");
            introduction.style.display = 'none';
        }
    }


</script>

