<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0040)http://huochepiao.114piaowu.com/beijing/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>

<TITLE>网上订票网站</TITLE>
<META content=ie=7 http-equiv=x-ua-compatible>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<link rel=stylesheet type=text/css href="css/common.css">
<link rel=stylesheet href="css/style.css">
<link rel="stylesheet" href="css/querystation.css" />

</head>
<BODY onload="createCode();">
<%@ include file="head.jsp" %>
<div class="bg">
		<div class="title" >
			站点查询
		</div>
		<div class="station1">
			<form action="?" method="get">
				<div class="station_select">
                    <input name="cityName" id="cityName" type="text" placeholder="请输入站点名称或所在区县进行查询"/>
					<input id="submit-search" type="submit" value="查询"/>
				</div>
			</form>
		</div>
			<div class="stationinfo">
				<table class="stationtable">
					<tr>
						<th>名称</th>
						<th>所在省市县</th>
						<th>地址</th>
						<th>电话</th>
					</tr>
					<c:forEach items="${stationlist}" var="bean">
					<tr>
						<td>${bean.name}</td>
						<td>${bean.locationBrief}</td>
						<td>${bean.locationDetail}</td>
						<td>${bean.phone}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

</BODY></HTML>
