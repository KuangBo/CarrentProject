
$(function () {
	

	
		$('#modal_info').on('hide.bs.modal',function() {//提示模糊框隐藏时候触发
       		 location.reload();  	//刷新当前页面
    	});
	
	

});



function getTradeInfo(id) {
	ajax(
		{
			method : 'POST',
			url : 'tradeManageAction_getTrade.action',
			params : "id=" + id,
			type : "json",
			callback : function(data) {
				$("#findId").val(data.id);
    			$("#findMoney").val(data.money);
    			$("#findCustomer").val(data.cusid);
    			$("#findStart").val(data.startdates);
    			$("#findState").val(data.state);
    			$("#findEnd").val(data.enddates);
    			$("#findCar").val(data.cid);

			}
		}

	);
}


function showInfo(msg) {
    $("#div_info").text(msg);
    $("#modal_info").modal('show');
}
