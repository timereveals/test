<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<META name=GENERATOR content="MSHTML 8.00.7601.18210">
</HEAD>
<BODY >

<%@ include file="head.jsp" %>


<!-- main -->
<DIV id=main class="section martop5">

<!-- left -->
<DIV class=aside>

<DIV class="ydhot position martop">



<DIV id=dginforesult class="yd-list yt ydlist">
<div style="font-size: 30px;font-weight: bold;" align="center">
公告信息
</div>
<br/>
<div style="font-size: 30px;font-weight: bold;" align="center">
<STRONG class=bluer>${gonggao.biaoti }</STRONG>
</div>
<div style="font-size: 20px;font-weight: bold;" align="left">
${gonggao.content }
</div>

<DIV style="WIDTH: 720px" class=chooseleft>




  </DIV>
</DIV></DIV></DIV>


<%@ include file="right.jsp" %>


</BODY></HTML>
