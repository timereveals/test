<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/addorder.css" />

    </head>
    <body>
    <%@ include file="head.jsp" %>
    <div class="bg">
        <div class="carpay-process">
            <span class="carpay-process-conten">1.确定预定车票车次</span> <span>2.核对支付订单</span>
        </div>
        <div class="carpay-tiitle underline">
            <span>${schedule.route.leaveStation.name} - ${schedule.route.arriveStation.name}</span>
            <a href="javascript:javascript:history.back(-1);" class="fr backtosearch">返回修改班次</a>
        </div>

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
                    <th>总价</th>
                </tr>
		    </thead>
		    <tbody>
                <tr>
                    <td>${schedule.bus.busType.name}</td>
                    <td><span class="payicon-1">发</span>${schedule.route.leaveStation.name}</td>
                    <td>${fn:substring(schedule.leaveTime,0, 10)}</td>
                    <td>${schedule.route.distance}</td>
                    <td>
                        全票${schedule.price}
                    </td>
                    <td>￥2.00</td>
                    <td style="color:#ff7d1a;front-size:20px;font-weight: bold;"> <span class="totalamount2"></span></td>
                </tr>
			<tr>
				<td>${schedule.bus.plateNumber}</td>
				<td><span class="payicon-1 payicon-2">到</span>${schedule.route.arriveStation.name}</td>
				<td>${fn:substring(schedule.leaveTime,11, 16)}</td>
				<td></td>
				<td>
					半票${schedule.price/2}
				</td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	    <!-- 显示所有乘车人信息，勾选要购票的乘车人-->
        <div class="carpay-tiitle">
            <span>乘车人信息</span>
        </div>
        <div class="passenger-tiitle" style="height:auto;">
        <% int count = 0; %>
        <c:forEach items="${passengerList}" var="bean">
           <label>
              <input class="psg_checkbox" type="checkbox"  name="${bean.name}" idNumber="${bean.IDNumber}" phone="${bean.phone}" value="${bean.name}" onclick='checkbox_clicked(this);' />
              <span>${bean.name}</span>
           </label>
        </c:forEach>
        <div class="carpay-add-info" >
    </div>
    </div>
        <!--添加乘车人 -->
        <form id="orderForm" class="passengerform" action="userMethod!createOrder?scheduleid=${schedule.id}&num=0" method="post">
            <div class="carpay-add-info" >
                <div class="carpay-add-list" style="height: auto;position: relative;padding-bottom: 10px;" id="passenger_info">

                </div>
            </div>
        </form>
        <br />
	    <!-- -->

        <div class="passenger">
            <div class="passenger-button">
                <button onclick="add_passenger('','','')" style="height: 30px;width: 150px; background: #1ebff5;color:white;cursor:pointer">添加乘车人</button>
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
                        <input id="readInfo" autocomplete="off" class="pname" type="checkbox" onclick="">
                        <label for="readInfo"></label><label for="readInfo" class="checkbox-label-none">
                            <a target="_blank" href="helpcenter.jsp#jump2">已阅读购票须知</a>
                        </label>
                    </span>
                </dd>
            </dl>
        </div>
	    <input type="submit" value="提交订单" class="button submitorder" onclick="submitOrderForm()">
	<!-- -->
</div>
        <script type="text/javascript">
        	    var available = Math.min(3,${iAvailable});
				var num = 0;
                //var passenger_num = "<%=count %>";
                //for(var i = 0; i <= passenger_num;i++){
                //    var passengerName_id=document.getElementById("passengerName"+i);
                //    var add_id=document.getElementById("add"+i);
                //    if(!passengerName_id.checked){
                //        passengerName_id.onclick = function(){
                //            num = num +1;
                //            add_id.style.display='block';
                //            if(num>=available){
                //                 alert("达到最大可添加数量"+available);
                //                 for(var i = 0; i <= passenger_num;i++){
                //                     var checked_id2=document.getElementById("checked"+i);
                //                     if(!checked_id2.checked){
                //                      checked_id2.setAttribute('disabled','disabled');
                //                     }
                //                 }
                //            }
                //        }
                //    }else{
                //    alert(1);
                //    }
                //}

                function checkbox_clicked(obj){
                    if(obj.checked){
                        if(!add_passenger(obj.getAttribute("name"), obj.getAttribute("idNumber"), obj.getAttribute("phone"))){
                            obj.checked=false;
                        }
                    }else{
                        del_passenger(obj.getAttribute("idNumber"));
                    }
                }
                function add_passenger(name, idNumber, phone){
					if(num>=available){
						alert("超过最大可添加数量"+available);
						return false;
					}
                    document.getElementById("passenger_info").innerHTML+="<div id='add"+idNumber+"' style='margin-top:20px;'>\
                    	<dl><dt style='width: 45px;'>姓名</dt>\
                    		<dd><input placeholder='乘客姓名' autocomplete='off' name='name"+num+"' value='"+name+"' class='linkName' type='text' data-rule='姓名:required;chinaname;' style='width:70px;height: 30px;' ></dd>\
                    	</dl>\
                    	<dl><dt>证件号码</dt>\
                    		<dd><input placeholder='证件号码' autocomplete='off' name='idCardNo"+num+"' value='"+idNumber+"' class='idCardNo' type='text' data-rule='证件号码:required;cerNo;' style='width:200px;height: 30px;'></dd>\
                    	</dl>\
                    	<dl><dt style='width: 50px;'>手机号</dt>\
                    		<dd><input placeholder='手机号码' autocomplete='off' name='telphone"+num+"' value='"+phone+"' class='telphone' style='width: 100px;height: 30px;' type='text' data-rule='电话:required;phonemobil;'></dd>\
                    	</dl>\
						<dl>\
							<dd>\
							<select name='ticketType"+num+"' class='flush ticketType' style='padding-left: 5px;margin-left: 10px;'>\
                                <option value='全票'>全票</option>\
                                <option value='半票'>半票</option>\
							</select>\
							</dd>\
						</dl>\
						<dl>\
						<dd>\
							<input name='hasInsurance"+num+"' type='checkbox'  name='insurance"+num+"' style='margin-left:15px;'/>\
                            <label >乘车保险</label>\
							</span>\
							</dd>\
						</dl>\
						<dl>\
						<dd>\
							<input name='hasChild"+num+"' type='checkbox'  name='freechild"+num+"' style='margin-left:15px;'/>\
							<label>免票儿童</label>\
							</span>\
							</dd>\
						</dl>\
						<a onclick=\"del_passenger('"+idNumber+"',this)\" style='cursor:pointer' >&nbsp;&nbsp;&nbsp;删除</a>\
                    	</div>";
                    num=num+1;
                    document.getElementById("orderForm").action="userMethod!createOrder?scheduleid=${schedule.id}&num="+num;
                    return true;
                }
                function del_passenger(idNumber,obj){
                    if(idNumber == null || idNumber.trim() == ""){
                        obj.parentNode.parentNode.removeChild(obj.parentNode);
                    }else{
                        var node = document.getElementById("add"+idNumber);
                        node.parentNode.removeChild(node);
                        var list = document.getElementsByClassName("psg_checkbox");
                        for(i = 0; i<list.length; i++){
                            if(list[i].checked && list[i].getAttribute("idNumber")==idNumber){
                                list[i].checked=false;
                            }
                        }
                    }
                    num=num-1;
                }

                //function delete1(i){
                //        var divid="add"+i;
                //        var node = document.getElementById(divid);
                //        node.parentNode.removeChild(node);
                //        num=num-1;
                //    }
                function submitOrderForm(){
                    if(num == 0){
                        alert("乘车人数量不能为空");
                        return;
                    }
                    var checked = document.getElementById("readInfo");
                    if(!checked.checked)
                    {
                        alert("请仔细阅读乘车须知并勾选");
                        return ;
                    }
                    document.getElementById("orderForm").submit();
                }

        	</script>
 	</body>
</html>