<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<title>user test</title>
	<base href="<%=basePath%>">
		<!-- 
	<script data-main="public/plugs/requirejs/main" src="public/plugs/requirejs/require.js"></script>

	<link rel="stylesheet" type="text/css" href="public/css/style.css" /> -->
	<link rel="stylesheet" type="text/css" href="public/plugs/jquery-easyui-1.4.1/themes/metro/easyui-green.css" />
	<link rel="stylesheet" type="text/css" href="public/plugs/jquery-easyui-1.4.1/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="public/css/layout.css" />
	<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/easyui.validator.js"></script>
	<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/jquery.edatagrid.js"></script>
	<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/jquery.edatagrid.lang.js"></script>
	<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="public/plugs/JSON-js/json2.js"></script>
</head>
<body>
    <h2>"抛"实验</h2>
    <p>把左侧的项抛到右边</p>
    <div style="margin:20px 0;"></div>
    <div id="source" style="border:1px solid #ccc;width:300px;height:400px;float:left;margin:5px;">
        	准备抛出的项目
        <div id="d1" class="drag">工作1</div>
        <div id="d2" class="drag">工作2</div>
        <div id="d3" class="drag">工作3</div>
    </div>
    <div id="target" style="border:1px solid #ccc;width:300px;height:400px;float:left;margin:5px;">
        	抛到这里!
    </div>
    <div style="clear:both"></div>
    <style type="text/css">
        .drag{
            width:250px;
            height:30px;
            padding:10px;
            margin:5px;
            border:1px solid #ccc;
            background:#AACCFF;
        }
        .dp{
            opacity:0.5;
            filter:alpha(opacity=50);
        }
        .over{
            background:#FBEC88;
        }
    </style>
    <script>
        $(function(){
            $('.drag').draggable({
                proxy:'clone',
                revert:true,
                cursor:'auto',
                onStartDrag:function(){
                    $(this).draggable('options').cursor='not-allowed';
                    $(this).draggable('proxy').addClass('dp');
                },
                onStopDrag:function(){
                    $(this).draggable('options').cursor='auto';
                }
            });
            $('#source').droppable({
                accept:'#d1,#d2,#d3',
                onDragEnter:function(e,source){
                    $(source).draggable('options').cursor='auto';
                    $(source).draggable('proxy').css('border','1px solid red');
                    $(this).addClass('over');
                },
                onDragLeave:function(e,source){
                    $(source).draggable('options').cursor='not-allowed';
                    $(source).draggable('proxy').css('border','1px solid #ccc');
                    $(this).removeClass('over');
                },
                onDrop:function(e,source){
                    $(this).append(source)
                    $(this).removeClass('over');
                }
            });
            $('#target').droppable({
                accept:'#d1,#d2,#d3',
                onDragEnter:function(e,source){
                    $(source).draggable('options').cursor='auto';
                    $(source).draggable('proxy').css('border','1px solid red');
                    $(this).addClass('over');
                },
                onDragLeave:function(e,source){
                    $(source).draggable('options').cursor='not-allowed';
                    $(source).draggable('proxy').css('border','1px solid #ccc');
                    $(this).removeClass('over');
                },
                onDrop:function(e,source){
                    $(this).append(source)
                    $(this).removeClass('over');
                }
            });
        });
        
        function dragMe(){
        	$div = $('#target').children('div');
        	$div.each(
	        	function(){
	        		alert($(this).text());
	        	}
        	);
        }
    </script>
 	<a href="javascript:void(0);" class="easyui-linkbutton" onclick="dragMe()">点击查看右侧选中项</a>
</body>
</html>