<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10957
  Date: 2021/3/9
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/greenroom/维也纳.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/xadmin.css">
    <link href="/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/greenroom/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/greenroom/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript " src="${pageContext.request.contextPath}/greenroom/js/xadmin.js"></script>
    <%--    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->--%>
    <%--    <!--[if lt IE 9]>--%>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <style>
        #demo1 {
            width: 190px;
            height: 120px;
        }

        .layui-form-item .layui-btn {
            position: relative;
            left: 180px;
        }
    </style>
</head>

<body>
<div class="x-body">
    <form class="layui-form" method="post" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>设备名称
            </label>
            <div class="layui-input-block">
                <select style='width:190px' name="fid" lay-verify="required">
                    <option value="">请选择要维修的设备</option>
                    <c:forEach items="${faults}" var="fault">
                        <option value="${fault.fid}">${fault.equipment.ename}</option>
                    </c:forEach>
                </select>
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>维修员</label>
            <div class="layui-input-block">
                <select style='width:190px' name="rid" lay-verify="required">
                    <option value="">请选择维修员工</option>
                    <c:forEach items="${repairmanList}" var="repairman">
                        <option value="${repairman.rid}">${repairman.rname}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <button type="submit" id="submitUp" lay-submit lay-filter="insert" class="layui-btn">
                派修
            </button>
            <a href="#" id="backtrack" class="layui-btn">返回</a>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        let form = layui.form;
        let layer = layui.layer;
        //监听提交
        let index = parent.layer.getFrameIndex(window.name);
        $("#backtrack").click(function () {
            parent.layer.close(index);
        })
        <c:if test="${faultsNull}">
        <c:remove var="faultsNull"/>
        layer.msg('当前没有待维修的故障设备',{icon: 5,anim: 6});
        </c:if>
        <c:if test="${repairmanNull}">
        <c:remove var="repairmanNull"/>
        layer.msg('当前没有可以维修的员工',{icon: 5,anim: 6});
        </c:if>
        form.on('submit(insert)', function (data) {
            let $ = layui.$;
            $.ajax({
                type: 'post',
                url: "${pageContext.request.contextPath}/insertMaintain.handler",
                data: data.field,
                success: function (data) {
                    console.log(data)
                    if (data == true) {
                        parent.layer.close(index);
                    } else if (data == false) {
                        layer.msg('添加失败。。。');
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
