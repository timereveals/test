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
<style>
    .title_top{
    	width: 65%;
    	height: 60px;
    	background: rgb(30,191,245);
    	color: white;
    	font-size: 34px;
    	text-align: center;
    	line-height: 60px;
    	margin-left: 15%;
    	margin-top: 15px;
    }
    .title{
        	width: 65%;
        	height: 40px;
        	color: rgb(53,89,118);
        	font-size: 20px;
        	border-bottom:1px dashed grey;
        	text-align: center;
        	line-height: 40px;
        	margin-left: 15%;
        	font-weight: bold;
        }
    .content{
             width: 65%;
             height: 100%;
             text-align: center;
             font-size: 18px;
             border-bottom:1px dashed grey;
             margin-left: 15%;
         }
    .bottom{
            width: 65%;
            height: 100%;
            text-align: center;
            font-size: 12px;
            border-bottom:1px dashed grey;
            margin-left: 15%;
        }

</style>
<div  >
    <div class="title_top" >
    公告信息
    </div>
    <br/>
    <div class="title" >
        ${announcement.title }
    </div>
    <div class="content">
        ${announcement.content }
    </div>
    <div class="bottom">
          ${announcement.start_time }--${announcement.end_time }
    </div>
</div>


</BODY></HTML>
