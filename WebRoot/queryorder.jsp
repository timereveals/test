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

	<link rel="stylesheet" href="css/queryorder.css" />
  </head>
  <script>
          jQuery(document).ready(function(){
              //显示时间，以后应用于自动定时器做某一件事
              jQuery("div[id^=auto_order_cancel]").each(function(index, element) {
                  var val=jQuery(this).attr("mark");
                  var status=jQuery(this).attr("status");
                  timeCount(val,status,"1");
              });
          });
          function timeCount(remain_id,status){
              function _fresh(){
                  var nowDate = new Date();//当前时间
                  var id=jQuery('#'+remain_id).attr("order_id");   //当前订单的id

                  var addTime=new Date(jQuery('#'+remain_id).attr('addTime'));//下单开始时间
                  var auto_order_cancel=jQuery('#'+remain_id).attr('auto_order_cancel');//订单支付有效时长
                  var auto_totalS=parseInt(auto_order_cancel*60*60);
                  var ad_totalS  = parseInt((addTime.getTime()/1000)+auto_totalS);  ///下单总秒数
                  var totalS   = parseInt(ad_totalS-(nowDate.getTime()/ 1000));///支付时长

                  if(status == 10){
                      if(totalS>0){
                          var _hour   = parseInt((totalS / 3600) % 24);
                          var _minute = parseInt((totalS / 60) % 60);
                          var _second = parseInt(totalS % 60);

                          jQuery('#status_'+remain_id).html('剩余'+_hour+'时'+_minute+'分'+_second+'秒');
                          jQuery('#ico_'+remain_id).show();

                      }else{//支付超时
                          jQuery('#status_'+remain_id).html('');
                          jQuery('#ico_'+remain_id).hide();
                          clearInterval(sh);
                          jQuery.ajax({
                              type:'POST',
                              url:"http://取消订单的路径",
                              data:{"id":id},
                              success:function(data){
                                  window.location.href="http://localhost:8080/buyer/order.htm";
                              }
                          });
                      }
                  }

              }
              _fresh();
              var sh = setInterval(_fresh,1000);
          }
      </script>
      <style>

      </style>
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
	<!-- status=10 为订单为已下单未支付  addtime:下单时间  auto_order_cancel=24 自动取消时间  -->
      <div class="count_time" _val="85542"
           id="auto_order_cancel" mark="auto_order_cancel"
           order_id="420" status="10" addtime="02/26/2018 08:34:49"
           auto_order_cancel="24">
          <span class="time_icon" id="ico_auto_order_cancel"></span><i id="status_auto_order_cancel" style="font-style: normal;"></i>
      </div>
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
