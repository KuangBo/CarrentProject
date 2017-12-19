


function deleteCustomer(cusid){
	ajax(
    		  {
			  	method:'POST',
	    		url:'customerManageAction_deleteCustomer.action',
				params: "cusid=" + cusid,
	    		callback:function(data) {
	    			if (data == 1) {
						showInfo("删除成功");
					}else{
						showInfo("删除失败");
					}
								
				}
			}
			   
    	);
			

}

$('#modal_info').on('hide.bs.modal',function() {//提示模糊框隐藏时候触发
       		 location.reload();  	//刷新当前页面
 });



function showInfo(msg) {
    $("#div_info").text(msg);
    $("#modal_info").modal('show');
}


