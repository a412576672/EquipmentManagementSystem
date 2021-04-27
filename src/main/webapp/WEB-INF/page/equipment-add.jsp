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
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
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
                <span class="x-red">*</span>设备名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="ename" name="ename" required
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="state" class="layui-form-label">
                <span class="x-red">*</span>设备状态
            </label>
            <div class="layui-input-inline">
                <input type="text" id="state" name="state" required readonly
                       value="正常"    autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>不可修改
            </div>
        </div>
        <div class="layui-form-item">
            <label for="path" class="layui-form-label">
                图片
            </label>
            <input type="hidden" name="path" id="path" required >
            <div class="layui-upload">
                <div class="layui-upload-list">
                    <img class="layui-upload-img" id="demo1">
                    <p id="demoText"></p>
                </div>
                <button  type="button" class="layui-btn" id="upload-btn">上传图片</button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>所属工厂</label>
            <div class="layui-input-block">
                <select style='width:190px' name="wid" lay-verify="required">
                    <option value="">请选择所属工厂</option>
                    <c:forEach items="${workshops}" var="workshop">
                            <option value="${workshop.wid}">${workshop.wname}</option>
                    </c:forEach>

                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>设备类型</label>
            <div class="layui-input-block">
                <select style='width:190px' name="cid" lay-verify="required">
                    <option value="">请选择设备类型</option>
                    <c:forEach items="${classifys}" var="classify">
                        <option value="${classify.cid}">${classify.cname}</option>
                    </c:forEach>

                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <button type="submit" id="submitUp" lay-submit lay-filter="insert"  class="layui-btn"  >
                添加
            </button>
            <a href="#" id="backtrack" class="layui-btn">返回</a>
        </div>
    </form>
</div>
<script>
    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#upload-btn'
            , url: '${pageContext.request.contextPath}/uploadImg.handler' //改成您自己的上传接口
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
                console.log(res)
                //上传成功
                $("#path").val(res.data.uploadFileName);
                console.log($("#path").val())
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    });
</script>
<script>
    layui.use(['form', 'layer'], function () {
        let form = layui.form;
        let layer = layui.layer;
        //监听提交
        let index = parent.layer.getFrameIndex(window.name);
        $("#backtrack").click(function () {
            parent.layer.close(index);
        })
        form.on('submit(insert)', function (data) {
            let $ = layui.$;
            $.ajax({
                type: 'post',
                url: "${pageContext.request.contextPath}/insertEquipment.handler",
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
