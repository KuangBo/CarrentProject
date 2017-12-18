
$(function () {
	

	
		$('#modal_info').on('hide.bs.modal',function() {//提示模糊框隐藏时候触发
       		 location.reload();  	//刷新当前页面
    	});
	
	

});



function getCarInfo(cid) {
	ajax(
		{
			method : 'POST',
			url : 'carManageAction_getCar.action',
			params : "cid=" + cid,
			type : "json",
			callback : function(data) {
				$("#findCid").val(data.cid);
    			$("#findBrand").val(data.brand);
    			$("#findModel").val(data.model);
    			$("#findBaseprice").val(data.baseprice);
    			$("#findCarrent").val(data.carrent);
    			$("#findState").val(data.state);
			}
		}
	);
}


function showInfo(msg) {
    $("#div_info").text(msg);
    $("#modal_info").modal('show');
}
