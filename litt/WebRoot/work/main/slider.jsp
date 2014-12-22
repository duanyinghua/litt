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
	<h2>slider</h2> 
	<div style="margin:20px 0;">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="slide()">弹窗</a>	
    </div>
    <script type="text/javascript">
	 function slide(){
         $.messager.show({
             title:'测试弹出框',
             msg:'消息会在7秒后消失',
             timeout:5000,
             showType:'slide'
         });
     }
	</script>
</body>
</html>