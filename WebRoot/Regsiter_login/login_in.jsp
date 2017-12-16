<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String loginPath = basePath + "Register_login/login_do.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>Login</title>
<script type="application/x-javascript">addEventListener("load", function() {
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
	<h1>Login in</h1>
	<div class="login-form">
		<div class="close"></div>
		<div class="head-info">
			<label class="lbl-1"> </label> <label class="lbl-2"> </label> <label
				class="lbl-3"> </label>
		</div>
		<div class="clear"></div>
		<div class="avtar">
			<img src="images/avtar.png" />
		</div>
		<form action="<%=loginPath%>" method="post">
			<input type="text" class="text" name="userid" value="Userid"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Userid';}">
			<div class="key">
				<input type="password" name="password" value="Password"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Password';}">
			</div>
			<div class="signin">
				<!--<a href="<%=basePath%>index.jsp">-->
				<input type="submit" value="Login" id="a1">
				<!--</a>-->
				<a href="<%=basePath%>Register_login/Register.jsp"><input
					type="submit" value="Register"></a>
			</div>
		</form>
	</div>
	<div class="copy-rights">
		<!--<p>Copyright &copy; 2015.Company name All rights reserved.More Templates </p>-->
	</div>

</body>
</html>