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
	<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/treegrid.js"></script>
</head>
<body>
	<div style="margin:20px 0;">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="cancel()">取消</a>
	</div>
	<table id="tg" class="easyui-treegrid" title="可编辑的树形列表" style="width:800px;height:450px"
			data-options="
				iconCls: 'icon-ok',
				rownumbers: false,
				animate: true,
				collapsible: true,
				fitColumns: true,
				url: 'public/treegrid_data2.json',
				method: 'get',
				idField: 'id',
				treeField: 'loginName',
				showFooter: true
			">
		<thead>
			<tr>
				<th data-options="field:'loginName',width:180,editor:'text'">医生工作任务</th>
				<th data-options="field:'phone',width:60,align:'right',editor:'numberbox'">次数</th>
				<th data-options="field:'createTime',width:80,editor:'datebox'">开始时间</th>
				<th data-options="field:'lastUpdateTime',width:80,editor:'datebox'">结束时间</th>
				<th data-options="field:'progress',width:120,formatter:formatProgress,editor:'numberbox'">进度</th>
			</tr>
		</thead>
	</table>
</body>
</html>