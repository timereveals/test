<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
 <head>
<script language="javascript" type="text/javascript" src="js/showdate.js"></script>
<link rel=stylesheet type=text/css href="css/head_common.css">
<meta content=ie=7 http-equiv=x-ua-compatible>
</head>
<body>
<div id="head">
	<div class="top">
		<p>
		<span>您好${user.name}，欢迎光临
			<c:if test="${user==null}">
				<a href="login.jsp" rel=nofollow>[登录]</a> 
				<a href="register.jsp" rel=nofollow>[免费注册]</a> 
			</c:if>
			<c:if test="${user!=null}">
			 	<a href="userMethod!logout" rel=nofollow>[退出登录]</a>
			</c:if>		
		</span>
		<c:if test="${user==null}">
				<a href="userMethod!orderList" rel=nofollow>我的订单</a>
		</c:if>
		<c:if test="${user!=null}">
			 	<a href="personal.jsp" rel=nofollow>个人中心</a> 
		</c:if>		
		<a href="manage/login.jsp" rel=nofollow>管理后台</a> 
	</div>
	
	<div class="banner">
		<div class="left">
			<a class="title-logo" href="index.jsp"><img src="images/logo.png"/></a>
			<a class="title-ykx">渝快行公路客运平台</a>
		</div>
		<div class="right">
			<p>重庆市公路客运售票网</p>
		</div>
	</div>
	<div class="nav">
		<div id="nav">
		  <a href="index.jsp"><input value="首页" type="button"/></a> 
		  <a href="userMethod!schedule"><input value="汽车票" type="button"/></a>
		  <c:if test="${user!=null}">
		        <a href="userMethod!orderList"><input value="我的订单" type="button"/></a>
		  </c:if>
		  <a href="userMethod!stationList"><input value="站点查询" type="button"/></a>
		  <a href="userMethod!hotRoad"><input value="热门路线" type="button"/></a>
		  <a href="helpcenter.jsp"><input value="帮助中心" type="button"/></a>
		</div>
	</div>
</div>
</body>
</html>

