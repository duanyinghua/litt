/**
 * 表格初始化，默认名字为tableview，如果页面包含多个表格，则需要再页面再定义。
 */
$(function(){
	$('#tableview').edatagrid({});
});	

/**
 *  表格的搜索功能
 *  searchview:搜索框ID  searchUrl:ajax调用的地址     tableview:搜索后重新加载的表格ID
 */
function doSearch(){
	var url = $('#searchUrl').val();
	
	var resultVar = "{";
	$("#searchview"+" :input").each(function (){
		//注意input前面有个空格 
		
		if($(this).attr("name") != null && $(this).attr("name") != "undefine" && $(this).attr("name") != ""){
			resultVar += ("'" + $(this).attr("name") +"':'" + $(this).val() + "',");
		}
	});
	resultVar = resultVar.substring(0, resultVar.length-1) + "}";
	
}

/**
 * 表格的自定义列内容，返回html串
 * @param val
 * @param row
 * @param index
 * @returns {String}
 */
function formatOper(val,row,index){  
    return "<a href='#' class='easyui-linkbutton' iconCls='icon-edit' onclick='editUser("+index+")'>修改</a>&nbsp;&nbsp;<a href='#' class='easyui-linkbutton' iconCls='icon-delete' onclick='editUser("+index+")'>删除</a>";  
}

/*
*添加选项卡方法
* @param title: 标题名称
* @param width: 输入框宽度
* @param height: 输入框高度
*/
function add(title, width, height){
	var $win;
	$win = $('#detail_window').window({
	    title: title,
	    width: width,
	    height: height,
	    top: ($(window).height() -400) * 0.5,
	    left: ($(window).width() - 500) * 0.5,
	    shadow: true,
	    modal: true,
	    iconCls: 'icon-add',
	    closed: false,
	    minimizable: false,
	    maximizable: true,
	    collapsible: true,
	    onBeforeOpen:function(){
	    	$("#sub").show();
	    	$("#update").hide();
	    	$('#ff').form('clear');
	     	$('.province').combobox({ 
			    url:'dict/getProvince',
			    editable:false, //不可编辑状态
			    cache: false,
			   // panelHeight: 'auto',//自动高度适合
			    valueField:'code',   
			    textField:'name',		    
			    onChange: function(){
			    	$(".city").combobox("setValue",'');
			    	$(".district").combobox("setValue",'');
			    	var province = $('.province').combobox('getValue');		
			    	if(province!=''){
			    		$.ajax({
			    			type: "POST",
			    			url: "dict/getCity?provinceCode="+province,
			    			cache: false,
			    			dataType : "json",
			    			success: function(data){
			    				$(".city").combobox("loadData",data);
		                    }
	                     }); 	
                     }
                 } 
            });
	     	$('.city').combobox({
 				valueField:'code',
 		        textField:'name',
 		        editable:false,
 		        onChange:function(newValue, oldValue){
			    	$(".district").combobox("setValue",'');
			    	var city = $('.city').combobox('getValue');		
			    	if(city!=''){
			    		$.ajax({
			    			type: "POST",
			    			url: "dict/getDistrict?cityCode="+city,
			    			cache: false,
			    			dataType : "json",
			    			success: function(data){
			    				$(".district").combobox("loadData",data);
		                    }
	                     }); 	
                     }
 		        }
	     	});

	    },
	    onBeforeClose:function(){ //当面板关闭之前触发的事件
			$('#detail_window').window('close', true); //这里调用close 方法，true 表示面板被关闭的时候忽略onBeforeClose 回调函数。
			$('#ff').form('clear');
	    }
	});
	$win.window('open');
}

function submit(url){
	
	var resultVar = "{";
	$("#detail_window"+" :input").each(function (){
		//注意input前面有个空格 
		
		if($(this).attr("name") != null && $(this).attr("name") != "undefine" && $(this).attr("name") != ""){
			resultVar += ("'" + $(this).attr("name") +"':'" + $(this).val() + "',");
		}
	});
	resultVar = resultVar.substring(0, resultVar.length-1) + "}";
	 var isValid = $("#detail_window").form("validate");
	 alert(isValid);
	 if(isValid){
	 $.ajax({
		type:"POST",
	    url: url,
	    dataType:"json",
	    data:{"data":resultVar},
	    beforeSend: function(){   
	        $.messager.progress({   
	                title:'请稍等...',   
	                msg:'正在加载数据...'  
	            });   
	    }, 
	    success:function(data){
	    	$.messager.progress('close');
	    	if(data.status == 1){
	    		$.messager.alert('温馨提示',data.comment,'info');
	    		$('#tableview').datagrid('reload');  
	    		$('#detail_window').window('close', true);
	    	}
	    	if(data.status == 0){
	    		$.messager.alert('温馨提示',data.comment,'error');
	    		$('#detail_window').window('close', true);
	    	}
	    }
	});
	}else{
		$.messager.alert('温馨提示','请检查表单里的选项','error');
		return;
	}
}

function edit(){
	var row = $('#tableview').datagrid('getSelected');
    if (row){
    	$.ajax({
			type:"POST",
		    url: "main/user/queryById",
		    data:{"id":row.id},
		    beforeSend: function(){   
		        $.messager.progress({   
		                title:'请稍等...',   
		                msg:'正在加载数据...'  
		            });   
		    }, 
		    success:function(data){
		    	$.messager.progress('close');
		    	if(data == null){
		    		$.messager.alert('温馨提示','打开用户页面失败, 请查看网络连接!','error');
					return;
		    	}   		    	
				var $win;
				$win = $('#detail_window').window({
				    title: '修改用户',
				    width: 500,
				    height: 350,
				    top: ($(window).height() -350) * 0.5,
				    left: ($(window).width() - 500) * 0.5,
				    shadow: true,
				    modal: true,
				    iconCls: 'icon-edit',
				    closed: true,
				    minimizable: false,
				    maximizable: false,
				    collapsible: false,
				    onBeforeOpen:function(){
				    	$("#psw").hide();
				    	$("#psw1").hide();
				    	$("#sub").hide();
				    	$("#update").show();
				    	$('#ff').form('load',data);
				    	//为界面赋值
				    },
				    onBeforeClose:function(){ //当面板关闭之前触发的事件
				    		$('#detail_window').window('close', true); //这里调用close 方法，true 表示面板被关闭的时候忽略onBeforeClose 回调函数。
				    		$('#ff').form('clear');
					    	
				    }
				});
				$win.window('open');
		    	
		    }
		});
    }else{
    	$.messager.alert('温馨提示','请先单击要选择的用户!','warning');
    	return;
    }
} 

function delUser(){
	var row = $('#userview').datagrid('getSelected');  
    if (row){
    	$.messager.confirm('温馨提示', '是否要删除 ' + row.routeName + ' 这个路由 ?', function(r){
    		if (r){
	    		$.ajax({
	    			type:"POST",
	    		    url: "route/delete",
	    		    data:{"id":row.id},
	    		    beforeSend: function(){   
	    		        $.messager.progress({   
	    		                title:'请稍等...',   
	    		                msg:'正在加载数据...'  
	    		            });   
	    		    }, 
	    		    success:function(data){
	    		    	$.messager.progress('close');
	    		    	if(data.status == 1){
	    		    		$.messager.alert('温馨提示',data.comment,'info');
	    		    		$('#userview').datagrid('reload');  
	    		    		$('#user_window').window('close', true);
	    		    	}
	    		    	if(data.status == 0){
	    		    		$.messager.alert('温馨提示',data.comment,'error');
	    		    		$('#user_window').window('close', true);
	    		    	}
	    		    }
	    		});
	    	}else{
	    		return false;
	    	}
    	});
    }
}