<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10957
  Date: 2021/3/8
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
        .layui-table tr {

            height: 50px;
        }
    </style>
</head>

<body>

<div class="x-body">

        <xblock>
        <a href="#" id="addAdmin" class="layui-btn"><i class="layui-icon"></i>添加</a>
            <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
               href="javascript:location.replace(location.href);" title="刷新">
                <i class="layui-icon" style="line-height:38px">ဂ</i></a>
        </xblock>
    <script type="text/html" id="barDemo">
        <a title="编辑" class="layui-btn layui-btn-sm layui-btn-normal" lay-event="edit">
            <img src="${pageContext.request.contextPath}/images/svg/bianji.svg" width="15px" height="24px" style="margin-bottom: 4px"></img> 编辑

        </a>
        <a title="删除" class="deleteBtns layui-btn layui-btn-sm layui-btn-danger" lay-event="del"
           href="#">
            <img src="${pageContext.request.contextPath}/images/svg/shanchu.svg" width="15px" height="24px" style="margin-bottom: 4px"></img> 删除
        </a>
    </script>
    <table class="layui-hide" id="test1" lay-filter="test1"></table>

</div>
<script>
    layui.use(['table', 'layer'], function () {
        let table = layui.table;
        let layer = layui.layer;

        table.render({
            elem: '#test1'
            , url: '${pageContext.request.contextPath}/adminLimit.handler'
            , title: '管理员表'
            , cols: [[
                {field: 'aid', title: '编号', width: "20%"}
                , {field: 'username', title: '账户', width: "20%"}
                , {field: 'password', title: '密码', width: "20%"}
                , { title: '操作', toolbar: '#barDemo', width: "40%"}
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
        table.on('tool(test1)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                layer.open({
                    type: 2,
                    skin: 'layui-layer-rim',
                    area: ['550px', '300px'],
                    content: "${pageContext.request.contextPath}/editAdmin.handler?id="+data.aid,
                    end:function () {
                        table.reload('test1', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        });
                    }
                });            }else if (obj.event === 'del'){
                console.log(data.count)
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                    console.log("==="+data.aid);
                    $.ajax({
                        url:"${pageContext.request.contextPath}/deleteAdmin.handler",
                        type:"POST",
                        data:{
                            id: data.aid,  //此处是根据id查询此id是否被删除，故将id传向后端
                        },
                        success:function (date) {
                            if(date==true) {
                                layer.msg('删除成功啦', {icon: 1}, {time: 2000});
                            }else{
                                layer.msg('删除失败！', {icon: 2}, {time: 2000});
                            }
                        }
                    });
                });
            }
        });
        $("#addAdmin").click(function () {
            layer.open({
                type: 2,
                skin: 'layui-layer-rim',
                area: ['550px', '250px'],
                content: "${pageContext.request.contextPath}/addAdmin.handler",
                end:function () {
                    table.reload('test1', {
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
    $(".deleteBtns").click(function () {
        let name = $(this).parent().parent().children("td:eq(1)").html();
        return confirm("请问是否删除'" + name + "'？");
    })
</script>
<script>

    layui.use('layer', function() {
        let layer = layui.layer;
        //先得到当前iframe层的索引
        <c:if test="${addAdminGood}">
        <c:remove var="addAdminGood"/>
        layer.msg('添加管理员成功', {icon: 1,anim: 5});
        </c:if>
        <c:if test="${addAdminFail}">
        <c:remove var="addAdminFail"/>
        layer.msg('添加管理员失败', {icon: 5,anim: 6});
        </c:if>
        <c:if test="${updateAdminGood}">
        <c:remove var="updateAdminGood"/>
        layer.msg('修改管理员成功', {icon: 1,anim: 5});
        </c:if>
        <c:if test="${updateAdminFail}">
        <c:remove var="updateAdminFail"/>
        layer.msg('修改管理员失败', {icon: 5,anim: 6});
        </c:if>
        <c:if test="${deleteAdminGood}">
        <c:remove var="deleteAdminGood"/>
        layer.msg('删除管理员成功', {icon: 1,anim: 5});
        </c:if>
        <c:if test="${deleteAdminFail}">
        <c:remove var="deleteAdminFail"/>
        layer.msg('删除管理员失败', {icon: 5,anim: 6});
        </c:if>
    });

</script>
</body>
</html>
