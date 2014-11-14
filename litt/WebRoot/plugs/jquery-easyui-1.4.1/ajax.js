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
		alert("aaa");
	});
	resultVar = resultVar.substring(0, resultVar.length-1) + "}";
	alert(resultVar);
	
}

function formatOper(val,row,index){  
    return "<a href='#' class='easyui-linkbutton' iconCls='icon-edit' onclick='editUser("+index+")'>修改</a>&nbsp;&nbsp;<a href='#' class='easyui-linkbutton' iconCls='icon-delete' onclick='editUser("+index+")'>删除</a>";  
} 