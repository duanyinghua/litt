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
			var flow=[];
			for(var i=0;i<25;i++){
				flow.push(Math.floor(Math.random()*(10+((i%16)*5)))+10);
			}
			
			var data = [
			         	{
			         		name : 'PV',
			         		value:flow,
			         		color:'#ec4646',
			         		line_width:2
			         	}
			         ];
	        
			var labels = ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"];
			
			var chart = new iChart.LineBasic2D({
				render : 'canvasDiv',
				data: data,
				align:'center',
				title : {
					text:'某医院上一日门诊流量',
					font : '微软雅黑',
					fontsize:24,
					color:'#b4b4b4'
				},
				subtitle : {
					text:'数据取自后台随机生成',
					font : '微软雅黑',
					color:'#b4b4b4'
				},
				footnote : {
					text:'fuwaigroup.com',
					font : '微软雅黑',
					fontsize:11,
					fontweight:600,
					padding:'0 28',
					color:'#b4b4b4'
				},
				width : 800,
				height : 400,
				shadow:true,
				shadow_color : '#202020',
				shadow_blur : 8,
				shadow_offsetx : 0,
				shadow_offsety : 0,
				background_color:'#2e2e2e',
				animation : true,//开启过渡动画
				animation_duration:600,//600ms完成动画
				tip:{
					enable:true,
					shadow:true,
					listeners:{
						 //tip:提示框对象、name:数据名称、value:数据值、text:当前文本、i:数据点的索引
						parseText:function(tip,name,value,text,i){
							 return "<span style='color:#005268;font-size:12px;'>"+labels[i]+":00访问量约:<br/>"+
								"</span><span style='color:#005268;font-size:20px;'>"+value+"万</span>";
						}
					}
				},
				crosshair:{
					enable:true,
					line_color:'#ec4646'
				},
				sub_option : {
					smooth : true,
					label:false,
					hollow:false,
					hollow_inside:false,
					point_size:8
				},
				coordinate:{
					width:640,
					height:260,
					striped_factor : 0.18,
					grid_color:'#4e4e4e',
					axis:{
						color:'#252525',
						width:[0,0,4,4]
					},
					scale:[{
						 position:'left',	
						 start_scale:0,
						 end_scale:100,
						 scale_space:10,
						 scale_size:2,
						 scale_enable : false,
						 label : {color:'#9d987a',font : '微软雅黑',fontsize:11,fontweight:600},
						 scale_color:'#9f9f9f'
					},{
						 position:'bottom',	
						 label : {color:'#9d987a',font : '微软雅黑',fontsize:11,fontweight:600},
						 scale_enable : false,
						 labels:labels
					}]
				}
			});
			//利用自定义组件构造左侧说明文本
			chart.plugin(new iChart.Custom({
					drawFn:function(){
						//计算位置
						var coo = chart.getCoordinate(),
							x = coo.get('originx'),
							y = coo.get('originy'),
							w = coo.width,
							h = coo.height;
						//在左上侧的位置，渲染一个单位的文字
						chart.target.textAlign('start')
						.textBaseline('bottom')
						.textFont('600 11px 微软雅黑')
						.fillText('访问量(万)',x-40,y-12,false,'#9d987a')
						.textBaseline('top')
						.fillText('(时间)',x+w+12,y+h+10,false,'#9d987a');
						
					}
			}));
		//开始画图
		chart.draw();
	});
	</script>
</head>
<body>
	<h2>折线图</h2>
	<div id="canvasDiv" />
</body>
</html>