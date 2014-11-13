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
		
		function doSearch(value,name){
			$.ajax({
				type:"POST",
			    url: "route/list",
			    dataType:"json",
			    data:{"data":value, "type":name},
			    beforeSend: function(){   
			        $.messager.progress({   
			                title:'请稍等...',   
			                msg:'正在加载数据...'  
			            });   
			    },
			    success:function(data){
			    	$('#userview').datagrid('loadData',data);
			    	$.messager.progress('close');
			    }
			});
			
		}
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
	<div id="tb">
		<a href="javascript:addUser()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
		<a href="javascript:editUser()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> 
		<a href="javascript:delUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a plain="true"><input class="easyui-searchbox" data-options="prompt:'搜索',menu:'#mm',searcher:doSearch" style="width:350px;"></input></a>	
	</div>
	<div id="mm" style="width:150px">
		<div data-options="name:'loginName',iconCls:'icon-ok'">aa</div>
	</div>
</body>
</html>