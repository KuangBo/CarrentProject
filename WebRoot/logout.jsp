<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String indexUrl = basePath + "index.jsp";
%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<title></title>
	<script type="text/javascript">
		window.location = "<%=indexUrl%>";
	</script>
</head>
<body>

</body>
</html>