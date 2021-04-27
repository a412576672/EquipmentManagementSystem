<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10957
  Date: 2021/3/8
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>工业控制设备管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/greenroom/维也纳.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/xadmin.css">

    <script src="${pageContext.request.contextPath}/greenroom/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/greenroom/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript " src="${pageContext.request.contextPath}/greenroom/js/xadmin.js"></script>

</head>
<body>
<!-- 顶部开始 -->
<div class="container ">
    <div class="logo"><a href="${pageContext.request.contextPath}/page/index">工业控制设备管理系统</a></div>
    <div class="left_open">
        <i title="展开/左侧栏" class="iconfont">&#xe699;</i>
    </div>

    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${adminInfo.username}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="${pageContext.request.contextPath}/login.jsp">切换帐号</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="${pageContext.request.contextPath}/page/index">后台首页</a></li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6eb;</i>
                    <cite>企业概况</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li><a _href="${pageContext.request.contextPath}/page/welcome.handler"><i class="iconfont">&#xe6a7;</i><cite>企业概况</cite></a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont layui-icon" style="font-size: 15px;">&#xe68e;</i>
                    <cite>车间管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li><a _href="${pageContext.request.contextPath}/page/workshop.handler"><i class="iconfont">&#xe6a7;</i><cite>车间信息</cite></a></li>
                </ul>
            </li>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe69e;</i>
                    <cite>设备管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/page/classify.handler">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>设备分类</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/page/equipment.handler">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>设备台账</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/page/scrap.handler">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>报废设备</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6ae;</i>
                    <cite>故障维修管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">

                    <li>
                        <a _href="${pageContext.request.contextPath}/page/fault.handler">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>故障管理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/page/maintain.handler">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>维修管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>维修员管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/page/repairman.handler">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>维修员列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>管理员管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/page/admin.handler">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite>
                        </a>
                    </li>
                </ul>
            </li>


        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='${pageContext.request.contextPath}/page/welcome.handler' name="iframename" frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<script>

    function x(){
        <c:if test="${adminInfo==null}">
        window.location.href="${pageContext.request.contextPath}/login.jsp";
        </c:if>
    }
    x();
</script>
</body>
</html>
