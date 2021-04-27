<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/greenroom/维也纳.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/greenroom/css/xadmin.css">
    <link href="/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/greenroom/js/jquery.min.js"></script>
    <script type="text/javascript " src="${pageContext.request.contextPath}/greenroom/js/xadmin.js"></script>

    <style>
        table tbody tr {
            height: 80px;
        }
        .table-img {
            width: 200px;
            height: 50px;
        }
        .layui-table .table-img {
            min-width: 220px;
            height: 100px;
        }

        .layui-table-cell {
            height: auto;
        }
        .layui-form-switch em,.layui-form-switch i{
            margin:0;
        }
    </style>
</head>
<body>
<div class="x-body">

    <xblock>
        <a href="#" lay-event="add" id="addScrap" class="layui-btn"><i class="layui-icon"></i>添加报废设备</a>
        <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
           href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </xblock>

    <table class="layui-hide" id="test1" lay-filter="test1"></table>

</div>
<script>
    layui.use(['table', 'layer', 'upload', 'form'], function () {
        let table = layui.table;
        let layer = layui.layer;
        let upload = layui.upload;
        let form = layui.form;

        //第一个实例
        table.render({
            elem: '#test1',
            url: '${pageContext.request.contextPath}/scrapLimit.handler', //数据接口
            page: true, //开启分页,
            id: "test1",
            cols: [[ //表头
                {field: 'sid', width: "10%", title: '编号', sort: true},
                {field: 'ename', width: "15%", title: '设备名', sort: true,templet:'<div>{{d.equipment.ename}}</div>'},
                {field: 'state', width: "10%", title: '状态', sort: true,templet:'<div>{{d.equipment.state}}</div>'},
                {field: 'imgs', title: '图片', width: "25%",templet: function (d) {
                        return "<img class='table-img' src='/img1/" + d.equipment.path + "'></img>"
                    }},
                {field: 'addTime', width: "20%", title: '添加时间', sort: true,templet:'<div>{{d.equipment.addTime}}</div>'},
                {field: 'stime', width: "20%", title: '报废时间', sort: true},
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
            , page:true
            , limits: [5, 15, 30]
            , limit: 5 //每页默认显示的数量
        });

        var $ = layui.$, active = {
            reload: function () {
                //执行重载
                table.reload('test1', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                }, 'data');
            }
        };
        //头工具栏事件
        $("#addScrap").click(function () {
            layer.open({
                type: 2,
                skin: 'layui-layer-rim',
                area: ['550px', '400px'],
                content: "${pageContext.request.contextPath}/GoAddScrap.handler",
                end:function () {
                    table.reload('test1', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    });
                }
            });
        })


    })
</script>
</body>
</html>
