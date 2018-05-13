<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>线路管理</title>
    </head>
    <body>
    	<link rel="stylesheet" href="css/common.css" />  	
    </head>
    <body>
    	<div id="title">${title }</div>
    	<form action="${url }" method="post">
		    <div class="top">		        	
				&nbsp;&nbsp;&nbsp;&nbsp;
				<select>
					<option>始站</option>
					<option>终站</option>
				</select>
				<input type="text" name="keyWord" value="${username}" id="keyWord" >
				<input type="button" value="搜索" id="submit_find" onclick="search('${url}')">
				<input type="button" value="添加" id="submit_add" >
				<br/>
			</div>
        </form>
    <table id="table">
    	<tr>
	        <th style="width: 5%;">ID</th>       
	        <th style="width: 10%;">始站</th>
	        <th style="width: 10%;">终站</th>
	        <th style="width: 13%;">距离</th>
	        <th style="width: 13%;">途径</th>
	        <th style="width: 13%;">操作</th>
	    </tr>  
	    <c:forEach items="${list}"  var="bean">
	        <tr>
		        <td >${bean.id}</td>
		        <td >${bean.leaveStation.name}</td>
		        <td >${bean.arriveStation.name}</td>
		        <td >${bean.distance}</td>
		        <td >${bean.passby}</td>
	        	<td>
					<a id="editRow" href="${urlEdit}?{bean.id}>编辑</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${urlRemove}?id=${bean.id }">删除</a>
				</td>
	        </tr>
	    </c:forEach>
    </table>
    <div class="table_bottom">${pagerinfo }</div>
 	<!-- 遮罩层div-->
    <div class="cover" id="cover"></div> 
    <!-- 弹出层div-->
    <div class="layer" id="layer_add" >
    	<form action="adminMethod!routeCreate" method="post">
    		<div class="nav_close">
	    		<a class="btclose" id="btclose" href="javascript:histroy();">X</a>
	    	</div>
	    	<div>
	    		<label>始站:</label><input name="leaveStation" type="text" placeholder="请输入始站" />
	    	</div>
	    	<div>
	    		<label>终站:</label><input name="arriveStation" type="text" placeholder="请输入终站" />
	    	</div>
	    	<div>
	    		<label>里程(km):</label><input name="distance"  type="text" placeholder="请输入里程，途径站以-分隔" />
	    	</div>
	    	<div>
	    		<label>途径:</label><input name="passby" type="text" placeholder="请输入途径，以-分隔" />
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
	    		<label>始站:</label><input type="text" value="获取的值" />
	    	</div>
	    	<div>
	    		<label>终站:</label><input type="text" value="获取的值" />
	    	</div>
	    	<div>
	    		<label>途径:</label><input type="text" value="获取的值" />
	    	</div>
	    	<div>
	    		<label>里程(km):</label><input type="text" value="获取的值" />
	    	</div>
	    	<div>
	    		<label>行驶时间:</label><input type="text" value="获取的值" />
	    	</div>
	    	<div class="btn">
	    		<a   href="javascript:;" id="sure_editRow">确定</a>
	    	</div>
    	</form>
    </div>
    
    
    <script type="text/javascript" src="js/layer.js" ></script>
    <!-- 表格操作-->
    <script>
    	$(document).ready(function () {
            $("#table").DataTable()
        });
        var i = 0;
        //添加行
        function addRow() {
            i++;
            var rowTem ='<tr class="tr_' + i + '">'
                + '<td id="ID' + i + '">ID</td>'
                + '<td id="start_station' + i + '">始站</td>'
                + '<td id="stop_station' + i + '">终站</td>'
                + '<td id="between_station' + i + '">途径</td>'
                + '<td id="instance' + i + '">里程(km)</td>'
                + '<td id="drivetime' + i + '">行驶时间(h)</td>'
                + '<td><a href="#" onclick=editRow('+i+') >编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick=delRow('+i+') >删除</a></td>'
                + '</tr>';
            $("#table tbody:last").append(rowTem);
		}
        //删除行
        function delRow(_id) {
            $("#table .tr_"+_id).remove();
            i--;
        }
    </script>
 	</body>
</html>