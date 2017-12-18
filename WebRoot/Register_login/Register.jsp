<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String indexUrl = basePath + "index.jsp";
	String loginUrl = basePath + "Register_login/login_do.jsp";
	String registerUrl = basePath + "Register_login/Register_doo";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>Register</title>
<script type="application/x-javascript">
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<link href="css/login_style.css" rel='stylesheet' type='text/css' />
<!--webfonts-->
<!--<link href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>-->
<!--//webfonts-->
<!--<script src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>-->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
</head>
<body>
	<script>$(document).ready(function(c) {
			$('.close').on('click', function(c) {
				$('.login-form').fadeOut('slow', function(c) {
					$('.login-form').remove();
				});
			});
		});
	</script>
	<!--SIGN UP-->
	<h1>Register</h1>
	<div class="login-form">
		<div class="close"></div>
		<div class="head-info">
			<label class="lbl-1"> </label> <label class="lbl-2"> </label> <label
				class="lbl-3"> </label>
		</div>
		<div class="clear"></div>
		<!--<div class="avtar">
		<img src="images/avtar.png" />
	</div>-->
		<form action="<%=registerUrl%>" method="post">
			<input type="text" class="text" name="idcard" value="Idcard"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'idcard';}"> <input
				type="text" class="text" name="phone" value="phone"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'cusphone';}"> <input
				type="text" class="text" name="username" value="Username"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Username';}"> <br>
			<br>
			<div class="key">
				<input type="password" name="password" value="Password"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Password';}">
			</div>
			<div class="signin">
				<input type="submit" value="Submit">
			</div>
		</form>
	</div>
	<div class="copy-rights">
		<!--<p>Copyright &copy; 2015.Company name All rights reserved.More Templates  - Collect from </p>-->
	</div>

</body>
</html>