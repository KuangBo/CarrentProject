<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.carrent.pojo.*"%>
<%@ page import="cn.carrent.util.*"%>
<%@ page import="cn.carrent.factory.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String personUrl = basePath + "personal.jsp";
String indexUrl = basePath + "index.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>Car Rental An Auto mobile Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
<!-- for-mobile-apps -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); }
		function carRental(){
			var a=document.getElementById("carRental1");
			var b=document.getElementById("carRental2");
			a.style.display="none";
			b.style.display="block";
		}
			function carRental1(){
			var a=document.getElementById("carRental3");
			var b=document.getElementById("carRental4");
			a.style.display="none";
			b.style.display="block";
		}
		function carRental2(){
			var a=document.getElementById("carRental5");
			var b=document.getElementById("carRental6");
			a.style.display="none";
			b.style.display="block";
		}
		function carRental3(){
			var a=document.getElementById("carRental7");
			var b=document.getElementById("carRental8");
			a.style.display="none";
			b.style.display="block";
		}
		function carRental4(){
			var a=document.getElementById("carRental9");
			var b=document.getElementById("carRental10");
			a.style.display="none";
			b.style.display="block";
		}
		function carRental5(){
			var a=document.getElementById("carRental1");
			var b=document.getElementById("carRental2");
			a.style.display="none";
			b.style.display="block";
		}


</script>

<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/galleryeffect.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/jquery.flipster.css">
		<link rel='stylesheet' href='css/dscountdown.css' type='text/css' media='all' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Press+Start+2P" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Faster+One" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
<style type="text/css">
	#home{
		a:link{
			color:black;
		}
		a:visited{
			color:black;
	}
	}
</style>
</head>
<body>
<%
    	request.setCharacterEncoding("UTF-8");
%>
<!-- banner -->
<div class="banner-w3ls" id="home">
<!-- header -->
<div class="header-w3l-agile">
		<div class="header_left">
			<ul>
				<li><a href="mailto:info@example.com"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>example@qq.com</a></li>
				<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>+17864196666</li>
			</ul>
		</div>
		<div class="header_right">
		      <div class="w3ls-social-icons">
<%
	String cusname = null;
	if(session.getAttribute("cusid") != null) {
		int cusid = (Integer)session.getAttribute("cusid");
		Customer cus = ServiceFactory.getICustomerServiceInstance().findByCusId(cusid);
		cusname = cus.getCusname();
	}
	if(cusname != null){
%>
	<a style="color: white;">欢迎您，<%=cusname %></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a style="color: white;" href="<%=indexUrl%>">退出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<!-- <a style="color: white;" href="personal.jsp?username=<%=cusname%>">个人信息</a> -->
<%
	} else {
 %>
	<a style="color: white;" href="Register_login/Register.jsp">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a style="color: white;" href="Register_login/login_in.jsp">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
	}
 %>
		      </div>

		</div>
		<div class="clearfix"></div>
</div>
<!-- //header -->
	<div class="container">
		<div class="header-nav">
			<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<h1><a  ><span class="logo-c">C</span><i class="fa fa-car" aria-hidden="true"></i>Rental</a><p class="sub-cap">Drive to Any where</p></h1>
					</div>
					<!-- navbar-header -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
						<ul class="nav navbar-nav navbar-right" >
							<li ><a href="index.html" class="hvr-underline-from-center active" style="a:link{color:black;}">Home</a></li>
							<li><a href="#about" class="hvr-underline-from-center scroll">About Us</a></li>
							<li><a href="#service" class="hvr-underline-from-center scroll">Deals</a></li>
							<li><a href="#team" class="hvr-underline-from-center scroll">Team</a></li>
							<li><a href="#gallery" class="hvr-underline-from-center scroll">Latest Cars</a></li>
							<!--<li><a href="#contact" class="hvr-underline-from-center scroll">Contact Us</a></li>-->
						</ul>
					</div>
					<div class="clearfix"> </div>
				</nav>

		</div>
		<div class="clearfix"></div>
		<h2>New car</h2>
		<h3>We are ready to launch our New Car</h3>
			<!--timer-->
						<div class="agileits-timer">
							<div class="main-title">
						     <div class="demo2"></div>
						</div>
						</div>

						<!--//timer-->
						<div class="callbacks_container">
						<ul class="rslides" id="slider3">
							<li>
								<div class="w3l_banner_info">
									 <h4>Find Best Rental Car</h4>

								</div>
							</li>
							<li>
								<div class="w3l_banner_info">
									<h4>A Reliable way to travel!</h4>

								</div>
							</li>
							<li>
								<div class="w3l_banner_info">
									 <h4>Save time when you arrive!</h4>


								</div>
							</li>
							<li>
								<div class="w3l_banner_info">
									<h4>Rent for a month. Save $70!</h4>

								</div>
							</li>
						</ul>
					</div>
				</div>


	</div>
<!-- //banner -->
<!-- bootstrap-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<section>
					<div class="modal-body">
					       <h3 class="agileinfo_sign">BEFRIEND</h3>
						<img src="images/g1.jpg" alt=" " class="img-responsive" />
						<p>Ut enim ad minima veniam, quis nostrum
							exercitationem ullam corporis suscipit laboriosam,
							nisi ut aliquid ex ea commodi consequatur.
							<i>" Quis autem vel eum iure reprehenderit qui in ea voluptate velit .</i></p>
					</div>
				</section>
			</div>
		</div>
	</div>
<!-- //bootstrap-pop-up -->
<!-- /banner-bottom -->
	<div class="banner-bottom">
				<!--//screen-gallery-->
				 <div class="wthree_title_agile">
						        <h3>Most <span>Popular</span>  Cars</h3>
				</div>
						 <p class="sub_para">It’s time to drive</p>
						  <div class="inner_w3l_agile_grids">
						<div class="sreen-gallery-cursual">

						       <div id="owl-demo" class="owl-carousel">
							      <div class="item-owl">
					                		<div class="test-review">
						                	  <img src="images/s1.jpg" class="img-responsive" alt=""/>
											  <h5>$280</h5>
					                	    </div>
					                </div>
					                 <div class="item-owl">
					                	<div class="test-review">
						                	  <img src="images/s2.jpg" class="img-responsive" alt=""/>
											 <h5>$420</h5>
					                	    </div>
					                </div>
					                 <div class="item-owl">
					                	    <div class="test-review">
						                	  <img src="images/s3.jpg" class="img-responsive" alt=""/>
											  <h5>$480</h5>
					                	    </div>
					                </div>
									 <div class="item-owl">
					                	    <div class="test-review">
						                	  <img src="images/s4.jpg" class="img-responsive" alt=""/>
											  <h5>$600</h5>
					                	    </div>
					                </div>
									<div class="item-owl">
					                	    <div class="test-review">
						                	  <img src="images/s1.jpg" class="img-responsive" alt=""/>
											 <h5>$80</h5>
					                	    </div>
					                </div>
					                 <div class="item-owl">
					                		<div class="test-review">
						                	  <img src="images/s5.jpg" class="img-responsive" alt=""/>
											  <h5>$500</h5>
					                	    </div>
					                </div>
									 <div class="item-owl">
					                		<div class="test-review">
						                	  <img src="images/s3.jpg" class="img-responsive" alt=""/>
											  <h5>$500</h5>
					                	    </div>
					                </div>
					                 <div class="item-owl">
					                	<div class="test-review">
						                	  <img src="images/s4.jpg" class="img-responsive" alt=""/>
											   <h5>$600</h5>
					                	    </div>
					                </div>
					                 <div class="item-owl">
					                	    <div class="test-review">
						                	  <img src="images/s1.jpg" class="img-responsive" alt=""/>
											 <h5>$800</h5>
					                	    </div>
					                </div>
									 <div class="item-owl">
					                	    <div class="test-review">
						                	  <img src="images/s2.jpg" class="img-responsive" alt=""/>
											  <h5>$680</h5>
					                	    </div>
					                </div>
									 <div class="item-owl">
					                	    <div class="test-review">
						                	  <img src="images/s3.jpg" class="img-responsive" alt=""/>
											  <h5>$870</h5>
					                	    </div>
					                </div>
									 <div class="item-owl">
					                	    <div class="test-review">
						                	  <img src="images/s5.jpg" class="img-responsive" alt=""/>
											 <h5>$830</h5>
					                	    </div>
					                </div>
				              </div>
						<!--//screen-gallery-->
				</div>
		  </div>
 </div>
<!-- //banner-bottom -->


<!-- about -->
<div class="about" id="about">
		<div class="container">
		 <div class="wthree_title_agile two">
						        <h3>About <span>Us</span></h3>
				</div>
				<p class="sub_para two">It’s time to drive</p>
		 <div class="inner_w3l_agile_grids">
            <div class="col-md-6 about-left-w3layouts">
				<h6 class="sub">WELCOME TO OUR Rental Car</h6>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, rds which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
			</div>
			<div class="col-md-6 about-right-w3layouts">
		<iframe src=""  frameborder="0" ></iframe>


			</div>
			<div class="clearfix"></div>
		</div>
	</div>
 </div>
<!--about-section-->

<!-- about -->
<div class="services" id="service">
		<div class="container">
				 <div class="wthree_title_agile">
						        <h3> Today <span>SPECIAL</span>  DEALS </h3>
				</div>
						 <p class="sub_para">It’s time to drive</p>
						  <div class="inner_w3l_agile_grids">
				<div class="col-md-4 agileits_service_grid_btm_left">
					<div class="agileits_service_grid_btm_left1">
						<div class="agileits_service_grid_btm_left2">
							<h5>Deal 1</h5>
							<p>Per day<span>$</span>300.00</p>
							<p>Mon, Tue, Thu, Fri, Sat</p>

						</div>
						<img src="images/s3.jpg" alt=" " class="img-responsive">
					</div>
				</div>
				<div class="col-md-4 agileits_service_grid_btm_left">
					<div class="agileits_service_grid_btm_left1">
						<div class="agileits_service_grid_btm_left2">
							<h5>Deal 2</h5>
							<p>Per day<span>$</span>300.00</p>
							<p>Mon, Tue, Thu, Fri, Sat</p>
						</div>
						<img src="images/s5.jpg" alt=" " class="img-responsive">
					</div>
				</div>
				<div class="col-md-4 agileits_service_grid_btm_left">
					<div class="agileits_service_grid_btm_left1">
						<div class="agileits_service_grid_btm_left2">
						<h5>Deal 3</h5>
							<p>Per day<span>$</span>300.00</p>
							<p>Mon, Tue, Thu, Fri, Sat</p>
						</div>
						<img src="images/s1.jpg" alt=" " class="img-responsive">
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		</div>
	<!--//service-section-->
<!--//team-section-->
<div class="middile" id="team">
	<div class="container">
		<div class="wthree_title_agile two">
						        <h3>Amazing <span>Team</span></h3>
				</div>
				<p class="sub_para two">It’s time to drive</p>
				  <div class="inner_w3l_agile_grids">
		<!-- Flipster List -->
		<div class="flipster">
		  <ul>
		  	<li>
		  		<div class="about-grid-agile">
					<div class="about-head-w3">
						<h3>Ceo</h3>
					</div>
					<div class="about-bottom">
						<div class="about-bottom-image">
							<img src="images/t1.jpg" alt=" " class="img-responsive">
						</div>
						<div class="about-bottom-bottom">
								<p>Kuang Bo</p>
						<div class="agileits_social_list">
								<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>

							</div>
						</div>

					</div>
				</div>
		  	</li>
	  		<li>
	  			<div class="about-grid-agile">
					<div class="about-head-w3">
						<h3>Md</h3>
					</div>
					<div class="about-bottom">
						<div class="about-bottom-image">
							<img src="images/t2.jpg" alt=" " class="img-responsive">
						</div>
						<div class="about-bottom-bottom">
							<p>Ashley John</p>
							<div class="agileits_social_list">
								<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
							</div>
						</div>

					</div>
				</div>
	  		</li>
	  		<li>
	  			<div class="about-grid-agile">
					<div class="about-head-w3">
						<h3>Hr</h3>
					</div>
					<div class="about-bottom">
						<div class="about-bottom-image">
							<img src="images/t3.jpg" alt=" " class="img-responsive">
						</div>
						<div class="about-bottom-bottom">
								<p>Ashley Rose</p>
							<div class="agileits_social_list">
								<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
							</div>
						</div>

					</div>
				</div>
	  		</li>
	  		<li>
	  			<div class="about-grid-agile">
					<div class="about-head-w3">
						<h3>HR1</h3>
					</div>
					<div class="about-bottom">
						<div class="about-bottom-image">
							<img src="images/t1.jpg" alt=" " class="img-responsive">
						</div>
						<div class="about-bottom-bottom">
								<p>Linda Carl</p>
						<div class="agileits_social_list">
								<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>

							</div>
						</div>

					</div>
				</div>
	  			</li>
	  			<li>
	  			<div class="about-grid-agile">
					<div class="about-head-w3">
						<h3>MR1</h3>
					</div>
					<div class="about-bottom">
						<div class="about-bottom-image">
							<img src="images/t1.jpg" alt=" " class="img-responsive">
						</div>
						<div class="about-bottom-bottom">
								<p>Linda Carl</p>
						<div class="agileits_social_list">
								<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>

							</div>
						</div>

					</div>
				</div>
	  			</li>
		  </ul>
		</div>
<!-- End Flipster List -->

			</div>

	</div>
</div>
<!--//team-section-->
<!-- //gallery -->
<div class="gallery" id="gallery">
<!-- gallery -->
	<div class="container">
			<div class="wthree_title_agile">
						        <h3> Our <span>Latest</span>  Cars </h3>
				</div>
		<div class="inner_w3l_agile_grids">
			<div class="col-md-4 gal-gd wow fadeInLeft animated" data-wow-delay=".5s">
				<a href="<%=indexUrl %>#image-1" >
					<div class="nd-wrap nd-style-8">
						<img src="images/g1.jpg" class="img-responsive" alt=" " />
						<div class="nd-content">
				<div class="nd-content_inner">
					<div class="nd-content_inner1">
						<h4 class="nd-title">Car Rental</h4>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-link"></i>
						</span>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-search"></i>
						</span>

					</div>
				</div>
			</div>
			</div>
				</a>


			</div>
			<div class="col-md-4 gal-gd wow fadeInUp animated" data-wow-delay=".5s">
				<a href="<%=indexUrl %>#image-2" >
					<div class="nd-wrap nd-style-8">
						<img src="images/g2.jpg" class="img-responsive" alt=" " />
						<div class="nd-content">
				<div class="nd-content_inner">
					<div class="nd-content_inner1">
						<h4 class="nd-title">Car Rental</h4>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-link"></i>
						</span>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-search"></i>
						</span>

					</div>
				</div>
			</div>
			</div>
				</a>


			</div>
			<div class="col-md-4 gal-gd wow fadeInRight animated" data-wow-delay=".5s">
				<a href="<%=indexUrl %>#image-3" >
					<div class="nd-wrap nd-style-8">
						<img src="images/g3.jpg" class="img-responsive" alt=" " />
						<div class="nd-content">
				<div class="nd-content_inner">
					<div class="nd-content_inner1">
						<h4 class="nd-title">Car Rental</h4>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-link"></i>
						</span>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-search"></i>
						</span>

					</div>
				</div>
			</div>
			</div>
				</a>
			</div>
			<div class="col-md-4 gal-gd wow fadeInLeft animated" data-wow-delay=".5s">
				<a href="<%=indexUrl %>#image-6">
					<div class="nd-wrap nd-style-8">
						<img src="images/g6.jpg" class="img-responsive" alt=" " />
						<div class="nd-content">
				<div class="nd-content_inner">
					<div class="nd-content_inner1">
						<h4 class="nd-title">Car Rental</h4>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-link"></i>
						</span>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-search"></i>
						</span>

					</div>
				</div>
			</div>
			</div>
				</a>
			</div>
			<div class="col-md-4 gal-gd wow fadeInDown animated" data-wow-delay=".5s">
				<a href="<%=indexUrl %>#image-7">
					<div class="nd-wrap nd-style-8">
						<img src="images/g7.jpg" class="img-responsive" alt=" " />
						<div class="nd-content">
				<div class="nd-content_inner">
					<div class="nd-content_inner1">
						<h4 class="nd-title">Car Rental</h4>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-link"></i>
						</span>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-search"></i>
						</span>

					</div>
				</div>
			</div>
			</div>
				</a>
			</div>
			<div class="col-md-4 gal-gd wow fadeInRight animated" data-wow-delay=".5s">
				<a href="<%=indexUrl %>#image-8">
					<div class="nd-wrap nd-style-8">
						<img src="images/g8.jpg" class="img-responsive" alt=" " />
						<div class="nd-content">
				<div class="nd-content_inner">
					<div class="nd-content_inner1">
						<h4 class="nd-title">Car Rental</h4>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-link"></i>
						</span>
						<span class="nd-icon">
							<i class="glyphicon glyphicon-search"></i>
						</span>

					</div>
				</div>
			</div>
			</div>
				</a>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- //gallery -->
	<div class="lb-overlay" id="image-1">
		<img src="images/g1.jpg" alt="image1" />
		<div class="gal-info" id="carRental1">
			<!--<h3>Car Rental</h3>-->
			<a><input  type="button" value="Car Rental" onclick="window.location.href='personal.jsp?carid=1000'" ></a>
				<p >Ferrari is the world's leading super sports car
					 brand. Founded in 1929.Ferrari car adopts thehandmade, therefore the yield is
					  very low.The yearly capacity  is only about 4000 cars. The company’s headqu
					  arters is in modena, Italy. It was established in 1929, the founder isenzoFerrari,
					  the world famous speed racer and the epoch-making car designer.</p>
		</div>
		<div class="gal-info" id="carRental2" style="display: none;">
			<!--<h3>Car Rental</h3>-->
			<a href="personal.jsp" style="color:white;font-size: 30px;" >Confirm</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#gallery"  style="color:white;font-size: 30px;">Cancel</a>
		</div>
		<a href="<%=indexUrl %>#gallery" class="lb-close" >Close</a>
	</div>
	<div class="lb-overlay" id="image-2">
		<img src="images/g2.jpg" alt="image1" />
		<div class="gal-info" id="carRental3">
			<!--<h3>Car Rental</h3>-->
			<a><input type="button"  value="Car Rental" onclick="window.location.href='personal.jsp?carid=1001'"  ></a>
				<p>Ferrari is the world's leading super sports car
					 brand. Founded in 1929.Ferrari car adopts thehandmade, therefore the yield is
					  very low.The yearly capacity  is only about 4000 cars. The company’s headqu
					  arters is in modena, Italy. It was established in 1929, the founder isenzoFerrari,the world famous speed racer and the epoch-making car designer</p>
		</div>
		<div class="gal-info" id="carRental4" style="display: none;">
			<!--<h3>Car Rental</h3>-->
			<a href="#gallery" style="color:white;font-size: 30px;" >Confirm</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#gallery"  style="color:white;font-size: 30px;">Cancel</a>
		</div>
		<a href="<%=indexUrl %>#gallery" class="lb-close">Close</a>
	</div>
	<div class="lb-overlay" id="image-3">
		<img src="images/g3.jpg" alt="image1" />
		<div class="gal-info" id="carRental5">
			<!--<h3>Car Rental</h3>-->
			<a><input type="button" value="Car Rental" onclick="window.location.href='personal.jsp?carid=1002'"></a>
				<p>Ferrari is the world's leading super sports car
					 brand. Founded in 1929.Ferrari car adopts thehandmade, therefore the yield is
					  very low.The yearly capacity  is only about 4000 cars. The company’s headqu
					  arters is in modena, Italy. It was established in 1929, the founder isenzoFerrari,the world famous speed racer and the epoch-making car designer</p>
		</div>
		<div class="gal-info" id="carRental6" style="display: none;">
			<!--<h3>Car Rental</h3>-->
			<a href="#gallery" style="color:white;font-size: 30px;" >Confirm</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#gallery"  style="color:white;font-size: 30px;">Cancel</a>
		</div>
		<a href="<%=indexUrl %>#gallery" class="lb-close">Close</a>
	</div>
	<!--<div class="lb-overlay" id="image-4">
		<img src="images/g4.jpg" alt="image1" />
		<div class="gal-info">
			<h3>Car Rental</h3>
				<p>Neque porro quisquam est, qui dolorem ipsum
					quia dolor sit amet, consectetur, adipisci velit,
					sed quia non numquam eius modi tempora incidunt ut
					labore et dolore magnam aliquam quaerat voluptatem.</p>
		</div>
		<a href="#gallery" class="lb-close">Close</a>
	</div>
	<div class="lb-overlay" id="image-5">
		<img src="images/g5.jpg" alt="image1" />
		<div class="gal-info">
			<h3>Car Rental</h3>
				<p>Neque porro quisquam est, qui dolorem ipsum
					quia dolor sit amet, consectetur, adipisci velit,
					sed quia non numquam eius modi tempora incidunt ut
					labore et dolore magnam aliquam quaerat voluptatem.</p>
		</div>
		<a href="#gallery" class="lb-close">Close</a>
	</div>-->
	<div class="lb-overlay" id="image-6">
		<img src="images/g6.jpg" alt="image1" />
		<div class="gal-info" id="carRental7">
			<!--<h3>Car Rental</h3>-->
			<a><input type="button" value="Car Rental" onclick="window.location.href='personal.jsp?carid=2000'" ></a>
				<p>Ferrari is the world's leading super sports car
					 brand. Founded in 1929.Ferrari car adopts thehandmade, therefore the yield is
					  very low.The yearly capacity  is only about 4000 cars. The company’s headqu
					  arters is in modena, Italy. It was established in 1929, the founder isenzoFerrari,the world famous speed racer and the epoch-making car designer</p>
		</div>
		<div class="gal-info" id="carRental8" style="display: none;">
			<!--<h3>Car Rental</h3>-->
			<a href="#gallery" style="color:white;font-size: 30px;" >Confirm</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#gallery"  style="color:white;font-size: 30px;">Cancel</a>
		</div>
		<a href="<%=indexUrl %>#gallery" class="lb-close">Close</a>
	</div>
	<div class="lb-overlay" id="image-7">
		<img src="images/g7.jpg" alt="image1" />
		<div class="gal-info" id="carRental9">
			<!--<h3>Car Rental</h3>-->
			<a><input type="button" value="Car Rental" onclick="window.location.href='personal.jsp?carid=3000'"  ></a>
				<p>Ferrari is the world's leading super sports car
					 brand. Founded in 1929.Ferrari car adopts thehandmade, therefore the yield is
					  very low.The yearly capacity  is only about 4000 cars. The company’s headqu
					  arters is in modena, Italy. It was established in 1929, the founder isenzoFerrari,the world famous speed racer and the epoch-making car designer</p>
		</div>
		<div class="gal-info" id="carRental10" style="display: none;">
			<!--<h3>Car Rental</h3>-->
			<a href="#gallery" style="color:white;font-size: 30px;" >Confirm</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#gallery"  style="color:white;font-size: 30px;">Cancel</a>
		</div>
		<a href="<%=indexUrl %>#gallery" class="lb-close">Close</a>
	</div>
	<div class="lb-overlay" id="image-8">
		<img src="images/g8.jpg" alt="image1" />
		<div class="gal-info" id="carRental11">
			<!--<h3>Car Rental</h3>-->
			<a"><input type="button" value="Car Rental" onclick="window.location.href='personal.jsp?carid=3001'"  ></a>
				<p>Ferrari is the world's leading super sports car
					 brand. Founded in 1929.Ferrari car adopts thehandmade, therefore the yield is
					  very low.The yearly capacity  is only about 4000 cars. The company’s headqu
					  arters is in modena, Italy. It was established in 1929, the founder isenzoFerrari,the world famous speed racer and the epoch-making car designer</p>
		</div>
		<div class="gal-info" id="carRental12" style="display: none;">
			<!--<h3>Car Rental</h3>-->
			<a href="#gallery" style="color:white;font-size: 30px;" >Confirm</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#gallery"  style="color:white;font-size: 30px;">Cancel</a>
		</div>
		<a href="<%=indexUrl %>#gallery" class="lb-close">Close</a>
	</div>
<!-- gallery -->

	
<!-- //contact -->
	<div class="w3_agile_address">
		<div class="container">

			<div class="w3ls_footer_grid">
				<div class="col-md-4 w3ls_footer_grid_left">
					<div class="w3ls_footer_grid_leftl">
						<i class="fa fa-map-marker" aria-hidden="true"></i>
					</div>
					<div class="w3ls_footer_grid_leftr">
						<h4>Find Us On:</h4>
						<p>Changqing City</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-4 w3ls_footer_grid_left">
					<div class="w3ls_footer_grid_leftl email">
						<i class="fa fa-envelope" aria-hidden="true"></i>
					</div>
					<div class="w3ls_footer_grid_leftr ">
						<h4>Email Us On:</h4>
						<p >example@qq.com</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-4 w3ls_footer_grid_left">
					<div class="w3ls_footer_grid_leftl">
						<i class="fa fa-phone" aria-hidden="true"></i>
					</div>
					<div class="w3ls_footer_grid_leftr">
						<h4>Call Us On:</h4>
						<p>17864196666</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		</div>
<!-- footer -->
	<div class="newsletter">
		<div class="container">
			<div class="col-md-3 footer-grid">
				<h3>About us</h3>
				<p>h5 by kuangbo yangxingguo minweixin xuxiaohang <br>huliyang</p>
<div class="w3ls_newsletter_social">
				<ul class="agileits_social_list">
					<li><a  class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
					<li><a  class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
					<li><a  class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>

				</ul>
			</div>
			</div>
			<div class="col-md-2 footer-grid">
			     <h3>Need Help ?</h3>
					<ul>

						<li><a class="scroll" href="#home">Home</a></li>
						<li><a class="scroll" href="#about">About</a></li>
						<li><a class="scroll" href="#team">Team</a></li>
						<li><a class="scroll" href="#service">Deals</a></li>
						<li><a class="scroll" href="#gallery">Gallery</a></li>
					</ul>
				</div>
				<div class="col-md-4 footer-grid">
					<h3>Recently Launched</h3>

					<div class="footer-grid1">
						<div class="footer-grid1-left">
							<a ><img src="images/s3.jpg" alt=" " class="img-responsive"></a>
						</div>
						<div class="footer-grid1-right">
							<a >Lorem ipsum dolor eveniet ut molesti</a>

						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="footer-grid1">

						<div class="footer-grid1-left">
							<a ><img src="images/s1.jpg" alt=" " class="img-responsive"></a>
						</div>
						<div class="footer-grid1-right">
							<a >Lorem ipsum dolor earum rerum tenet</a>

						</div>
						<div class="clearfix"> </div>
					</div>

				</div>
				<div class="col-md-3 footer-grid">
					<h3>From Flickr</h3>
					<div class="footer-grid-instagram">
					<a ><img src="images/s3.jpg" alt=" " class="img-responsive"></a>
					</div>
					<div class="footer-grid-instagram">
					<a ><img src="images/s4.jpg" alt=" " class="img-responsive"></a>
					</div>
					<div class="footer-grid-instagram">
						<a ><img src="images/s5.jpg" alt=" " class="img-responsive"></a>
					</div>
					<div class="footer-grid-instagram">
					<a><img src="images/s1.jpg" alt=" " class="img-responsive"></a>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>

	</div>
	<div class="w3l_footer_agile">
			<p>@copyright h5kuang</p>

		</div>
<!-- //footer -->

<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!--scripts-->
<!-- Counter required files -->
		<script type="text/javascript" src="js/dscountdown.min.js"></script>
		<script src="js/demo-1.js"></script>
		<script>
			jQuery(document).ready(function($){
				$('.demo2').dsCountDown({
					endDate: new Date("December 7, 2018 23:59:00"),
					theme: 'black'
					});
			});
		</script>
	<!-- //Counter required files -->

	<!--//scripts-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<!--banner Slider starts Here-->
						<script src="js/responsiveslides.min.js"></script>
							<script>
								// You can also use "$(window).load(function() {"
								$(function () {
								  // Slideshow 4
								  $("#slider3").responsiveSlides({
									auto: true,
									pager:true,
									nav:false,
									speed: 500,
									namespace: "callbacks",
									before: function () {
									  $('.events').append("<li>before event fired.</li>");
									},
									after: function () {
									  $('.events').append("<li>after event fired.</li>");
									}
								  });

								});
							 </script>
							<script src="js/modernizr.custom.js"></script>


	<script src="js/jquery.flipster.js"></script>
<script>

	$(function(){ $(".flipster").flipster({ style: 'carousel', start: 0 }); });


</script>
<!--banner Slider starts Here-->
							 <!-- required-js-files-->
							<link href="css/owl.carousel.css" rel="stylesheet">
							    <script src="js/owl.carousel.js"></script>
							        <script>
							    $(document).ready(function() {
							      $("#owl-demo").owlCarousel({
							        items :5,
									itemsDesktop : [768,4],
									itemsDesktopSmall : [414,3],
							        lazyLoad : true,
							        autoPlay : true,
							        navigation :true,

							        navigationText :  false,
							        pagination :false,

							      });

							    });
							    </script>
								 <!--//required-js-files-->
<!-- smooth scrolling -->
	<script type="text/javascript">
		$(document).ready(function() {
		/*
			var defaults = {
			containerID: 'toTop', // fading element id
			containerHoverID: 'toTopHover', // fading element hover id
			scrollSpeed: 1200,
			easingType: 'linear'
			};
		*/
		$().UItoTop({ easingType: 'easeOutQuart' });
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- //smooth scrolling -->
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>