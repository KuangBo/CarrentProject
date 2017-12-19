
$(function() {


	$('#updateCustomer').click(function() {

		var postdata = "cusid=" + $.trim($("#updateCusid").val()) + "&cusname=" + $.trim($("#updateCusname").val()) + "&idcard=" + $.trim($("#updateIdcard").val())
		+ "&cusphone=" + $.trim($("#updateCusphone").val()) + "&balance=" + $.trim($("#updateBalance").val());
		ajax(
			{
				method : 'POST',
				url : 'customerManageAction_updateCustomer.action',
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






function updateCustomer(cusid) {
	ajax(
		{
			method : 'POST',
			url : 'customerManageAction_getCustomer.action',
			params : "cusid=" + cusid,
			type : "json",
			callback : function(data) {
				$("#updateCusid").val(data.cusid);
    			$("#updateCusname").val(data.cusname);
    			$("#updateIdcard").val(data.idcard);
    			$("#updateCusphone").val(data.cusphone);
    			$("#updateBalance").val(data.balance);
			}
		}
	);
}

function showInfo(msg) {
	$("#div_info").text(msg);
	$("#modal_info").modal('show');
}