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
        <form class="layui-form" id="edit-type-form" method="post" action="${pageContext.request.contextPath}/updateClassify.handler" >
            <div class="layui-form-item">
                <label for="cid" class="layui-form-label">
                    id
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="cid" name="cid" required   readonly
                           value="${classifyItem.cid}"     autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>不可更改
                </div>
            </div>
            <div class="layui-form-item">
                <label for="cname" class="layui-form-label">
                    <span class="x-red">*</span>设备类型名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="cname" name="cname" required
                           value="${classifyItem.cname}"      autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>唯一
                </div>
            </div>
            <div class="layui-form-item">
                <button type="submit" id="submitUp" lay-submit lay-filter="update"  class="layui-btn"  >
                    修改
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
            form.on('submit(update)', function (data) {
                console.log(data);
                let index = parent.layer.getFrameIndex(window.name);
                let $ = layui.$;
                $.ajax({
                    type: 'post',
                    url: "${pageContext.request.contextPath}/updateClassify.handler",
                    data: data.field,
                    success: function (data) {
                        console.log(data)
                        if (data == true) {
                            parent.layer.close(index);
                        } else if (data == false) {
                            layer.msg('修改失败。。。');
                        }
                    }
                });
                return false;
            });
            let index = parent.layer.getFrameIndex(window.name);
            $("#backtrack").click(function () {
                parent.layer.close(index);
            })
        });
    </script>

</body>
</html>
