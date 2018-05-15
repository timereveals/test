<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>班次管理</title>
   		<link rel="stylesheet" href="css/common.css" />

        <script type="text/javascript">
            function checkaddclassesform(){
                if (document.getElementById('leaveTime1').value=="")
                	{
                		alert("出发时间不能为空");
                		return false;
                	}
                if (document.getElementById('arriveTime1').value=="")
                	{
                		alert("到达时间不能为空");
                		return false;
                	}
                if (document.getElementById('num1').value=="")
                	{
                		alert("票数不能为空");
                		return false;
                	}
                if (document.getElementById('price1').value=="")
                	{
                		alert("价格不能为空");
                		return false;
                	}
            }
            function checkeditbustypeform(){
                if (document.getElementById('name').value=="")
                	{
                		alert("类型不能为空");
                		return false;
                	}
                if (document.getElementById('description').value=="")
                	{
                		alert("简介不能为空");
                		return false;
                	}
            }
        </script>
   	<script type="text/javascript" src="js/layer.js" ></script>
    </head>
    <body>
    	<div id="title">${title }</div>
    	<form action="${url}" method="post">
        	<div class="top">
        		&nbsp;&nbsp;&nbsp;关键字：<input type="text" name="keyWord" value="${username}" id="keyWord" placeholder="请输入站点名称或所在区县进行查询">
        		<input type="button" value="搜索" id="submit_find" onclick="search('${url}')">
        		<input type="button" value="添加" id="submit_add" >
        		<br/>
        	</div>
        </form>
    <table id="table">
    <tr>
    	        <th style="width: 5%;">ID</th>
    	        <th style="width: 7%;">班次</th>
    	        <th style="width: 11%;">始站</th>
    	        <th style="width: 11%;">终站</th>
    	        <th style="width: 13%;">出发时间</th>
    	        <th style="width: 13%;">到达时间</th>
    	        <th style="width: 5%;">票价</th>
    	        <th style="width: 8%;">操作</th>
    	    </tr>
    	    <c:forEach items="${list}"  var="bean">
    	        <tr>
    		        <td >${bean.id}</td>
    		        <td >${bean.bus.plateNumber}</td>
    		        <td >${bean.route.leaveStation.name}</td>
    		        <td >${bean.route.arriveStation.name}</td>
    		        <td >${bean.leaveTime}</td>
    		        <td >${bean.arriveTime}</td>
    		        <td >${bean.price}</td>
    	        	<td>

    					<a href="${urlRemove}?id=${bean.id}">删除</a>
    				</td>
    	        </tr>
    	    </c:forEach>
    </table>
    
    <div class="table_bottom">${pagerinfo }</div>
    <!-- 遮罩层div-->
    <div class="cover" id="cover"></div> 
    <!-- 弹出层div-->
    <div class="layer" id="layer_add" >
    	<form action="adminMethod!scheduleCreate" onsubmit="return checkaddclassesform()" method="post">
    		<div class="nav_close">
	    		<a class="btclose" id="btclose" href="javascript:;">X</a>
	    	</div>
	    	<div>
	    	    <label>线路:</label>
	    		<select name="routeId" style="width:300px;height:34px;line-height:34px;border:1px solid grey;border-radius:4px;margin-top:15px;">
	    		    <c:forEach items="${routeList}" var="bean">
	    		    <option name="routeId" value="${bean.id}">${bean.leaveStation.name}-${bean.arriveStation.name}</option>
	    		    </c:forEach>
	    		</select>
	    	</div>
	    	<div>
	    	    <label>车辆:</label>
	    		<select name="busId" style="width:300px;height:34px;line-height:34px;border:1px solid grey;border-radius:4px;margin-top:15px;">
	    		    <c:forEach items="${busList}" var="bean">
	    		    <option name="busId" value="${bean.id}">${bean.busType.name}-${bean.plateNumber}</option>
	    		    </c:forEach>
	    		</select>
	    	</div>
	    	<div>
	    		<label>出发时间:</label><input name="leaveTime" id="leaveTime1" type="datetime-local"  />
	    	</div>
	    	<div>
	    		<label>到达时间:</label><input name="arriveTime" id="arriveTime1" type="datetime-local"  />
	    	</div>
	    	<div>
	    		<label>票价(元):</label><input name="price" id="price1" type="text" placeholder="请输入票价" />
	    	</div>	
	    	<div class="btn">
	    		<button type="submit">确定</button>
	    	</div>
    	</form>
    </div>
	<!-- 弹出层(editRow)div-->
    <div class="layer" id="layer_editRow" >
    	<form >
    		<div class="nav_close">
	    		<a class="btclose" id="btclose_editRow" href="javascript:;">X</a>
	    	</div>
	    	<div>
	    		<label>路线：</label>
                <select name="routeName" id="routeName" style="width:300px;height:34px;line-height:34px;border:1px solid grey;border-radius:4px;margin-top:15px;">
	    		    <c:forEach items="${routeList}" var="bean">
	    		    <option name="routeId" value="${bean.id}">${bean.leaveStation.name}-${bean.arriveStation.name}</option>
	    		    </c:forEach>
	    		</select>
	    	</div>
	    	<div>
	    		<label>车辆:</label>
                <select name="busName" id="busName" style="width:300px;height:34px;line-height:34px;border:1px solid grey;border-radius:4px;margin-top:15px;">
	    		    <c:forEach items="${busList}" var="bean">
	    		    <option name="busId" value="${bean.id}">${bean.busType.name}-${bean.plateNumber}</option>
	    		    </c:forEach>
	    		</select>
	    	</div>
	    	<div>
	    		<label>出发时间：</label><input name="leaveTime" id="leaveTime" type="text" value=""/>
	    	</div>
            <div>
	    		<label>到达时间：</label><input name="arriveTime" id="arriveTime" type="text" value=""/>
	    	</div>
	    	<div>
	    		<label>票价(元)：</label><input name="price" id="price" type="text" value="" />
	    	</div>	
	    	<div class="btn">
	    		<a   href="javascript:;" id="sure_editRow">确定</a>
	    	</div>
    	</form>
    </div>
        <script type="text/javascript">
             function editClasses(classesid,busTupeName,plateNumber,leaveStation,arriveStation,leaveTime,arriveTime,price){
                     document.getElementById("busid").value=leaveStation + "-" + arriveStation;
                     document.getElementById("plateNumber").value = busTupeName + "-" + plateNumber;
                     document.getElementById("plateNumber").value = plateNumber;
                     document.getElementById("leaveTime").value = leaveTime;
                     document.getElementById("arriveTime").value = arriveTime;
                     document.getElementById("price").value = price;
                     $("#cover").fadeIn("slow");
                     $("#busTypeEdit").fadeIn("slow");//淡入淡出效果 显示div
             }
            $(function(){

                $("#btclose_editRow").click(function(){
                    $("#cover").fadeOut("slow");
                    $("#busTypeEdit").fadeOut("slow");//淡入淡出效果 隐藏div
                });
                $("#sure").click(function(){
                    $("#cover").fadeOut("slow");
                    $("#busTypeEdit").fadeOut("slow");//淡入淡出效果 隐藏div
                })
            });
     </script>

 	</body>
</html>