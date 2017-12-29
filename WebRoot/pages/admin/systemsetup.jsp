<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

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
						href="${pageContext.request.contextPath}/pages/admin/admin.jsp"><strong>欢迎使用租车管理系统</strong></a>
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
								<!-- href="#identifier"  来指定要切换的特定的模态框（带有 id="identifier"）。-->
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
					<li><a
						href="${pageContext.request.contextPath}/pages/admin/tradeManageAction_findTradeByPage.action"><i
							class="glyphicon glyphicon-chevron-right"></i> 订单管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/pages/admin/carManageAction_findCarByPage.action"><i
							class="glyphicon glyphicon-chevron-right"></i> 车辆管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/pages/admin/customerManageAction_findCustomerByPage.action"><i
							class="glyphicon glyphicon-chevron-right"></i> 用户管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/pages/admin/systemsetup.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 系统设置</a></li>
				</ul>
			</div>

		<!-- content -->
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">SSH框架</div>
						</div>
						<div class="bootstrap-admin-panel-content">
							<ul>
								<li>SSH是Struts+Spring+Hibernate的一个集成框架。</li>
								<li>集成SSH框架的系统从职责上分为四层：表示层、业务逻辑层、数据持久层和域模块层，可复用性好、维护方便的Web应用程序。使用Struts作为系统的整体基础架构，在Struts框架的模型部分，控制业务跳转，利用Hibernate框架对持久层提供支持，Spring做管理，管理Struts和Hibernate。</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">BootStrap框架 && JQuery框架</div>
						</div>
						<div class="bootstrap-admin-panel-content">
							<ul>
								<li>Bootstrap框架是基于HTML5和CSS3开发的，它在JQuery的基础上进行了更为个性化的完善，形成一套自己独有的网站风格，并兼容大部分JQuery插件。</li>
								<li>对前台注册页面register.ftl进行表单验证，当符合基本验证规则后，再通过JQuery formvalidator Ajax将数据传到action中，然后与数据库中存储的数据进行对比，并将结果返回到客户端。</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">Oracle数据库</div>
						</div>
						<div class="bootstrap-admin-panel-content">
							<ul>
								<li>Oracle Database，又名Oracle RDBMS，或简称Oracle。是甲骨文公司的一款关系数据库管理系统。它是在数据库领域一直处于领先地位的产品。可以说Oracle数据库系统是目前世界上流行的关系数据库管理系统，系统可移植性好、使用方便、功能强，适用于各类大、中、小、微机环境。它是一种高效率、可靠性好的 适应高吞吐量的数据库解决方案。</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">GitHub</div>
						</div>
						<div class="bootstrap-admin-panel-content">
							<ul>
								<li>GitHub是一个面向开源及私有软件项目的托管平台，GitHub于2008年4月10日正式上线，除了git代码仓库托管及基本的 Web管理界面以外，还提供了订阅、讨论组、文本渲染、在线文件编辑器、协作图谱（报表）、代码片段分享（Gist）等功能。目前注册用户已经超过350万，托管版本数量也是非常多，其中不乏知名开源项目 Ruby on Rails、jQuery、python等。</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


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
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="update_adminPwd">修改</button>
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
									value='<s:property value="#session.admin.aid"/>'> <label
									class="control-label" for="username" style="display: none;"></label>
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
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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