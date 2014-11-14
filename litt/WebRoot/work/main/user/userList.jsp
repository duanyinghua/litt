<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<head>
	<%@include file="/work/include/head.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<title>user test</title>
</head>
<body class="easyui-layout">
	<table id="tableview" title="test_table" rownumbers="true" pagination="true" fitColumns="true" singleSelect="true" remoteSort="false" pageSize=20 toolbar="#searchview" url="main/user/listAll">
		<thead>
			<tr>
				<th field="loginName" sortable="true"  align="center" width="60">aa</th>
				<th field="password" sortable="true"  align="center" width="65">bb</th>
				<th field="trueName" sortable="true"  align="center" width="65">cc</th>
				<th field="birthday" sortable="true" align="center" width="30">dd</th>
				<th field="operate" align="center" width="40" formatter="formatOper">操作</th>	
			</tr>
		</thead>
	</table>
	<div id="searchview">
		<a href="javascript:addUser()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
		<a href="javascript:editUser()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> 
		<a href="javascript:delUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		&nbsp;
		<a plain="true">
			从<input name="startDate" class="easyui-datebox" style="width:100px;" />
			到<input name="endDate" class="easyui-datebox" style="width:100px;" />
			<!-- 自定义常量，即定义前台时间段对应数据库里哪个字段，以bean的属性名表示 -->
			<input type="hidden" name="dateProp" value="birthday" /></a>
			<!-- 自定义常量，即页面搜索调用的ajax地址，id为默认，无需修改 -->
			<input type="hidden" id="searchUrl" value="main/user/listAll" />
		</a>
		&nbsp;
		<a plain="true"><input id="tableSearch" class="easyui-searchbox" data-options="prompt:'请输入搜索内容',menu:'#mm',searcher:doSearch" style="width:200px;"></input></a>	
	</div>
	<div id="mm" style="width:150px">
		<div data-options="name:'loginName',iconCls:'icon-ok'">aa</div>
		<div data-options="name:'loginName',iconCls:'icon-ok'">bb</div>
		<div data-options="name:'loginName',iconCls:'icon-ok'">cc</div>
	</div>
</body>
</html>