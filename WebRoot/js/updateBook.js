
$(function() {


	$('#updateBook').click(function() {

		var postdata = "id=" + $.trim($("#updateId").val()) + "&money=" + $.trim($("#updateMoney").val()) + "&startdates=" + $.trim($("#updateStart").val())
		+ "&enddates=" + $.trim($("#updateEnd").val()) + "&cusid=" + $.trim($("#updateCustomer").val()) + "&cid=" + $.trim($("#updateCar").val());
		ajax(
			{
				method : 'POST',
				url : 'tradeManageAction_updateTrade.action',
				params : postdata,
				callback : function(data) {
					if (data == 1) {
						$("#updateModal").modal("hide"); //关闭模糊框		
						showInfo("修改成功");

					} else {
						$("#updateinfo").modal("hide"); //关闭模糊框
						showInfo("修改失败");
					}

				}
			}

		);


	});






	$('#modal_info').on('hide.bs.modal', function() { //提示模糊框隐藏时候触发
		location.reload(); //刷新当前页面
	});



});






function updateBook(id) {
	ajax(
		{
			method : 'POST',
			url : 'tradeManageAction_getTrade.action',
			params : "id=" + id,
			type : "json",
			callback : function(data) {
				$("#updateId").val(data.id);
    			$("#updateMoney").val(data.money);
    			$("#updateCustomer").val(data.cusid);
    			$("#updateStart").val(data.startdates);
    			$("#updateState").val(data.state);
    			$("#updateEnd").val(data.enddates);
    			$("#updateCar").val(data.cid);

			}
		}

	);
}

function showInfo(msg) {
	$("#div_info").text(msg);
	$("#modal_info").modal('show');
}