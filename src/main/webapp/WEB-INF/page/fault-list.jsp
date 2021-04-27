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
    <title>故障管理</title>
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
        <a href="#" id="addFault" class="layui-btn"><i class="layui-icon"></i>添加故障记录</a>
        <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
           href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </xblock>
    <table class="layui-hide" id="test4" lay-filter="test"></table>
</div>
<script type="text/html" id="barDemo">

    <a class="deleteBtns layui-btn layui-btn-sm layui-btn-warm" lay-event="look">查看</a>

</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        console.log(table)
        table.render({
            elem: '#test4'
            , url: '${pageContext.request.contextPath}/faultLimit.handler'
            , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
            , title: '故障管理'
            , cols: [[
                {field: 'fid', sort:"true", title: '编号', width: "15%"}
                ,{field: 'ename', width: "20%", title: '故障设备名', sort: true,templet:'<div>{{d.equipment.ename}}</div>'}
                ,{field: 'faultTime', title: '故障时间', width: "20%"}
                ,{field: 'status', width: "15%", title: '设备状态', sort: true,templet:function (d) {
                        if (d.maintain != null) {
                            return "<div>"+d.maintain.status+"</div>"
                        } else {
                            return '<div>未维修</div>'
                        }
                    }}
                , {field: 'cause', title: '故障原因', width: "20%"}
                , { title: '操作', toolbar: '#barDemo', width: "10%"}
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
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if(obj.event === 'look'){
                layer.open({
                    type:2,
                    content:"${pageContext.request.contextPath}/lookFault.handler?id="+data.fid,
                    area:['500px','400px'],
                    resize:false
                })
            }
        });
        $("#addFault").click(function () {
            layer.open({
                type: 2,
                skin: 'layui-layer-rim',
                area: ['550px', '400px'],
                content: "${pageContext.request.contextPath}/GoAddFault.handler",
                end:function () {
                    table.reload('test4', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    });
                }
            });
        })
    });
</script>
<script>
    layui.use('laydate', function(){
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
<script>
    layui.use('layer', function(){
        var layer = layui.layer;
        <c:if test="${addLiveinGood}">
        <c:remove var="addLiveinGood"/>
        layer.msg('办理入住成功', {icon: 1,anim: 5});
        </c:if>
        <c:if test="${addLiveinFail}">
        <c:remove var="addLiveinFail"/>
        layer.msg('办理入住失败', {icon: 5,anim: 6});

        </c:if>
        <c:if test="${liveinNotEng}">
        <c:remove var="liveinNotEng"/>
        layer.msg('当前没有可办理入住的订单',{icon: 5,anim: 6});
        </c:if>
        // layer.msg('hello');
    });


</script>
</body>
</html>
