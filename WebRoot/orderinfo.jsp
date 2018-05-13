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
<link rel=stylesheet type=text/css href="css/common.css">
<link rel=stylesheet type=text/css href="css/trainbasic.css">
<link rel=stylesheet href="css/style.css">
<script language=javascript type=text/javascript src="js/ss_city.js"></script>
<script language=javascript type=text/javascript src="js/WdatePicker.js"></script>
<script language=javascript type=text/javascript src="js/jquery-1.4.2.min.js"></script>
<script language=javascript type=text/javascript src="js/valform.js"></script>
<script language=javascript type=text/javascript src="js/yudinglist.js"></script>
<META name=GENERATOR content="MSHTML 8.00.7601.18210"></HEAD>
<BODY onload="createCode();">

<%@ include file="head.jsp" %>


<!-- main -->
<DIV id=main class="section martop5">

<!-- left -->
<DIV class=aside>

<DIV class="ydhot position martop">



<DIV id=dginforesult class="yd-list yt ydlist">
<div style="font-size: 30px;font-weight: bold;" align="center">
订单信息
</div>
<br/>
<DIV style="WIDTH: 720px" class=chooseleft>


<TABLE class=sel_table border=0 cellSpacing=0 cellPadding=0 width="100%">
  <THEAD>
  <TR >
    <TH width="30%" align="right">订单号：</TH>
    <TH width="70%"><STRONG class=bluer>${order.id }</STRONG></TH>
   </THEAD>
   
   
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">下单时间：</TH>
    <TH width="70%"><STRONG class=bluer>${fn:substring(order.createtime,0, 19)}</STRONG></TH>
   </THEAD>
   
    <THEAD>
  <TR >
    <TH width="30%" align="right">班次：</TH>
    <TH width="70%"><STRONG class=bluer>${order.tickets[0].id }</STRONG></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">出发站点：</TH>
    <TH width="70%"><STRONG class=bluer>${order.tickets[0].schedule.route.leaveStation }</STRONG></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">到达站点：</TH>
    <TH width="70%"><STRONG class=bluer>${order.tickets[0].schedule.route.arriveStation }</STRONG></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">出发时间：</TH>
    <TH width="70%"><STRONG class=bluer>${order.tickets[0].schedule.leaveTime }</STRONG></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">到站时间：</TH>
    <TH width="70%"><STRONG class=bluer>${order.tickets[0].schedule.arriveTime}</STRONG></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">真实姓名：</TH>
    <TH width="70%"><STRONG class=bluer>${order.user.realName}</STRONG></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">身份证号码：</TH>
    <TH width="70%"><STRONG class=bluer>${order.user.IDNumber}</STRONG></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">手机：</TH>
    <TH width="70%"><STRONG class=bluer>${order.user.phone }</STRONG></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">购买数量：</TH>
    <TH width="70%"><STRONG class=bluer>${order.tickets.size() }</STRONG></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">单价：</TH>
    <TH width="70%"><STRONG class=bluer>￥${order.tickets[0].schedule.price }</STRONG></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">总价：</TH>
    <TH width="70%"><STRONG class=bluer>￥${order.totalPrice}</STRONG></TH>
   </THEAD>
   
    <THEAD>
  <TR >
    <TH width="30%" align="right">订单状态：</TH>
    <TH width="70%"><STRONG class=bluer>
    <c:choose>
    <c:when test="${order.status == 1}">
    已付款
    </c:when>
    <c:when test="${order.status == 2}">
    待付款
    </c:when>
    </c:choose>
    </STRONG></TH>
   </THEAD>
   
   
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">操作：</TH>
    <TH width="70%">
    <INPUT class=list-yd  value=返回 type="button" onclick="javascript:history.go(-1)"  /> 
    </TH>
   </THEAD>
   
   
   
  </TABLE>

  </DIV>
</DIV></DIV></DIV>


<%@ include file="right.jsp" %>


</BODY></HTML>
