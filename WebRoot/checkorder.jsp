<%@ page language="java" import="java.util.*, dingpiao.model.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<link rel="stylesheet" href="css/orderdetailinfo.css" />
		<link rel="stylesheet" href="css/checkorder.css" />
	</head>
	<body>
        <%@ include file="head.jsp" %>
		<div class="bg" style="padding-top: 20px;">
			<div class="carpay-process">
			<span class="carpay-process-conten">1.确定预定车票车次</span> <span >2.核对支付订单</span>
		</div>
		<div class="carpay-box" style="border-bottom: none;margin-bottom: 0px;">
			<span class="carpay-tittle" style="font-size: 18px;">订单信息</span>
			<!-- 左 -->
			<div class="carpay-box-list" >
			
				<dl>
					<dt>订单号:</dt>
					<dd>
						<span>${order.id}</span>
					</dd>
				</dl>
				<dl>
					<dt>订单名称:</dt>
					<dd>
						<span>购票订单_${schedule.route.leaveStation.name}-${schedule.route.arriveStation.name}_${schedule.leaveTime}</span>
					</dd>
				</dl>
				<dl>
					<dt>订单状态:</dt>
					<dd>
						<span>
						<c:if test="${order.status == 1}">
						已支付
						</c:if>
						<c:if test="${order.status == 2}">
						待支付
						</c:if>
						</span>
					</dd>
				</dl>
				<dl>
					<dt>下单人:</dt>
					<dd>
						<span>${user.name}</span>
					</dd>
				</dl>
				<dl>
					<dt>下单时间:</dt>
					<dd>
						<span>${order.createtime}</span>
					</dd>
				</dl>
			</div>
			
						<div class="newGz87">
								<dl>
									<dt>乘车人</dt>
									<dd>
									<c:forEach items="${order.passenger}" var="passenger">
									<span class="name">${passenger.name}</span><span class="idcard">${passenger.name}</span>
										<span class="hailight">全</span>
										<span style=" margin-left: 25px;">座位号:${passenger.id}</span>
									</c:forEach>
									</dd>
								</dl>
						</div>
			<div style="display: none;">
				<input name="total" value="60.00">
			</div>
		</div>
		<!-- -->
		<div class="carpay-box" style="border-bottom: none;">
			<span class="carpay-tittle" style="font-size: 18px;">产品信息</span>
			<div class="carpay-box-list" style="width: 100%;">
			<div class="newCpxx87">
				<div class="newCpxx87-a">
					<dl>
						<dt>发车时间</dt>
						<dd>${schedule.leaveTime}</dd>
					</dl>
					<dl>
						<dt>乘车点</dt>
						<dd>${schedule.route.leaveStation.name}</dd>
					</dl>
					<dl>
						<dt>到站</dt>
						<dd>${schedule.route.arriveStation.name}</dd>
					</dl>
					<dl style="border-bottom: none;">
						<dt>车辆/班次</dt>
						<dd>${schedule.bus.plateNumber}</dd>
					</dl>
				</div>
				<div class="newCpxx87-b">下单人信息</div>
						<div class="newCpxx87-c">
							<p>用户名：<span>${user.name}</span></p>
							<p>电话：<span>${user.phone}</span></p>
						</div>
			</div>
			
			
		</div>
		
		<!-- -->
		<div class="carpay-box"  style="padding-top: 20px;border-bottom: none;">
			<span class="carpay-tittle" style="font-size: 18px;">支付信息</span>
			<!-- 左 -->
			<div class="carpay-box-list">
				<dl>
					<dt>支付金额:
						<span class="carpay-amount">￥${order.totalPrice}</span>
					</dd>
				</dl>
			</div>
		</div>
		<div style="text-align: center;">
		    <c:if test="${order.status == 2}">
                <a href="javascript:window.history.go(-1)" class="btn-submit">确认支付</a>
            </c:if>
                <a href="javascript:window.history.go(-1)" class="btn-back">返&nbsp;回</a>

		</div>
		
	</div>
 	</body>
</html>