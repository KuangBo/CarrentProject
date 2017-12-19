<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.carrent.pojo.*"%>
<%@ page import="cn.carrent.util.*"%>
<%@ page import="cn.carrent.factory.*"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String indexUrl = basePath + "index.jsp";
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
  	String carid = request.getParameter("carid");
 	String start = request.getParameter("startTime");
 	String end = request.getParameter("endTime");
 	//String cusid = (String)session.getAttribute("cusid");
 	String cusid = request.getParameter("uesrid");
 	String tradeId = ID.getId(9);
 	Trade vo = new Trade();
 	//在车俩的服务层增加根据车的ID查询车辆信息,返回一个Car对象
 	Car car = ServiceFactory.getICarServiceInstance().findById(Integer.parseInt(carid));
 	//在顾客服务层增加根据顾客ID查询顾客信息，返回一个Customer对象
 	Customer customer = ServiceFactory.getICustomerServiceInstance().findById(Integer.parseInt(cusid));
 	vo.setId(Integer.parseInt(tradeId));
 	vo.setCid(Integer.parseInt(carid));
 	vo.setCusid(Integer.parseInt(cusid));
 	vo.setCar(car);
 	vo.setCustomer(customer);
 	vo.setState(true);
 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 	Date startdate = null;
 	Date enddate = null;
 	try{
 		startdate = sdf.parse(start);
		enddate = sdf.parse(end);
	}catch(Exception e){}
 	vo.setStartdate(new java.sql.Date(startdate.getTime()));
 	vo.setEnddate(new java.sql.Date(enddate.getTime()));
 	//计算日期差值
 	Calendar c = Calendar.getInstance();
	c.setTime(startdate);
	long t1 = c.getTimeInMillis();
	Calendar d = Calendar.getInstance();
	d.setTime(enddate);
	long t2 = d.getTimeInMillis();
	long day = (t2-t1)/(1000*60*60*24);
	vo.setMoney(car.getBaseprice() + car.getCarrent() * (int)day);
	System.out.println("id="+tradeId);
	System.out.println("carid="+carid);
	System.out.println("cusid="+cusid);
	System.out.println("startdate="+startdate);
	System.out.println("enddate="+enddate);
	System.out.println("money="+vo.getMoney());
	System.out.println("state="+vo.getState());
 	if(ServiceFactory.getITradeServiceInstance().insert(vo)){
 %>
 		<script type="text/javascript">
 			alert("租车成功！");
 			window.location = "<%=indexUrl%>";
 		</script>
 <%
 	}
   %>
  </body>
</html>