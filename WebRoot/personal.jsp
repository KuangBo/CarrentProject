<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.carrent.pojo.*"%>
<%@ page import="cn.carrent.util.*"%>
<%@ page import="cn.carrent.factory.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String persondoUrl = basePath + "personal_do.jsp";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<title>Car Rental Form Flat Responsive Widget Template ::
	w3layouts</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style_personal.css" rel="stylesheet" type="text/css"
	media="all" />
<link
	href="//fonts.googleapis.com/css?family=Niconne&amp;subset=latin-ext"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Reem+Kufi&amp;subset=arabic"
	rel="stylesheet">
<style>/* 定义模态对话框外面的覆盖层样式 */
#modal-overlay11 {
	visibility: hidden;
	position: absolute; /* 使用绝对定位或固定定位  */
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	text-align: center;
	z-index: 1000;
	background-color: #333;
	opacity: 0.9; /* 背景半透明 */
}
/* 模态框样式 */
.modal-data11 {
	width: 300px;
	margin: 100px auto;
	background-color: #fff;
	border: 1px solid #000;
	padding: 15px;
	text-align: center;
}
</style>
<script>
	function overlay() {
		var e1 = document.getElementById('modal-overlay11');
		e1.style.visibility = (e1.style.visibility == "visible") ? "hidden" : "visible";
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String carid = request.getParameter("carid");
	%>
	<div class="video" data-vide-bg="video/daimler">
		<h1>Car Rental Form</h1>
		<!-- main -->
		<div class="main-agilerow">
			<div class="sub-w3lsright agileits-w3layouts">
				<h2>Car Rental</h2>
				<form action="<%=persondoUrl%>?carid=<%=carid%>" method="post">
					<input type="text" class="name" name="name" placeholder="Your Name"
						required=""> <input type="text" name="uesrid"
						placeholder="User Id" required=""> <input type="text"
						class="name" name="phone" placeholder="Phone Number" required="">
					<div class="clear"></div>
					<div class="form-control">
						<div class="main-row">
							<select name="startTime">
								<option value="none" selected="" disabled="">Start Time</option>
								<option value="<%=sdf.format(date)%>"><%=sdf.format(date)%></option>

							</select> <i></i>
						</div>
						<div class="form-control">
							<div class="main-row">
								<select name="endTime">
									<option value="none" selected="" disabled="">End Time</option>
									<%
										Calendar c = Calendar.getInstance();
										c.setTime(date);
										long temptime;
										for (int i = 1; i <= 9; i = i + 2) {
											temptime = c.getTimeInMillis();
											temptime += 24 * 60 * 60 * 1000 * i;
									%>
									<option value="<%=sdf.format(new Date(temptime))%>"><%=sdf.format(new Date(temptime))%></option>
									<%
										}
									%>
								</select> <i></i>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<input type="button" value="Charge" onclick="overlay()">
					<input type="submit" value="Send">
				</form>
			</div>
			<div class="clear"></div>
		</div>
		<div class="copyw3-agile">
			<p>
				© 2017 Car Rental Form. All rights reserved | Design by kuangbo
				minweixiao.....
			</p>
		</div>
	</div>
	<div id="modal-overlay11">
		<div class="modal-data11">
			<img src="images/二维码.gif" />
			<p>
				<input type="button" onclick="overlay()" value="关闭" id="a111" />
			</p>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script src="js/jquery.vide.min.js"></script>
</body>
</html>