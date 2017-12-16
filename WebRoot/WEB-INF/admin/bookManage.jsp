<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
<meta charset="UTF-8">
<title>租车管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/jQuery/jquery-3.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap-dropdown.min.js"></script>

<script src="${pageContext.request.contextPath}/ajax-lib/ajaxutils.js"></script>
<script src="${pageContext.request.contextPath}/js/adminUpdateInfo.js"></script>
<script src="${pageContext.request.contextPath}/js/adminUpdatePwd.js"></script>



<script src="${pageContext.request.contextPath}/js/addBook.js"></script>

<script src="${pageContext.request.contextPath}/js/updateBook.js"></script>
<script src="${pageContext.request.contextPath}/js/deleteBook.js"></script>
<script src="${pageContext.request.contextPath}/js/getBookInfo.js"></script>
<script src="${pageContext.request.contextPath}/js/addBookNum.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jQuery/ajaxfileupload.js"></script>
<script src="${pageContext.request.contextPath}/js/ajax_upload.js"></script>
<script src="${pageContext.request.contextPath}/js/batchAddBook.js"></script>
<script src="${pageContext.request.contextPath}/js/exportBook.js"></script>
</head>



<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


<body class="bootstrap-admin-with-small-navbar">
	<nav
		class="navbar navbar-inverse navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small"
		role="navigation">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="collapse navbar-collapse main-navbar-collapse">
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/pages/admin/admin.jsp"><strong>欢迎使用租车管理后台</strong></a>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-hover="dropdown"> <i
								class="glyphicon glyphicon-user"></i> 欢迎您， <s:property
									value="#session.admin.aid" /> <i class="caret"></i></a>

							<ul class="dropdown-menu">
								<li><a href="#updateinfo" data-toggle="modal">个人资料</a></li>
								<li role="presentation" class="divider"></li>
								<li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
								<li role="presentation" class="divider"></li>
								<li><a
									href="${pageContext.request.contextPath}/adminLoginAction_logout.action">退出</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</nav>

	<div class="container">
		<!-- left, vertical navbar & content -->
		<div class="row">
			<!-- left, vertical navbar -->
			<div class="col-md-2 bootstrap-admin-col-left">
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li class="active"><a
						href="${pageContext.request.contextPath}/pages/admin/tradeManageAction_findTradeByPage.action"><i
							class="glyphicon glyphicon-chevron-right"></i> 租车管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/pages/admin/bookTypeManageAction_findBookTypeByPage.action"><i
							class="glyphicon glyphicon-chevron-right"></i> 车辆管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/pages/admin/borrowManageAction_findBorrowInfoByPage.action"><i
							class="glyphicon glyphicon-chevron-right"></i> 用户管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/pages/admin/backManageAction_findBackInfoByPage.action"><i
							class="glyphicon glyphicon-chevron-right"></i> 图书归还</a></li>

					<li><a
						href="${pageContext.request.contextPath}/pages/admin/borrowSearchAction_findBackInfoByPage.action"><i
							class="glyphicon glyphicon-chevron-right"></i> 借阅查询</a></li>
					<li><a
						href="${pageContext.request.contextPath}/pages/admin/forfeitManageAction_findForfeitInfoByPage.action"><i
							class="glyphicon glyphicon-chevron-right"></i> 逾期处理</a></li>
					<s:if test="#session.admin.authorization.superSet==1">
						<!-- 对超级管理员和普通管理员进行权限区分 -->
						<li><a
							href="${pageContext.request.contextPath}/pages/admin/adminManageAction_findAdminByPage.action"><i
								class="glyphicon glyphicon-chevron-right"></i> 管理员管理</a></li>
					</s:if>
					<li><a
						href="${pageContext.request.contextPath}/pages/admin/readerManageAction_findReaderByPage.action"><i
							class="glyphicon glyphicon-chevron-right"></i> 读者管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/readerTypeManageAction_getAllReaderType.action"><i
							class="glyphicon glyphicon-chevron-right"></i> 系统设置</a></li>
				</ul>
			</div>

			<!-- content -->
			<div class="col-md-10">







				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default bootstrap-admin-no-table-panel">
							<div class="panel-heading">
								<div class="text-muted bootstrap-admin-box-title">查询</div>
							</div>
							<div
								class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
								<form class="form-horizontal"
									action="${pageContext.request.contextPath}/pages/admin/tradeManageAction_getTrade.action"
									method="post">
									<div class="col-lg-5 form-group">
										<label class="col-lg-4 control-label" for="query_bno">订单编号</label>
										<div class="col-lg-8">
											<input class="form-control" id="id" name="id" type="text"
												value=""> <label class="control-label"
												for="query_bno" style="display: none;"></label>
										</div>
									</div>

									<div class="col-lg-5 form-group">
										<label class="col-lg-4 control-label" for="query_bname">交易金额</label>
										<div class="col-lg-8">
											<input class="form-control" id="money" name="money"
												type="text" value=""> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>

									<div class="col-lg-5 form-group">
										<label class="col-lg-4 control-label" for="query_bname">开始时间</label>
										<div class="col-lg-8">
											<input class="form-control" id="startDate" name="startDate"
												type="text" value=""> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>

									<div class="col-lg-5 form-group">
										<label class="col-lg-4 control-label" for="query_bname">结束时间</label>
										<div class="col-lg-8">
											<input class="form-control" id="endDate" name="endDate"
												type="text" value=""> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>

									<div class="col-lg-5 form-group">
										<label class="col-lg-4 control-label" for="query_bname">顾客</label>
										<div class="col-lg-8">
											<input class="form-control" id="cusid" name="cusid"
												type="text" value=""> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>

									<div class="col-lg-5 form-group">
										<label class="col-lg-4 control-label" for="query_bname">车辆</label>
										<div class="col-lg-8">
											<input class="form-control" id="cid" name="cid" type="text"
												value=""> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>

									<div class="col-lg-5 form-group">
										<label class="col-lg-4 control-label" for="query_bname">状态</label>
										<div class="col-lg-8">
											<input class="form-control" id="state" name="state"
												type="text" value=""> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
									<div class="col-lg-2 form-group">
										<button type="submit" class="btn btn-primary" id="btn_query"
											onclick="query()">查询</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-12">
						<table id="data_list" class="table table-hover table-bordered"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>订单编号</th>
									<th>交易金额</th>
									<th>开始日期</th>
									<th>结束日期</th>
									<th>顾客</th>
									<th>车辆</th>
									<th>状态</th>
									<th>操作</th>

								</tr>
							</thead>


							<!---在此插入信息-->
							<s:if test="#request.pb.beanList!=null">
								<s:iterator value="#request.pb.beanList" var="trade">
									<tbody>
										<td><s:property value="#trade.id" /></td>
										<td><s:property value="#trade.money" /></td>
										<td><s:property value="#trade.startdate" /></td>
										<td><s:property value="#trade.enddate" /></td>
										<td><s:property value="#trade.customer.cusid" /></td>
										<td><s:property value="#trade.car.cid" /></td>
										<td><s:property value="#trade.state" /></td>
										<td>
											<button type="button" class="btn btn-info btn-xs"
												data-toggle="modal" data-target="#findModal"
												onclick="getBookInfo(<s:property value="#trade.id"/>)">查看</button>
											<button type="button" class="btn btn-warning btn-xs"
												data-toggle="modal" data-target="#updateModal"
												id="btn_update"
												onclick="updateBook(<s:property value="#trade.id"/>)">修改</button>
											<button type="button" class="btn btn-danger btn-xs"
												onclick="deleteBook(<s:property value="#trade.id"/>)">删除</button>
										</td>
									</tbody>
								</s:iterator>
							</s:if>
							<s:else>
								<tbody>
									<td>暂无数据</td>
									<td>暂无数据</td>
									<td>暂无数据</td>
									<td>暂无数据</td>
									<td>暂无数据</td>
									<td>暂无数据</td>
									<td>暂无数据</td>
									<td>暂无数据</td>
								</tbody>
							</s:else>

						</table>


						<div id="splitBarDiv" style="float: right">
							<jsp:include page="/pages/split_page_plugin_bars.jsp" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--------------------------------------查看的模糊框------------------------>
	<form class="form-horizontal">
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="findModal" tabindex="-1" role="dialog"
			aria-labelledby="findModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="findModalLabel">查看租车信息</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">订单编号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="findId"
									readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">交易金额</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="findMoney"
									readonly="readonly">

							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">开始日期</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="findStart"
									readonly="readonly">

							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">结束日期</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="findEnd"
									readonly="readonly">

							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">顾客</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="findCustomer"
									readonly="readonly">

							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">车辆</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="findCar"
									readonly="readonly">

							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">状态</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="findState"
									readonly="readonly">

							</div>
						</div>


						<!---------------------表单-------------------->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</form>
	<!--------------------------------------查看的模糊框------------------------>


	<!-- 修改模态框（Modal） -->
	<!-------------------------------------------------------------->

	<!-- 修改模态框（Modal） -->
	<form class="form-horizontal">
		<!--保证样式水平不混乱-->
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
			aria-labelledby="updateModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="updateModalLabel">修改租车信息</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">订单编号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateId"
									readonly="readonly">

							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">交易金额</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateMoney">

							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">开始日期</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateStart" 
									readonly="readonly">

							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">结束日期</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateEnd">

							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">顾客</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateCustomer">

							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">车辆</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateCar">

							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">状态</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateState">

							</div>
						</div>


						<!---------------------表单-------------------->

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="updateBook">
							修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</form>
	<!-------------------------------------------------------------->










	<!------------------------------修改密码模糊框-------------------------------->

	<form class="form-horizontal">
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="updatepwd" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改密码</h4>
					</div>

					<div class="modal-body">

						<!--正文-->
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">原密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="oldPwd"
									placeholder="请输入原密码"> <label class="control-label"
									for="oldPwd" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">新密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="newPwd"
									placeholder="请输入新密码"> <label class="control-label"
									for="newPwd" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">确认密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="confirmPwd"
									placeholder="请输入确认密码"> <label class="control-label"
									for="confirmPwd" style="display: none;"></label>
							</div>
						</div>
						<!--正文-->


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="update_adminPwd">
							修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</form>
	<!-------------------------------------------------------------->









	<!-------------------------个人资料模糊框------------------------------------->

	<form class="form-horizontal">
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="updateinfo" tabindex="-1" role="dialog"
			aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="ModalLabel">个人资料</h4>
					</div>

					<div class="modal-body">

						<!--正文-->
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">用户名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="username"
									value='<s:property value="#session.admin.aid"/>'>
								<label class="control-label" for="username"
									style="display: none;"></label>
							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">真实姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="name"
									placeholder="请输入您的真实姓名"
									value='<s:property value="#session.admin.aid"/>'> <label
									class="control-label" for="name" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">联系号码</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="phone"
									placeholder="请输入您的联系号码"
									value='<s:property value="#session.admin.phone"/>'> <label
									class="control-label" for="phone" style="display: none;"></label>

							</div>
						</div>

						<!--正文-->


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary"
							id="admin_updateInfo">修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</form>
	<!-------------------------------------------------------------->




	<div class="modal fade" id="modal_info" tabindex="-1" role="dialog"
		aria-labelledby="addModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="infoModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12" id="div_info"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="btn_info_close"
						data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>







</body>
</html>
