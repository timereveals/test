<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>班次管理</title>
   <link rel="stylesheet" href="css/common.css" />
    <script type="text/javascript" src="js/layer.js" ></script>
    </head>
    <body>
    	<div id="title">${title }</div>
    	<form action="${url }" method="post">
		    <div >		        	
				&nbsp;&nbsp;&nbsp;&nbsp;
				<select>
					<option>始站</option>
					<option>终站</option>
				</select>
				<input type="text" name="username" value="${username}" id="text" >
				<input type="button" value="搜索" id="submit_find" >
				<input type="button" value="添加" id="submit_add" >
				<br/>
			</div>
        </form>
    <table>
    	<tr>
	        <th style="width: 5%;">ID</th>       
	        <th style="width: 7%;">班次</th>
	        <th style="width: 10%;">始站</th>
	        <th style="width: 10%;">终站</th>
	        <th style="width: 7%;">类型</th>
	        <th style="width: 13%;">出发时间</th>
	        <th style="width: 8%;">票价</th>
	        <th style="width: 8%;">操作</th>
	    </tr>  
	    <c:forEach items="${list}"  var="bean">
	        <tr>
		        <td >${bean.id}</td>
		        <td >${bean.id}</td>
		        <td >${bean.route.leaveStation.name}</td>
		        <td >${bean.route.arriveStation.name}</td>
		        <td >${bean.bus.busType.name}</td>
		        <td >${bean.leaveTime}</td>
		        <td >${bean.price}</td>
	        	<td>
					<a href="${url2 }delete?id=${bean.id }">修改</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${url2 }delete2?id=${bean.id }">删除</a>
				</td>
	        </tr>
	    </c:forEach>
	    <tr bgcolor="grey">
	        <td class="txlrow"  colspan="10">${pagerinfo }</td>       
	    </tr>
    </table>
 	</body>
</html>