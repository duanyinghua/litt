<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="public/plugs/jquery-easyui-1.4.1/themes/metro/easyui.css" />
<link rel="stylesheet" type="text/css" href="public/plugs/jquery-easyui-1.4.1/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="public/css/table.css" />

<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/easyui.validator.js"></script>
<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/jquery.edatagrid.js"></script>
<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/jquery.edatagrid.lang.js"></script>
<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/ajax.js"></script>
<script type="text/javascript" src="public/plugs/JSON-js/json2.js"></script>