<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询订单</title>

	<link rel="stylesheet" href="css/queryorder.css" />
  </head>

  <body>
  <%@ include file="head.jsp" %>
    <!-- 汽车票订单信息 -->
<div class="line-2"></div>
<div class="theCarPage" style="margin-left:18%;">
	<ul class="theCarPage-ul3">
	  <li>订单</li>
	  <li style="width:80px">价格</li>
	  <li style="width:80px;">数量</li>
	  <li style="width:100px;">座位号</li>
	  <li style="width: 50px;">实付款</li>
	  <li style="width: 70px;">交易状态</li>
	  <li style="width: 70px;">交易操作</li>
	</ul>
   	<!-- 订单表 -->
	<!-- 查询汽车票订单-->
<!--用于记录所有保费的总和-->
	<!-- 用于记录所有保费的数量总和 -->
	<!-- 用于记录一张票保费与票价总和 -->
	<!-- 用于定义售票类型 -->
	<!--有保费时,显示 （含保险费） -->
	<!-- 存售票提交反馈记录表id,全部退票超时时用 -->
	
    <form class="weigo" style="clear: both; ">
    <c:forEach items="${orderlist}" var="bean">
	    <ul class="theCarPage-ul5">
	        <li>
				<ul>
	                <li>
	                    <span>${fn:substring(bean.tickets[0].schedule.leaveTime,0, 10)}</span>
	                    <span class="goPlace"></span>
	                    <span>${bean.tickets[0].schedule.price}</span>
	                    <span style='width:auto;margin-left: 20px;'>1</span>
	                    <span style='float: right;margin-top: 3px;margin-right: 35px;'> </span>
	                </li>
	                <li>
	                    <span>${fn:substring(bean.tickets[0].schedule.leaveTime,11, 16)}</span>
	                    <span class="atPlace">${bean.tickets[0].schedule.bus.plateNumber}</span>
	                    <span></span>
	                </li>
	                <li>
	                    <span style="width:120px;" >
	                   	<span title="${bean.user.phone}" style="width: 43px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${bean.user.phone}</span>
						<font class="ny4a" style="background: rgb(44,192,243); border-radius: 5px;color:white">全 </font>
	                   	</span>
	                   	<span style="width:130px; margin-top: 5px;overflow: hidden;text-overflow: ellipsis;">${bean.user.IDNumber}</span>
	                   	<span style="width: 77px;margin-right: 35px;text-align: right;">座位号:${bean.tickets[0].seatNumber}</span>
	                </li>
		         </ul>
	           	
	            <div>
	            	<span>保险服务</span>
	            	<span>￥0.00</span>
	            </div>
	            <i></i>
	            <b></b>
	        </li>
	        <li>
	            <label>${bean.tickets[0].schedule.price}</label>
	            <label></label>
	        </li>
	        <li>
	        	<!-- 查状态表 -->
                <c:choose>
                    <c:when test="${bean.status == 1}">
                    <label>已支付</label>
                    </c:when>
                    <c:when test="${bean.status == 2}">
                    <label>待支付</label>
                    </c:when>
                    <c:when test="${bean.status == 0}">
                    <label>已取消</label>
                    </c:when>
                </c:choose>
	        </li>
	        <li style='width:90px;margin-left:2px;'>
		         <label>
		           		<a href="userMethod!schedule" class="ticket-search pay ticket_search1"  style='color:white!important; '>再次购买</a>
		         </label>
	        	<label>
					<a href="method!order" style=''>详情</a>
					<a href="userMethod!orderCancel?id=${bean.id}">取消</a>
				</label>
	        </li>
	    </ul>
	    </c:forEach>
    </form>

</div>

</div> 
  </body>
</html>
