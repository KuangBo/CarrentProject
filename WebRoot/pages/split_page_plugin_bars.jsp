<%@ page pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/acer.css">
<%--
	<div id="splitBarDiv" style="float: right">
		<jsp:include page="split_page_plugin_bars.jsp">
			<jsp:param name="url" value="<%=url%>"/>
			<jsp:param name="currentPage" value="<%=currentPage%>"/>
			<jsp:param name="lineSize" value="<%=lineSize%>"/>
			<jsp:param name="allRecorders" value="<%=allRecorders%>"/>
			<jsp:param name="paramName" value="参数名称"/>
			<jsp:param name="paramValue" value="参数内容"/>
		</jsp:include>
	</div>
	
	<div id="splitBarDiv" style="float: right">
		<jsp:include page="/pages/split_page_plugin_bars.jsp">
			<jsp:param name="url" value="${url}"/>
			<jsp:param name="currentPage" value="${currentPage}"/>
			<jsp:param name="lineSize" value="${lineSize}"/>
			<jsp:param name="allRecorders" value="${allRecorders}"/>
		</jsp:include>
	</div>
--%>
<%--
	<div id="splitBarDiv" style="float: right">
		<jsp:include page="/pages/split_page_plugin_bars.jsp" />
	</div>
--%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%
	String url = "pages/admin/tradeManage.jsp";
	int currentPage = 1;
	int lineSize = 5;
	int pageSize = 0;	//保存总页数
	int allRecorders = 0;	//保存总记录数
	int lsData[] = new int [] {1, 5, 10, 20, 30};
	int seed = 3;
	String paramName = request.getParameter("paramName");
	String paramValue = request.getParameter("paramValue");
%>
<%
	try {
		currentPage = (Integer) request.getAttribute("currentPage");
	} catch (Exception e) {}
	try {
		lineSize = (Integer) request.getAttribute("lineSize");
	} catch (Exception e) {}
	try {
		allRecorders = (Integer) request.getAttribute("allRecorders");
	} catch (Exception e) {}
	url = basePath + request.getAttribute("url");
%>
<%
	if(allRecorders > 0) {
		pageSize = (allRecorders + lineSize - 1) / lineSize;
	} else {
		pageSize = 1;
	}
%>
<script type="text/javascript">
	function goSplit(vcp) {
		try {
			var eleKw = document.getElementById("kw").value;
			var eleCol = document.getElementById("colSel").value;
			window.location = "<%=url%>?cp=" + vcp + "&ls=" + <%=lineSize%> + "&kw=" + eleKw + "&col=" + eleCol + "&<%=paramName%>=" + <%=paramValue%>;
		} catch (e) {
			window.location = "<%=url%>?cp=" + vcp + "&ls=" + <%=lineSize%> + "&<%=paramName%>=" + <%=paramValue%>;
		}
	}
</script>
<ul class="pagination">
<%
if(pageSize < seed * 2) {
	for(int x = 1; x <= pageSize; x ++) {
%>
		<li class="<%=currentPage == x ? "active":""%>"><a onclick="goSplit(<%=x%>)"><%=x%></a></li>
<%
	}
} else {
%>
	<li class="<%=currentPage == 1 ? "active":""%>"><a onclick="goSplit(1)">1</a></li>
<%
	if(currentPage >= seed * 2) {
%>
		<li><span>...</span></li>
<%
		int startPage = currentPage - seed;
		int endPage = currentPage + seed;
		for(int x = startPage; x <= endPage; x ++) {
			if(x < pageSize) {
%>
			<li class="<%=currentPage == x ? "active":""%>"><a onclick="goSplit(<%=x%>)"><%=x%></a></li>
<%
			}
		}
		if(currentPage + seed * 2 - 1 <= pageSize) {
%>
			<li><span>...</span></li>
<%
		}
	} else {
		for (int x = 2; x <= currentPage + seed; x ++) {
%>
			<li class="<%=currentPage == x ? "active":""%>"><a onclick="goSplit(<%=x%>)"><%=x%></a></li>
<%
		}
		if(currentPage + seed * 2 <= pageSize) {
%>
			<li><span>...</span></li>
<%
		}
	}
%>
		<li class="<%=currentPage == pageSize ? "active":""%>"><a onclick="goSplit(<%=pageSize%>)"><%=pageSize%></a></li>
<%
}
%>
</ul>