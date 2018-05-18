<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>线路管理</title>
    	<link rel="stylesheet" href="css/common.css" />

        <script type="text/javascript">
            function checkaddrouteform(){
                if (document.getElementById('distance').value=="")
                	{
                		alert("距离不能为空");
                		return false;
                	}
            }
        </script>
    </head>
    <body>
    	<div id="title">${title }</div>
    	<form action="${url }" method="post">
		    <div class="top">
				&nbsp;&nbsp;&nbsp;关键字：<input type="text" name="keyWord" value="${username}" id="keyWord"  placeholder="请输入id或者始站或者终站进行查询"/>
				<input type="button" value="搜索" id="submit_find" onclick="search('${url}')"/>
				<input type="button" value="添加" id="submit_add" />
				<br/>
			</div>
        </form>
    <table id="table">
    	<tr>
	        <th style="width: 5%;">ID</th>       
	        <th style="width: 20%;">始站</th>
	        <th style="width: 20%;">终站</th>
	        <th style="width: 13%;">距离</th>
	        <th style="width: 13%;">操作</th>
	    </tr>  
	    <c:forEach items="${list}"  var="bean">
	        <tr>
		        <td >${bean.id}</td>
		        <td >${bean.leaveStation.name}</td>
		        <td >${bean.arriveStation.name}</td>
		        <td >${bean.distance}</td>
	        	<td>
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
    	<form action="adminMethod!routeCreate" onsubmit="return checkaddrouteform()"  method="post">
    		<div class="nav_close">
	    		<a class="btclose" id="btclose" href="javascript:;">X</a>
	    	</div>
	    	<div>
	    		<label>始站:</label>
                <select id="leaveStation"  name="leaveStation" style="width:300px;height:34px;line-height:34px;border:1px solid grey;border-radius:4px;margin-top:15px;">
                    <c:forEach items="${stationlist1}"  var="bean">
                       	<option value="${bean.name}">${bean.name}</option>
                    </c:forEach>
                </select>
	    	</div>
	    	<div>
	    		<label>终站:</label>
                <select id="arriveStation"  name="arriveStation" style="width:300px;height:34px;line-height:34px;border:1px solid grey;border-radius:4px;margin-top:15px;">
                    <c:forEach items="${stationlist}"  var="bean">
                       	<option value="${bean.name}">${bean.name}</option>
                    </c:forEach>
                </select>
	    	</div>
	    	<div>
	    		<label>里程(km):</label><input name="distance"  id="distance" type="text" placeholder="请输入里程" />
	    	</div>
	    	<div class="btn">
	    		<button type="submit">确定</button>
	    	</div>
    	</form>
    </div>
    <script type="text/javascript" src="js/layer.js" ></script>

 	</body>
</html>