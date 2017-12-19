
$(function () {
	

	
		$('#modal_info').on('hide.bs.modal',function() {//提示模糊框隐藏时候触发
       		 location.reload();  	//刷新当前页面
    	});
	
	

});



function getCustomerInfo(cusid) {
	ajax(
		{
			method : 'POST',
			url : 'customerManageAction_getCustomer.action',
			params : "cusid=" + cusid,
			type : "json",
			callback : function(data) {
				$("#findCusid").val(data.cusid);
    			$("#findCusname").val(data.cusname);
    			$("#findIdcard").val(data.idcard);
    			$("#findCusphone").val(data.cusphone);
    			$("#findBalance").val(data.balance);
			}
		}
	);
}


function showInfo(msg) {
    $("#div_info").text(msg);
    $("#modal_info").modal('show');
}
