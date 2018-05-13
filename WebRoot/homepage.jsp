<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'homepage.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
	<link rel="stylesheet" type="text/css" href="awesome/css/font-awesome.min.css" >
	<link rel="stylesheet" type="text/css" href="css/homepage.css">
	<script language="javascript" type="text/javascript" src="js/jquery.min.js"></script>
	<script language="javascript" type="text/javascript" src="js/homepage.js"></script>
	<META content=ie=7 http-equiv=x-ua-compatible>
  </head>
  
  <body>
    <div class="container">
		<div class="trent-slider">
			<div class="t-slide current-t-slide"><img src="images/1.jpg" alt="" /></div>
			<div class="t-slide"><img src="images/2.jpg" alt="" /></div>
			<div class="t-slide"><img src="images/3.jpg" alt="" /></div>
			<div class="t-slide"><img src="images/4.jpg" alt="" /></div>
			<div class="t-slider-controls">
				<div class="arrow right-arrow">
					<div class="arrow-container">
						<div class="arrow-icon"><i class="fa fa-chevron-right" aria-hidden="true"></i></div>
					</div>
				</div>
				<div class="arrow left-arrow">
					<div class="arrow-container">
						<div class="arrow-icon"><i class="fa fa-chevron-left" aria-hidden="true"></i></div>
					</div>
				</div>
				<div class="t-load-bar">
					<div class="inner-load-bar"></div>
				</div>
				<div class="t-dots-container">
					<div class="t-slide-dots-wrap">
						<div class="t-slide-dots">

						</div>
					</div>
				</div>
			</div>
		</div>
		</div>		

	

  </body>
</html>
