
$(function () {
	

	
		$('#modal_info').on('hide.bs.modal',function() {//提示模糊框隐藏时候触发
       		 location.reload();  	//刷新当前页面
    	});
	
	

});



function getBookInfo(id){
		
	ajax(
		  {
		  	method:'POST',
    		url:'admin/tradeManageAction_getAllTrade.action',
			params: "id=" + id,
			type:"json",
    		callback:function(data) {
				$("#findISBN").val(data.id);
				$("#findBookName").val(data.money);
				$("#findBookType").val(data.putdate);
				$("#findAutho").val(data.putdate);
				$("#findPress").val(data.car);
				$("#findPrice").val(data.customer);
				$("#findDescription").val(data.state);
			}
		}
										   
							    
						
	);	
	
	
	
	
	
			

}



function showInfo(msg) {
    $("#div_info").text(msg);
    $("#modal_info").modal('show');
}


