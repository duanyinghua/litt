$(function(){
    var tabs = $("#tabs").tabs().tabs('tabs');
    for(var  i=0; i<tabs.length; i++){
        tabs[i].panel('options').tab.unbind().bind('mouseenter',{index:i},function(e){
            $('#tabs').tabs('select',e.data.index);
        });
    }
})