<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.carrent.pojo.*"%>
<%@ page import="cn.carrent.util.*"%>
<%@ page import="cn.carrent.factory.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String indexUrl = basePath + "index.jsp";
String loginUrl = basePath + "Register_login/login_do.jsp";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

</head>

<body>
	<%
    	request.setCharacterEncoding("UTF-8");
     %>
	<%
     	String url = null;
     	int user = Integer.parseInt(request.getParameter("userid"));
     	session.setAttribute("cusid", user);
     	String password = request.getParameter("password");
     	Customer vo = new Customer();
     	vo.setCusid(user);
     	vo.setPassword(MD5Util.getMD5(password));
     	if(ServiceFactory.getICustomerServiceInstance().login(vo)){
     		url = indexUrl;
     	} else {
     		url = loginUrl;
     	}
      %>
	<script type="text/javascript">
		window.location = "<%=url%>";
	</script>
</body>
</html>
