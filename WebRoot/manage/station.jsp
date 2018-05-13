<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>车站管理员</title>
        <link rel="stylesheet" href="css/common.css" />
    </head>
    <body>
    	<div id="title">${title }</div>
    	<form action="${url }" method="post">
		    <div >
				&nbsp;&nbsp;&nbsp;关键字：<input type="text" name="keyWord" value="${username}" id="keyWord" >
				<input type="button" value="搜索" id="submit_find" onclick="search(${url})">
				<input type="button" value="添加" id="submit_add" >
				<br/>
			</div>
        </form>
    <table>
    	<tr>
	        <th style="width: 3%;">ID</th>
	        <th style="width: 3%;">名称</th>
	        <th style="width: 4%;"></th>
	        <th style="width: 5%;">联系方式</th>
	    </tr>
	    <c:forEach items="${list}"  var="bean">
	        <tr>
		        <td >${bean.id}</td>
		        <td >${bean.name}</td>
		        <td >${bean.password}</td>
		        <td >${bean.phone}</td>
		        <td >${bean.IDNumber}</td>
		        <td >${bean.sex}</td>
		        <td >${bean.station.name}</td>
	        	<td>
					<a href="${url2 }delete?id=${bean.id }" >启用</a>
					<a href="${url2 }delete2?id=${bean.id }">停用</a>
				</td>
	        </tr>
	    </c:forEach>
	    <tr bgcolor="grey">
	        <td class="txlrow"  colspan="8">${pagerinfo }</td>
	    </tr>
    </table>
 	</body>
</html>