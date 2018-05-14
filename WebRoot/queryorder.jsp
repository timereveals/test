<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询订单</title>

	<link rel="stylesheet" href="css/usercenter.css" />	
  </head>
  
  <body>
    <!-- 汽车票订单信息 -->
<div class="title_queryorder">汽车票订单<span></span></div>
<div class="line-2"></div>
<div class="theCarPage">
	<ul class="theCarPage-ul1">
	    <li>
	    	<input name="_keyWordValue" type="text" value="" /> 
	    	<span class="orderSearch">订单搜索</span>
	    </li>
	    <li id="saixuan"><a href="javascript:void(0)"> <span id="animate"></span></a></li>
	</ul>
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
	
    <form class="weigo" style="clear: both">
	    <ul class="theCarPage-ul5">
	        <li>
				<ul>
	                <li>
	                    <span>2018-04-13</span>
	                    <span class="goPlace">&#37325;&#24198;&#21271;&#31449;&#21335;&#24191;&#22330;&#27773;&#36710;&#31449;</span>
	                    <span>￥60.00</span>
	                    <span style='width:auto;margin-left: 20px;'>1</span>
	                    <span style='float: right;margin-top: 3px;margin-right: 35px;'> </span>
	                </li>
	                <li>
	                    <span>19&#58;30</span>
	                    <span class="atPlace">&#21335;&#20805;</span>
	                    <span></span>
	                </li>
	                <li>
	                    <span style="width:120px;" >
	                   	<span title="18223118970" style="width: 43px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">18223118970</span>
						<font class="ny4a" style="background: rgb(44,192,243); border-radius: 5px;color:white">全 </font>
	                   	</span>
	                   	<span style="width:130px; margin-top: 5px;">500&#42;&#42;&#42;&#42;&#42;&#42;8763</span>
	                   	<span style="width: 77px;margin-right: 35px;text-align: right;">座位号:6</span>
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
	            <label>￥60.00</label>
	            <label></label>
	        </li>
	        <li>
	        	<!-- 查状态表 -->
	            <label>&#24050;&#25903;&#20184;</label>
	        </li>
	        <li style='width:90px;margin-left:2px;'>
		         <label>
		           		<a href="javascript:void(0)" class="ticket-search pay ticket_search1"  style='color:white!important; '>再次购买</a>
		         </label>
	        	<label>
					<a href="pcOrderView?orderId=18041300000013507465" style=''>详情</a>
				</label>
	        </li>
	    </ul>
    </form>

</div>

</div> 
  </body>
</html>
