<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<title>user test</title>
	
	<script type="text/javascript" src="plugs/jquery-easyui-1.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="plugs/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="plugs/jquery-easyui-1.4.1/jquery.edatagrid.js"></script>
	<script type="text/javascript" src="plugs/jquery-easyui-1.4.1/jquery.edatagrid.lang.js"></script>
	<script type="text/javascript" src="plugs/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="plugs/jquery-easyui-1.4.1/themes/metro/easyui.css" />
	<link rel="stylesheet" type="text/css" href="plugs/jquery-easyui-1.4.1/themes/icon.css" />
	
	<script type="text/javascript">
		$(function(){
			$('#userview').edatagrid({});	
		});
	</script>
			
</head>
<body>
	<table id="userview" rownumbers="true" pagination="true" fitColumns="true" singleSelect="true" remoteSort="false" pageSize=20 toolbar="#tb" url="main/user/listAll">
		<thead>
			<tr>
				<th field="loginName" sortable="true"  align="center" width="60">aa</th>
				<th field="password" sortable="true"  align="center" width="65">bb</th>
				<th field="trueName" sortable="true"  align="center" width="85">cc</th>
				<th field="birthday" sortable="true" align="center" width="100">dd</th>	
			</tr>
		</thead>
	</table>

</body>
</html>