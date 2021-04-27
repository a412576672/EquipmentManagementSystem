
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10957
  Date: 2021/3/8
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/greenroom/维也纳.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/xadmin.css">
    <link href="/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/greenroom/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/greenroom/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript " src="${pageContext.request.contextPath}/greenroom/js/xadmin.js"></script>
    <script>
       function x(){
           console.log(${adminInfo})
           <c:if test=" ${adminInfo==null}">
           window.location.href="${pageContext.request.contextPath}/login.jsp";
           </c:if>
       }
    </script>
</head>
<body>
<div class="x-body layui-anim layui-anim-up">
    <blockquote class="layui-elem-quote">欢迎管理员：
        <span class="x-red">${adminInfo.username}</span>！当前时间:<div style="display: inline-block" id="dd">2021-02-8 20:50:53</div>></blockquote>
    <fieldset class="layui-elem-field">
        <legend>数据统计</legend>
        <div class="layui-field-box">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 90px;">
                            <div carousel-item="">
                                <ul class="layui-row layui-col-space10 layui-this">
                                    <li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>车间数量</h3>
                                            <p>
                                                <cite>${workshopCount}</cite></p>
                                        </a>
                                    </li>
                                    <li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>设备数量</h3>
                                            <p><cite>${equipmentCount}</cite></p>
                                        </a>
                                    </li>
                                    <li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>维修员工数</h3>
                                            <p>
                                                <cite>${repairmanCount}</cite></p>
                                        </a>
                                    </li>
                                    <li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>维修中设备数</h3>
                                            <p>
                                                <cite>${maintainCount}</cite></p>
                                        </a>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>

<%--    <fieldset class="layui-elem-field">--%>
<%--        <legend>酒店信息</legend>--%>
<%--        <div class="layui-field-box">--%>
<%--            <table class="layui-table">--%>
<%--                <tbody>--%>
<%--                <tr>--%>
<%--                    <th>酒店名称</th>--%>
<%--                    <td>维也纳酒店</td></tr>--%>
<%--                <tr>--%>
<%--                    <th>酒店地址</th>--%>
<%--                    <td>广东省深圳市</td></tr>--%>
<%--                <tr>--%>
<%--                    <th>地理环境</th>--%>
<%--                    <td>距离火车站300米</td></tr>--%>
<%--                <tr>--%>
<%--                    <th>周边景点</th>--%>
<%--                    <td>我也不知道有啥景点</td></tr>--%>
<%--                <tr>--%>
<%--                    <th>酒店设施</th>--%>
<%--                    <td>酒店设有各类客房间</td></tr>--%>
<%--                <tr>--%>
<%--                    <th>核心使命</th>--%>
<%--                    <td>致力于为顾客提供足够好的产品。</td></tr>--%>
<%--                <tr>--%>
<%--                    <th>品牌定位</th>--%>
<%--                    <td>中国精品连锁酒店领袖品牌。</td></tr>--%>
<%--                <tr>--%>
<%--                    <th>核心价值观</th>--%>
<%--                    <td>谦和、务实、高效、创新</td></tr>--%>
<%--                <tr>--%>
<%--                    <th>企业愿景</th>--%>
<%--                    <td>创世界品牌，立百年伟业</td></tr>--%>

<%--                </tbody>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--    </fieldset>--%>

</div>
<script>
    function Show()
    {
        document.getElementById("dd").innerHTML = new Date().toLocaleString();
        window.setTimeout( Show, 1000 );
    }
    Show();
</script>
</body>
</html>
