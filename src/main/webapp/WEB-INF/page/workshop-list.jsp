<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10957
  Date: 2021/3/8
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>房间列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/greenroom/维也纳.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/xadmin.css">
    <link href="/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/greenroom/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/greenroom/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript " src="${pageContext.request.contextPath}/greenroom/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    table tbody tr {
        height: 49px;
    }
</style>
<body class="layui-anim layui-anim-up">

<div class="x-body">
    <xblock>
        <a href="#" lay-event="add" id="addWork" class="layui-btn"><i class="layui-icon"></i>添加车间</a>
        <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
           href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </xblock>
    <table class="layui-hide" id="test2" lay-filter="test2"></table>
</div>
<script type="text/html" id="barDemo">
    <a title="编辑" class="layui-btn layui-btn-sm layui-btn-normal" lay-event="edit">
        <img src="${pageContext.request.contextPath}/images/svg/bianji.svg" width="15px" height="24px"
             style="margin-bottom: 4px"></img> 编辑

    </a>
    <a class="deleteBtns layui-btn layui-btn-sm layui-btn-danger" lay-event="del">
        <img src="${pageContext.request.contextPath}/images/svg/shanchu.svg" width="15px" height="24px"
             style="margin-bottom: 4px"></img> 删除
    </a>

</script>
<script>
    layui.use(['table', 'layer', 'upload', 'form'], function () {
        let table = layui.table;
        let form = layui.form;
        let layer = layui.layer;
        let upload = layui.upload;

        table.render({
            elem: '#test2'
            , url: '${pageContext.request.contextPath}/workshopLimit.handler'
            , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
            , title: '车间'
            , cols: [[
                {field: 'wid', title: '编号', width: "20%"}
                , {field: 'wname', title: '车间名称', width: "30%"}
                , {field: 'loc', title: '车间地址', width: "30%"}
                , {title: '操作', toolbar: '#barDemo', width: "20%"}
            ]]
            , parseData: function (res) { //res 即为原始返回的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data //解析数据列表
                };
            }
            , skin: 'line,row'//表格风格
            , even: false
            , page: true //是否显示分页
            , limits: [5, 15, 30]
            , limit: 5 //每页默认显示的数量
        });
        table.on('tool(test2)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                layer.open({
                    type: 2,
                    skin: 'layui-layer-rim',
                    area: ['550px', '300px'],
                    content: "${pageContext.request.contextPath}/editWorkshop.handler?id=" + data.wid,
                    end: function () {
                        table.reload('test2', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        });
                    }
                });
            } else if (obj.event === 'del') {
                console.log(data)
                layer.confirm('真的删除行么', function (index) {
                    layer.close(index);
                    console.log("===" + data.wid);
                    $.ajax({
                        url: "${pageContext.request.contextPath}/deleteWorkshop.handler",
                        type: "POST",
                        data: {
                            status: data.status,
                            id: data.wid  //此处是根据id查询此id是否被删除，故将id传向后端
                        },
                        success: function (date) {
                            console.log(date)
                            if (date == true) {
                                obj.del();
                                layer.msg('删除成功啦', {icon: 1}, {time: 2000});
                            } else {
                                layer.msg('删除失败！', {icon: 2}, {time: 2000});
                            }
                        }
                    });
                });
            }
        });
        $("#addWork").click(function () {
            layer.open({
                type: 2,
                skin: 'layui-layer-rim',
                area: ['550px', '250px'],
                content: "${pageContext.request.contextPath}/page/workshopAdd.handler",
                end: function () {
                    table.reload('test2', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    });
                }
            });
        })
        <c:if test="${addAdminGood}">
        <c:remove var="addAdminGood"/>
        layer.msg('添加管理员成功', {icon: 1, anim: 5});
        </c:if>
    });
</script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });
        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });
</script>

</body>
</html>
