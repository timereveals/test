<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0040)http://huochepiao.114piaowu.com/beijing/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><META content="IE=7.0000" 
http-equiv="X-UA-Compatible">
<TITLE>网上订票网站</TITLE>
<META content=ie=7 http-equiv=x-ua-compatible>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<link rel=stylesheet type=text/css href="css/common.css">
<link rel=stylesheet type=text/css href="css/trainbasic.css">
<link rel=stylesheet href="css/style.css">
<link rel="stylesheet" type="text/css"href="awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/homepage.css">
<SCRIPT language=javascript type=text/javascript src="js/jquery-1.4.2.min.js"></SCRIPT>
<script language=javascript type=text/javascript src="js/jquery.min.js" ></script>
<script language=javascript type=text/javascript src="js/index.js"></script>
<META name=GENERATOR content="MSHTML 8.00.7601.18210"></HEAD>
<BODY>

<%@ include file="head.jsp" %>


<!-- main -->
<DIV id=main class="section martop5">

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


</BODY></HTML>
