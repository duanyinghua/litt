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
	<script type="text/javascript" src="public/plugs/jquery-easyui-1.4.1/ichart.1.2.1.min.js"></script>
	<script type="text/javascript">
	$(function(){
		var data = [
		        	{name : 'HTML5&CSS3',value : 30,color:'#fedd74'},
		        	{name : 'jQuery',value : 25,color:'#82d8ef'},
		        	{name : 'easyui',value : 15,color:'#f76864'},
		        	{name : 'ichartjs',value : 20,color:'#80bd91'},
		        	{name : 'Others',value : 10,color:'#fd9fc1'}
	        	];
    	
		var chart = new iChart.Donut2D({
			render : 'canvasDiv',
			center:{
				text:'核心\n框架',
				shadow:true,
				shadow_offsetx:0,
				shadow_offsety:2,
				shadow_blur:2,
				shadow_color:'#b7b7b7',
				color:'#6f6f6f'
			},
			data: data,
			offsetx:-60,
			shadow:true,
			background_color:'#f4f4f4',
			separate_angle:10,//分离角度
			tip:{
				enable:true,
				showType:'fixed'
			},
			legend : {
				enable : true,
				shadow:true,
				background_color:null,
				border:false,
				legend_space:30,//图例间距
				line_height:34,//设置行高
				sign_space:10,//小图标与文本间距
				sign_size:30,//小图标大小
				color:'#6f6f6f',
				fontsize:30//文本大小
			},
			sub_option:{
				label:false,
				color_factor : 0.3
			},
			showpercent:true,
			decimalsnum:2,
			width : 800,
			height : 400,
			radius:140
		});

		/**
		 *利用自定义组件构造左侧说明文本。
		 */
		chart.plugin(new iChart.Custom({
				drawFn:function(){
					/**
					 *计算位置
					 */	
					var y = chart.get('originy');
					/**
					 *在左侧的位置，设置竖排模式渲染文字。
					 */
					chart.target.textAlign('center')
					.textBaseline('middle')
					.textFont('600 24px 微软雅黑')
					.fillText('前端框架采用的各种奇葩组件',100,y,false,'#6d869f', 'tb',26,false,0,'middle');
					
				}
		}));
		
		chart.draw();
	});
	</script>
</head>
<body>
	<h2>环形图</h2>
	<div id="canvasDiv" />
</body>
</html>