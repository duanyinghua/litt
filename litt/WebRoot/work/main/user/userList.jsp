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
	
	<script defer async="true" data-main="public/plugs/requirejs/main" src="public/plugs/requirejs/require.js"></script>
	<link rel="stylesheet" type="text/css" href="public/css/style.css" />
</head>
<body class="easyui-layout">
	<table id="tableview" title="测试小例子" rownumbers="true" pagination="true" fitColumns="true" singleSelect="true" remoteSort="false" pageSize=20 toolbar="#searchview" url="main/user/listAll">
		<thead>
			<tr>
				<th field="loginName" sortable="true"  align="center" width="60">登录名</th>
				<th field="password" sortable="true"  align="center" width="65">权限</th>
				<th field="trueName" sortable="true"  align="center" width="65">真实姓名</th>
				<th field="birthday" sortable="true" align="center" width="30">生日</th>
				<th field="phone" sortable="true" align="center" width="40">电话</th>
				<th field="address" sortable="true" align="center" width="100">地址</th>
				<th field="operate" align="center" width="40" formatter="formatOper">操作</th>	
			</tr>
		</thead>
	</table>
	<div id="searchview">
		<a href="javascript:add('注册新用户','500px','400px')" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
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
		<a plain="true"><input id="tableSearch" class="easyui-searchbox" data-options="prompt:'请输入搜索内容',menu:'#mm',searcher:doSearch" style="width:300px;"></input></a>	
	</div>
	<div id="mm" style="width:150px">
		<div data-options="name:'phone',iconCls:'icon-ok'">电话</div>
		<div data-options="name:'loginName',iconCls:'icon-ok'">登录名</div>
	</div>
	
	<div id="detail_window" class="easyui-window" closed="true" style="padding-top:20px">
		<form id="ff" method="post">
            <table class="detail_window" cellpadding="5" style="MARGIN-RIGHT:auto; MARGIN-LEFT:auto; width:100%;">
                <tr>
                    <td class="detail_head"><span style="color:red">*</span>登录名:</td>
                    <td class="detail_content"><input class="easyui-textbox detail_input" type="text" name="loginName" data-options="required:true" validtype="remote['main/user/validAttr','loginName']", invalidMessage="用户名已存在"/></td>
                </tr>
                <tr>
                    <td class="detail_head"><span style="color:red">*</span>真实姓名:</td>
                    <td class="detail_content"><input class="easyui-textbox detail_input" type="text" name="trueName" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td class="detail_head"><span style="color:red">*</span>电话:</td>
                    <td class="detail_content"><input class="easyui-textbox detail_input" type="text" name="phone" data-options="required:true" validType="mobile"/></td>
                </tr>
                <tr>
                    <td class="detail_head"><span style="color:red">*</span>所属权限:</td>
                    <td class="formTableTxt detail_content">
						<input id="roleCode" type="text" class="easyui-combobox detail_input" required="true" validtype="selectValueRequired" value="" name="roleCode"
							data-options="url:'main/role/listAll',valueField:'roleCode',textField:'roleName',multiple:false,editable:false," panelHeight:"auto" />
						<input id="id" type="hidden" name="id"></input>
					</td>
                </tr>
 				<tr>
                    <td class="detail_head"><span style="color:red">*</span>地址:</td>
                    <td class="formTableTxt detail_content"  style="display:inline;">
						省:<input id="provinceCode" type="text" class="easyui-combobox province" required="true" validtype="selectValueRequired" name="provinceCode" style="width:80px;" 
						data-options="valueField:'code',textField:'name',multiple:false,editable:false"/>
						市:<input id="cityCode" type="text" class="easyui-combobox city" required="true" validtype="selectValueRequired" name="cityCode" style="width:80px;" 
						data-options="valueField:'code',textField:'name',multiple:false,editable:false" />
						区/县:<input id="districtCode" type="text" class="easyui-combobox district" required="true" validtype="selectValueRequired" name="districtCode" style="width:80px;" 
						data-options="valueField:'code',textField:'name',multiple:false,editable:false" />
					</td>
                </tr>
            </table>
        </form>
    	<br/> 
	    <div style="padding: 5px; text-align:center;">
	        <a id="sub" href="javascript:submit('main/user/save')" class="easyui-linkbutton" style="width:180px;" icon="icon-ok">提交</a>
	        <a id="update" href="javascript:update('sendAdapterId')" class="easyui-linkbutton" style="width:180px;" icon="icon-ok">修改</a>
	    </div>
	</div>		
</body>
</html>