<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.carrent.pojo.*" %>
<%@ page import="cn.carrent.util.*" %>
<%@ page import="cn.carrent.factory.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String indexUrl = basePath + "index.jsp";
String loginUrl = basePath + "Register_login/login_in.jsp";
String registerUrl = basePath + "Register_login/Register.jsp";
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
     	String msg = "";
     	String url = "";
     	String cusid = ID.getId(4);
     	Customer vo = new Customer();
     	vo.setCusid(Integer.parseInt(cusid));
     	session.setAttribute("cusid", cusid);
     	vo.setIdcard(request.getParameter("idcard"));
     	vo.setCusphone(request.getParameter("phone"));
     	vo.setCusname(request.getParameter("username"));
     	vo.setPassword(MD5Util.getMD5(request.getParameter("password")));
     	if(ServiceFactory.getICustomerServiceInstance().insert(vo)){
     		msg = "注册成功！ID:" + cusid;
     		url = loginUrl;
     	} else {
     		msg = "注册失败！";
     		url = registerUrl;
     	}
      %>
 <script type="text/javascript">
 	alert("<%=msg%>");
	window.location = "<%=url%>";
</script> 
  </body>
</html>
