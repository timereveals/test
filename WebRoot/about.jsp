<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0040)http://huochepiao.114piaowu.com/beijing/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>
<META content="IE=7.0000" http-equiv="X-UA-Compatible">
<TITLE>网上订票网站</TITLE>
<META content=ie=7 http-equiv=x-ua-compatible>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<link rel="stylesheet" href="css/selectpage.css" type="text/css">
<META name=GENERATOR content="MSHTML 8.00.7601.18210"></HEAD>
<BODY>

  <label class="go_city">出发城市：</label>
     <input type="text" id="selectPage" placeholder="请输入查询关键字" >

 	<script type="text/javascript" src="js/jquery-1.11.0.min.js" ></script>
     <script type="text/javascript" src="js/selectpage.js" ></script>
     <script type="text/javascript" src="js/dropmenu.js" ></script>
 </body>
 </html>

