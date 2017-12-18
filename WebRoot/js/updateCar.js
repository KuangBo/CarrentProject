
$(function() {


	$('#updateCar').click(function() {

		var postdata = "cid=" + $.trim($("#updateCid").val()) + "&brand=" + $.trim($("#updateBrand").val()) + "&model=" + $.trim($("#updateModel").val())
		+ "&baseprice=" + $.trim($("#updateBaseprice").val()) + "&carrent=" + $.trim($("#updateCarrent").val()) + "&state=" + $.trim($("#updateState").val());
		ajax(
			{
				method : 'POST',
				url : 'carManageAction_updateCar.action',
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






function updateCar(cid) {
	ajax(
		{
			method : 'POST',
			url : 'carManageAction_getCar.action',
			params : "cid=" + cid,
			type : "json",
			callback : function(data) {
				$("#updateCid").val(data.cid);
    			$("#updateBrand").val(data.brand);
    			$("#updateModel").val(data.model);
    			$("#updateBaseprice").val(data.baseprice);
    			$("#updateCarrent").val(data.carrent);
    			$("#updateState").val(data.state);
			}
		}
	);
}

function showInfo(msg) {
	$("#div_info").text(msg);
	$("#modal_info").modal('show');
}