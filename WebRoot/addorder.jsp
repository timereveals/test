<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/index.css" />
        <script>
        	    var available = Math.min(3,${iAvailable});
				var num = 1;
                function add_passenger(){
					if(num>=available){
						alert("超过最大可添加数量"+available);
						return;
					}
                    document.getElementById("passenger_info").innerHTML+="<br/><div id='add"+num+"' style='margin-top:30px ;'>\
                    	<dl><dt style='width: 45px;'><span>*</span>姓名</dt>\
                    		<dd><input placeholder='乘客姓名' autocomplete='off' name='name"+num+"' class='linkName' type='text' data-rule='姓名:required;chinaname;' style='width:70px;'></dd>\
                    	</dl>\
                    	<dl><dt><span>*</span>证件号码</dt>\
                    		<dd><input placeholder='证件号码' autocomplete='off' name='idCardNo"+num+"' class='idCardNo' type='text' data-rule='证件号码:required;cerNo;' style='width:142px;'></dd>\
                    	</dl>\
                    	<dl><dt style='width: 50px;'><span>*</span>手机号</dt>\
                    		<dd><input placeholder='手机号码' autocomplete='off' name='telphone"+num+"' class='telphone' style='width: 100px;' type='text' data-rule='电话:required;phonemobil;'></dd>\
                    	</dl>\
						<dl>\
							<dd>\
							<select name='ticketType"+num+"' class='flush ticketType' style='padding-left: 5px;margin-left: 10px;'>\
							<option value='1'>全票</option>\
							<option value='2'>半票</option>\
							</select>\
							</dd>\
						</dl>\
						<dl>\
						<dd>\
							<span class='checkbox' style='height: 30px;padding-top: 5px;padding-left: 5px;margin-left: 10px;'>\
							<input name='hasInsurance"+num+"' type='checkbox' value='1' id='ertong' class='flush hasInsurance'>\
							<label for='insurance' class='insurance-label'></label>\
							<label for='insurance' class='checkbox-label-none insurance-label'>乘车保险</label>\
							</span>\
							</dd>\
						</dl>\
						<dl>\
						<dd>\
							<span class='checkbox' for='ertong' onclick='childer();' style='height: 30px;padding-top: 5px;padding-left: 5px;margin-left: 10px;'>\
							<input name='hasChild"+num+"' type='checkbox' value='1' id='ertong' class='flush hasChild'>\
							<label for='ertong' class='child-label'></label>\
							<label for='ertong' class='checkbox-label-none child-label'>免票儿童</label>\
							</span>\
							</dd>\
						</dl>\
						<a onclick='delete1("+num+")' style='cursor:pointer'>删除</a>\
                    	</div>";
                    num=num+1;
                    document.getElementById("orderForm").action="userMethod!createOrder?scheduleid=${schedule.id}&num="+num;
                }
                  function delete1(i){
                            	var divid="add"+i;
                            	var add = document.getElementById(divid);
                            	add.style.display = 'none';
                            }

                function submitOrderForm(){
                    document.getElementById("orderForm").submit();
                }
        	</script>
    </head>
    <body>
    <%@ include file="head.jsp" %>
    	<div class="bg">
	<!-- -->
	<div class="carpay-process">
		<span class="carpay-process-conten">1.确定预定车票车次</span> <span>2.核对支付订单</span>
	</div>
	<!-- -->
	<!-- title -->
	<div class="carpay-tiitle underline">
		<span>&#38271;&#36884;&#27773;&#36710;&#31449; - &#38108;&#26753;</span> <a href="javascript:void(0)" class="fr backtosearch">返回修改班次</a>
	</div>
	<!-- title end -->
	<table class="speed-table carpaytable">
		<colgroup>
			<col width="4%">
			<col width="10%">
			<col width="4%">
			<col width="4%">
			<col width="8%">
			<col width="4%">
			<col width="4%">
			<col width="4%">
		</colgroup>
		<thead>
			<tr>
				<th>车型/班次</th>
				<th>出发/到达</th>
				<th>出发时间</th>
				<th>里程</th>
				<th>票价</th>
				<th>保险/张</th>
				<th>手续费/张</th>
				<th>总价</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>&#20013;&#22411;&#20013;&#32423;</td>
				<td><span class="payicon-1">发</span>&#38271;&#36884;&#27773;&#36710;&#31449;</td>
				<td>2018-04-28</td>
				<td>82.00KM</td>
				<td>
					全票￥28.00
				</td>
				<td>￥2.00</td>
				<td>￥0.00</td> 
				<td style="color:#ff7d1a;front-size:20px;font-weight: bold;">￥ <span class="totalamount2">30.00</span></td>
			</tr>
			<tr>
				<td>504</td>
				<td><span class="payicon-1 payicon-2">到</span>&#38108;&#26753;</td>
				<td>18&#58;00
				</td>
				<td></td>
				<td>
					半票￥14.00
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<!-- -->
	<div class="carpay-tiitle">
		<span>乘车人信息</span>
		<div style="display: none;">
			<input name="price" value="28.00">
			<input name="discprice" value="14.00">
			<input name="insprice" value="2.00">
		</div>
	</div>
	<!-- -->
	<div class="passenger-tiitle" style="height:auto;">
		<span class="checkbox">
			<input id="name0" autocomplete="off" class="pname" type="checkbox" data-flag="pname0" data-info="{'linkName':'18223118970','idCardNo':'500224199510018763','telphone':'18223118970'}">
			<label for="name0"></label><label for="name0" class="checkbox-label-none">18223118970</label>
		</span>
		
	
		<span class="checkbox">
			<input id="name1" autocomplete="off" class="pname" type="checkbox" data-flag="pname1" data-info="{'linkName':'&#38472;&#38065;','idCardNo':'500224199510018763','telphone':'18223118970'}">
			<label for="name1"></label><label for="name1" class="checkbox-label-none">&#38472;&#38065;</label>
		</span>
		
	
		
	</div>
	<!-- -->
	<form id="orderForm" class="passengerform" action="userMethod!createOrder?scheduleid=${schedule.id}&num=1" method="post">
	<div class="carpay-add-info" >
		<div class="carpay-add-list" style="height: auto;position: relative;padding-bottom: 10px;" id="passenger_info">
		<!--用foreach-->
			<div id="add">
				<dl>
					<dt style="width: 45px;">
						<span>*</span>姓名
					</dt>
					<dd>
						<input placeholder="乘客姓名" autocomplete="off" name="name0" class="linkName" type="text" data-rule="姓名:required;chinaname;" style="width:70px;">
					</dd>
				</dl>
				<dl>
					<dt>
						<span>*</span>证件号码
					</dt>
					<dd>
						<input placeholder="证件号码" autocomplete="off" name="idCardNo0" class="idCardNo" type="text" data-rule="证件号码:required;cerNo;" style="width:142px;">
					</dd>
				</dl>
				<dl>
					<dt style="width: 50px;">
						<span>*</span>手机号
					</dt>
					<dd>
						<input placeholder="手机号码" autocomplete="off" name="telphone0" class="telphone" style="width: 100px;" type="text" data-rule="电话:required;phonemobil;">
					</dd>
				</dl>
				<dl>
					<dd>
						<select name="ticketType0" class="flush ticketType" style="padding-left: 5px;margin-left: 10px;">
							<option value="1">全票</option>
							<option value="2">半票</option>
						</select>
					</dd>
				</dl>
				
				<span class="checkbox" style="height: 30px;padding-top: 5px;padding-left: 5px;margin-left: 10px;">
					<input name="hasInsurance0" type="checkbox" value="1" id="ertong" class="flush hasInsurance">
					<label for="insurance" class="insurance-label"></label>
					<label for="insurance" class="checkbox-label-none insurance-label">乘车保险</label>
				</span>
	
				<span class="checkbox" for="ertong" onclick="childer();" style="height: 30px;padding-top: 5px;padding-left: 5px;margin-left: 10px;">
					<input name="hasChild0" type="checkbox" value="1" id="ertong" class="flush hasChild">
					<label for="ertong" class="child-label"></label>
					<label for="ertong" class="checkbox-label-none child-label">免票儿童</label>
				</span>
				<a onclick="delete1('+num+')" style="cursor:pointer">删除</a>
			</div>
		</div>
	</div>
	</form>
	<br />
	<!-- -->

	<div class="passenger">
		<div class="passenger-button">
			<button onclick="add_passenger()" style="height: 30px;width: 150px; background: #1ebff5;color:white;cursor:pointer">添加乘车人</button>
		</div>
		<span>每笔订单限购3张车票</span>
	</div>
	<!-- -->
	<div class="carpay-tiitle" style="display: none;">
		<span>取票人信息</span>
	</div>
	<!-- -->
	<div class="passenger-tiitle">
		<p>提示:购票后请提前30分钟到达车站,节假日高峰请提前1个小时到达车站</p>
	</div>
	<div class="carpay-add-list pickercontainer" style="display: none;">
		<form class="pickerform">
		<dl>
			<dt>
				<span>*</span>姓名
			</dt>
			<dd>
				<input name="linkName" type="text" id="linkName" readonly="readonly" style="width:70px;">
			</dd>
		</dl>
		<dl>
			<dt>
				<span>*</span>证件号
			</dt>
			<dd>
				<input name="idCardNo" type="text" id="idCardNo" readonly="readonly" style="width:155px;">
			</dd>
		</dl>
		<dl>
			<dt>
				<span>*</span>手机号
			</dt>
			<dd>
				<input name="telphone" type="text" id="telphone" readonly="readonly">
			</dd>
		</dl>
		
		<span class="msg-box" for="linkName"></span>
		<span class="msg-box" for="idCardNo"></span>
		<span class="msg-box" for="telphone"></span>
	</div>
	<!-- -->
	<!-- -->
	<div class="carpay-tiitle underline">
		<span>支付信息</span>
	</div>
	<div class="carpay-box-list">
		<dl>
			<dt>支付金额:</dt>
			<dd>
				<span id="totalAmount" style="display: none;">0.00</span>
				<span class="carpay-amount">￥<span id="paymentAmount">0.00</span></span>
				<span class="checkbox" style="margin-left:60px;">
					<input id="buyInfo" autocomplete="off" class="pname" type="checkbox">
					<label for="buyInfo"></label><label for="buyInfo" class="checkbox-label-none">
						<a target="_blank" href="helpcenter.jsp#jump2">已阅读购票须知</a>
					</label>
				</span>
			</dd>
		</dl>
	</div>
	<input type="button" value="提交订单去支付" class="button submitorder" onclick="submitOrderForm()">
	</form>
	<!-- -->
</div>
 	</body>
</html>