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
	<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/layout.js"></script>
	<script type="text/javascript" src="public/plugs/JSON-js/json2.js"></script>
	<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/table.js"></script>
	 
</head>
<body>
	<h2>Layout</h2> 
    <div style="margin:20px 0;"></div>
    <div class="easyui-layout" style="width:80%;height:700px; MARGIN-RIGHT: auto; MARGIN-LEFT: auto; ">
        <div id="p" data-options="region:'west'" style="width:25%;padding:10px">
            <h3 class="adv_type">咨询分类：</h3> 
        </div>
        <div data-options="region:'center'" title="常见问题" headerCls="layouthead";>
        	<div id="tabs" class="easyui-tabs" data-options="fit:true,border:false,plain:true">
                <div title="全部" style="padding:10px"></div>
                <div title="内科" style="padding:5px"></div>
                <div title="神经外科" style="padding:5px"></div>
                <div title="儿科" style="padding:5px"></div>
            </div>
        </div>
    </div>	
</body>
</html>