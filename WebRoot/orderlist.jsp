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
<BODY>

<%@ include file="head.jsp" %>


<!-- main -->
<DIV id=main class="section martop5">

<!-- left -->
<DIV class=aside>

<DIV class="ydhot position martop">



<DIV id=dginforesult class="yd-list yt ydlist">
<div style="font-size: 25px;font-weight: bold;" align="center">
我的订单
</div>

<DIV style="WIDTH: 720px" class=chooseleft>
<TABLE class=sel_table border=0 cellSpacing=0 cellPadding=0 width="100%">
  <THEAD>
  <TR class=chose-tt>
    <TH width="10%">订单号</TH>
    <TH width="10%">下单时间</TH>
    <TH width="15%">班次</TH>

    <TH width="10%">订单状态</TH>
    <TH width="10%">操作</TH></TR></THEAD>
  <TBODY>
  
  <c:forEach items="${orderlist}" var="beanbean">
  <TR class=blocks begtime="00:05" ttype="D601" name="checi">
    <TD><STRONG class=bluer>${beanbean.id }</STRONG></TD>
     <TD><STRONG class=bluer>${fn:substring(beanbean.createtime,0, 10)}</STRONG></TD>
    <TD><STRONG class=bluer>${beanbean.tickets[0].schedule.bus.plateNumber }</STRONG></TD>
    <TD>
    <c:choose>
        <c:when test="${beanbean.status == 1}">
        已付款
        </c:when>
        <c:when test="${beanbean.status == 2}">
        待付款
        </c:when>
    </c:choose>
    </TD>
    <TD>
    <a href="method!order"></a>
    <INPUT class=list-yd  value=详细信息 type="button" onclick="javascript:window.location.href='userMethod!orderInfo?id=${beanbean.id }';"  />
    </TD>
  </TR>
  </c:forEach>
   

      </TBODY></TABLE></DIV>
<DIV 
style="TEXT-ALIGN: right; PADDING-BOTTOM: 5px; LINE-HEIGHT: 25px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; COLOR: #f00; PADDING-TOP: 5px">以上查询信息仅供参考，请以站点当日售票信息为准！</DIV></DIV></DIV></DIV>


<%@ include file="right.jsp" %>


</BODY></HTML>
