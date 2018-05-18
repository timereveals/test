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
<link rel=stylesheet type=text/css href="css/trainbasic.css">
<link rel=stylesheet href="css/style.css">
<link rel="stylesheet" href="css/hotroad.css" />
</head>
<BODY>
<%@ include file="head.jsp" %>
	<div  class="hotroad" style="width: 900px;height: 342px;overflow: hidden;">
		<div class="ticket-tittle" style="border-bottom: 1px solid #66ccff;overflow: hidden;">
			<h2 class="fl fyfy">热门线路</h2>
			<span class="fr more"><a href="userMethod!schedule"  style="line-height:60px;">更多 >></a></span>
		</div>

			<div class="changeContent">
				<div class="newgouccici" style="padding-bottom: 20px;height: 231px;">
					<ul>
					    <% int num = 0; %>
					    <c:forEach items="${schedules}" var="bean">
					    <% num = num + 1; %>
					    <c:if test="num == 7">
					    break;
					    </c:if>
						<li>
							<a href="javascript:void(0)" class="ticket-list1 ticket-search" >
								<div>
									<p style="text-align: center;font-size: 16px;padding-top: 10px;padding-bottom: 10px;">${bean.leavestationName}-${bean.arrivestationName}</p>
									<p class="btnyupiaocx">
										<span>余票查询</span>
									</p>
								</div>
							</a>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>

		</div>
	</div>


</BODY></HTML>
