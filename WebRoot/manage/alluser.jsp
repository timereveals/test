<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>普通用户</title>
    <link rel="stylesheet" href="css/common.css" />
    </head>
    <body>
    	<div id="title">${title }</div>
    	<form action="${url }" method="post">
		    <div class="top">		        	
				&nbsp;&nbsp;&nbsp;关键字：<input type="text" name="keyWord" value="${username}" id="keyWord" placeholder="请输入id或者姓名进行查询">
				<input type="button" value="搜索" id="submit_find" style="" onclick="search('${url}')">
				<br/>
			</div>
        </form>
    <table>
    	<tr>
	        <th style="width: 2%;">ID</th>
	        <th style="width: 3%;">用户名</th>
	        <th style="width: 3%;">真实姓名</th>
	        <th style="width: 4%;">密码</th>
	        <th style="width: 7%;">身份证号</th>
	        <th style="width: 5%;">联系方式</th>
	        <th style="width: 2%;">性别</th>
	        <th style="width: 5%;">注册时间</th>
	        <th style="width: 3%;">状态</th>
	        <th style="width: 3%;">操作</th>
	    </tr>  
	    <c:forEach items="${list}"  var="bean">
	        <tr>
		        <td >${bean.id}</td>
		        <td >${bean.name}</td>
		        <td >${bean.realName}</td>
		        <td >${bean.password}</td>
		        <td >${bean.IDNumber}</td>
		        <td >${bean.phone}</td>
		        <td >${bean.sex}</td>
		        <td >${bean.createtime}</td>
		        <td >
		        <c:if test="${bean.status == 0}">
		        正常使用
		        </c:if>
		        <c:if test="${bean.status != 0}">
		        已被停用
		        </c:if>
		        </td>
	        	<td>
					<a href="${urlReleaseLock }?id=${bean.id }">启用</a>
					<a href="${urlSetLock }?id=${bean.id }">停用</a>
				</td>
	        </tr>
	    </c:forEach>
	    <tr bgcolor="grey">
	        <td class="txlrow"  colspan="10">${pagerinfo }</td>
	    </tr>
    </table>
 	</body>
</html>