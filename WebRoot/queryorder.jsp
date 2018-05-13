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
    <!-- 汽车票页面信息 -->
<div class="title-text">汽车票订单<span></span></div>
<div class="check-a">
    <a href="/ecsite/control/ticketOrderList" class="allStatus active1">所有订单</a>
    <a href="/ecsite/control/ticketOrderList?orderStatus=ORDER_ORDERED" class="noPayment ">待付款</a>
</div>
<div class="line-2"></div>
<div class="theCarPage">
	<ul class="theCarPage-ul1">
	    <li>
	    	<input name="_keyWordValue" type="text" value="" /> 
	    	<span class="orderSearch">订单搜索</span>
	    </li>
	    <li id="saixuan"><a href="javascript:void(0)"> <span id="animate"></span></a></li>
	</ul>
	<form class="float-left" id="saixuan-page" >
	    <ul class="theCarPage-ul2">
	        <li>下单时间
	        	<select name="orderTime1" value="">
	        		<option value="">全部</option>
	           		<option value="week">一周内</option>
					<option value="halfMonth">半月内</option>
					<option value="month">一月内</option>
					<option value="threeMonth">三月内</option>
					<option value="before">三月前</option>
	        	</select>
	        </li>
	        <li>交易状态 <select name="orderStatus" value="">
	            <option value="">全部</option>
				<option value="ORDER_ALLREFUND">全部退款</option>
				<option value="ORDER_CANCLE">已取消</option>
				<option value="ORDER_COMPLETE">已完成</option>
				<option value="ORDER_EXCEPTION">异常</option>
				<option value="ORDER_EXECUTING">执行中</option>
				<option value="ORDER_ORDERED">未支付</option>
				<option value="ORDER_PARTREFUND">部分退款</option>
				<option value="ORDER_PAYED">已支付</option>
				<option value="ORDER_PAYING">处理中</option>
				<option value="ORDER_PENDING">待受理</option>
				<option value="ORDER_REFUNDING">退款中</option>
	        </select></li>
	    </ul>
	</form>
	<ul class="theCarPage-ul3">
	  <li>订单</li>
	  <li style="width:70px">价格</li>
	  <li style="width:90px;">数量</li>
	  <li style="width:120px;">商品操作</li>
	  <li style="width: 110px;">实付款（元）</li>
	  <li style="width: 100px;">交易状态</li>
	  <li style="width: 120px;">交易操作</li>
	</ul>
   	<!-- 订单表 -->
   	<!-- 限制为汽车票订单 -->
	<ul class="theCarPage-ul4">
	    <li class="checkbox">
	        <input type="checkbox" id="checkone1">
	        <label for="checkone1"></label>
	        <b> 2018-04-13</b>
	    </li>
	    <li>
	    	订单号&nbsp;&nbsp;&nbsp;<lable>18041300000013507465</lable>
	    </li>
	    <li style="width:225px;">
	    	<b data-status="ORDER_PAYED" data-orderid="18041300000013507465" class="canceltime" data-cancel="1523600702000" data-now="1524533518739" style="float:left;" href="/ecsite/control/cancleTicketOrder?orderId=18041300000013507465"></b>
	    </li>
	</ul>
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
	        	<!-- 现进行状态判断:当已下单或是已取消状态时直接查询锁位相关表获取相关信息..当为已付款或退票状态时可直接查询售票提交反馈记录表 -->
		        	<!-- 查售票提交反馈记录表 -->
						<ul>
			             	<!-- 用来判断保险的数量(整个li里面的代码不能回车,一回车样式就变,只好把判断语句写在这里) -->
	                    	<!-- 没有执行退票操作 -->
	                    	<li>
	                    		<span>2018-04-13</span>
	                    		<span class="goPlace">&#37325;&#24198;&#21271;&#31449;&#21335;&#24191;&#22330;&#27773;&#36710;&#31449;</span>
	                    		<span>￥60.00</span>
	                    		<span style='width:auto;margin-left: 20px;'>1</span>
	                    		<span style='float: right;margin-top: 3px;margin-right: 35px;'>
	                    		</span>
	                    	</li>
	                    	<li>
	                    		<span>19&#58;30</span>
	                    		<span class="atPlace">&#21335;&#20805;</span>
	                    		<span>
	                    			
	                    		</span>
	                    	</li>
	                    	<li> 
	                    		<span style="width:120px;" >
	                   				<span title="18223118970" style="width: 43px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">18223118970</span>
										<font class="ny4a" style="background: rgb(44,192,243); border-radius: 5px;color:white">全 </font>
	                   			</span>
	                   			<span style="width:130px; margin-top: 5px;">
	                   				500&#42;&#42;&#42;&#42;&#42;&#42;8763
	                   			</span>
	                   			<span style="width: 77px;margin-right: 35px;text-align: right;">
	                   				座位号:6
	                   			</span>
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
	        	<!-- 查orderHeader表 得出应付金额 -->
	            <label>￥60.00</label>
	            <label></label>
	           
            		<label >微信售票</label>
              
	        </li>
	        <li>
	        	<!-- 查状态表 -->
	            <label>&#24050;&#25903;&#20184;</label>
	        </li>
	        <li style='width:90px;margin-left:2px;'>
		           		<label>
		           			<a href="javascript:void(0)" class="ticket-search pay ticket_search1" 
		           				data-start="&#37325;&#24198;&#21271;&#31449;&#21335;&#24191;&#22330;&#27773;&#36710;&#31449;" 
		           				data-end="&#21335;&#20805;" 
		           				data-startcode="1001" 
		           				data-endcode="nca" style='color:white!important; '>再次购买</a>
		           		</label>	
		           		
	           
	        	<label>
					<a href="pcOrderView?orderId=18041300000013507465" style=''>详情</a>
				</label>
	        </li>
	    </ul>
    </form>
    
    </form>   	
</div>
<div class="clear"></div>
<div>
	<!-- 调分页查询 -->	
	<div class="news-more-pag">
		<div class="more-pag-det">
			<a href="javascript:void(0)"><span class="news-more-pageban"> 首页 </span></a>
			<a href="javascript:void(0)"><span class="news-more-pageban"> 上一页 </span></a>
	
			<a href="javascript:void(0)"><span class="news-more-current">1</span></a>
			<a class="auto-post" href="/ecsite/control/ticketOrderList?VIEW_INDEX=1"><span>2</span></a>
			<a class="auto-post" href="/ecsite/control/ticketOrderList?VIEW_INDEX=2"><span>3</span></a>
			<a class="auto-post" href="/ecsite/control/ticketOrderList?VIEW_INDEX=3"><span>4</span></a>
	
			<a class="auto-post" href="/ecsite/control/ticketOrderList?VIEW_INDEX=1"><span> 下一页 </span></a>
			<a class="auto-post" href="/ecsite/control/ticketOrderList?VIEW_INDEX=3"><span> 尾页 </span></a>
		</div>
		<div class="more-page">
			<div>
				转到第 
				<input type="text" maxpage="4" curindex="0" href="/ecsite/control/ticketOrderList" paramname="VIEW_INDEX" value="1">页
				<input type="button" class="more-page-go gopage" value="GO" >
				<p>
					共<span>4</span>页
				</p>
			</div>
		</div>
		<div style="clear: both;float: none;width:0px;height:0px;"></div>
	</div>
	
	<script>
	seajs.use("css/pagebar/pagebar-default.css");
	</script>
</div> 
  </body>
</html>
