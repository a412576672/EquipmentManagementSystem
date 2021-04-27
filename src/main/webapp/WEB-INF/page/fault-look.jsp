<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10957
  Date: 2021/3/8
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/greenroom/维也纳.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/greenroom/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/greenroom/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript " src="${pageContext.request.contextPath}/greenroom/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        #demo1{
            width: 190px;
            height: 120px;
        }
        .layui-form-item .layui-btn{
            position: relative;
            left: 180px;
        }
    </style>
</head>

<body>
<div class="x-body">
    <form class="layui-form" method="post" action="">
        <div class="layui-form-item">
            <label for="ename" class="layui-form-label">
                <span class="x-red">*</span>故障设备名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="ename" name="ename" required readonly
                       value="${faultModel.equipment.ename}"      autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="cause" class="layui-form-label">
                <span class="x-red">*</span>故障原因
            </label>
            <div style="width: 300px;" class="layui-input-inline">
                <textarea  style="width: 300px;"  id="cause" name="cause" required
                           autocomplete="off" class="layui-textarea" >${faultModel.cause} </textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <a href="#" style="text-align: center" id="backtrack" class="layui-btn">返回</a>
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
    });
</script>
</body>
</html>
