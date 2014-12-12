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
		
		if($(this).attr("name") != null && $(this).attr("name") != "undefine" && $(this).attr("name") != "" && $(this).attr("name") != data){
			resultVar += ("'" + $(this).attr("name") +"':'" + $(this).val() + "',");
		}else if($(this).attr("name") == data && isGone == false){
			var comboVal = $('#'+data).combobox('getValues'); 
			resultVar += ("'" + data +"':'" + comboVal + "',");
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
	    },
	    onBeforeClose:function(){ //当面板关闭之前触发的事件
			$('#detail_window').window('close', true); //这里调用close 方法，true 表示面板被关闭的时候忽略onBeforeClose 回调函数。
			$('#ff').form('clear');
	    }
	});
	$win.window('open');
}