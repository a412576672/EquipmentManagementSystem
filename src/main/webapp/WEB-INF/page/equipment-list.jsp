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
        <a href="#" lay-event="add" id="addEq" class="layui-btn"><i class="layui-icon"></i>添加设备</a>
        <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
           href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </xblock>

    <table class="layui-hide" id="test1" lay-filter="test"></table>

</div>
<script type="text/html" id="barDemo">
        <a title="编辑" class="layui-btn layui-btn-sm layui-btn-normal" lay-event="edit">
            <img src="${pageContext.request.contextPath}/images/svg/bianji.svg" width="15px" height="24px" style="margin-bottom: 4px"></img> 编辑

        </a>
        <a title="删除" class="deleteBtns layui-btn layui-btn-sm layui-btn-danger" lay-event="del"
           href="#">
            <img src="${pageContext.request.contextPath}/images/svg/shanchu.svg" width="15px" height="24px" style="margin-bottom: 4px"></img> 删除
        </a>
</script>
<script>
    layui.use(['table', 'layer', 'upload', 'form'], function () {
        let table = layui.table;
        let layer = layui.layer;
        let upload = layui.upload;
        let form = layui.form;

        //第一个实例
        table.render({
            elem: '#test1',
            url: '${pageContext.request.contextPath}/EquipmentLimit.handler', //数据接口
            page: true, //开启分页,
            id: "test1",
            cols: [[ //表头
                {field: 'eid', width: "10%", title: '编号', sort: true},
                {field: 'ename', width: "10%", title: '设备名', sort: true},
                {field: 'addTime', width: "10%", title: '添加时间', sort: true},
                {field: 'state', width: "10%", title: '状态', sort: true},
                {field: 'wname', width: "10%", title: '所属车间', sort: true,templet:'<div>{{d.workshop.wname}}</div>'},
                {field: 'cname', width: "10%", title: '设备分类', sort: true,templet:'<div>{{d.classify.cname}}</div>'},
                {field: 'imgs', title: '图片', width: "25%",templet: function (d) {
                        return "<img class='table-img' src='/img1/" + d.path + "'></img>"
                    }},
                {field: 'right', title: '操作',width: "15%", toolbar: '#barDemo'}
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

        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                layer.open({
                    type: 2,
                    skin: 'layui-layer-rim',
                    area: ['550px', '620px'],
                    content: "${pageContext.request.contextPath}/editEquipment.handler?id="+data.eid,
                    end:function () {
                        table.reload('test1', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        });
                    }
                });
            }else if (obj.event === 'del'){
                console.log(data)
                layer.confirm('真的删除行么', function(index){
                    layer.close(index);
                    console.log(data.eid);
                    $.ajax({
                        url:"${pageContext.request.contextPath}/deleteEquipment.handler",
                        type:"POST",
                        data:{
                            id: data.eid  //此处是根据id查询此id是否被删除，故将id传向后端
                        },
                        success:function (date) {
                            if(date==true) {
                                table.reload('test1', {
                                    page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                });
                                layer.msg('删除成功啦', {icon: 1}, {time: 2000});
                            }else{
                                layer.msg('删除失败！', {icon: 2}, {time: 2000});
                            }
                        }
                    });
                });
            }
        });
        var $ = layui.$, active = {
            reload: function () {
                //执行重载
                table.reload('test', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                }, 'data');
            }
        };
        //头工具栏事件
        $("#addEq").click(function () {
            layer.open({
                type: 2,
                skin: 'layui-layer-rim',
                area: ['550px', '620px'],
                content: "${pageContext.request.contextPath}/addEquipment.handler",
                end:function () {
                    table.reload('test1', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    });
                }
            });
        })

        // 处理显示
        form.on('switch(switchTest)', function (data) {

            $.post("${pageContext.request.contextPath}/banner/setBannerIsShow", {
                id: $(data.elem).attr("data-id"),
                isShow: this.checked ? 1 : 0
            }, function (res) {
            });
        });

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#upload-btn'
            , url: '${pageContext.request.contextPath}/general/upload' //改成您自己的上传接口
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
                $("#path").val(res.data.uploadFileName);
            }
            , error: function () {
                //演示失败状态，并实现重传
                let demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

    })
</script>
</body>
</html>
