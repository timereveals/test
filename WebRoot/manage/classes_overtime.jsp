<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>班次管理</title>
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
				<input type="text" name="username" value="${username}" id="text" >
				<input type="button" value="搜索" id="submit_find" >
				<input type="button" value="添加" id="submit_add" >
				<br/>
			</div>
        </form>
    <table id="table">
    	<tr>
	        <th style="width: 5%;">ID</th>       
	        <th style="width: 10%;">始站</th>
	        <th style="width: 10%;">终站</th>
	        <th style="width: 13%;">途径</th>
	        <th style="width: 7%;">类型</th>
	        <th style="width: 7%;">班次</th>
	        <!--加班车次开始结束日期-->
	        <th style="width: 7%;">开始日期</th>
	        <th style="width: 7%;">结束日期</th>
	        <th style="width: 13%;">出发时间</th>
	        <th style="width: 5%;">票价</th>
	        <th style="width: 8%;">操作</th>
	    </tr>  
	    <c:forEach items="${list}"  var="bean">
	        <tr>
		        <td >ID</td>       
		        <td >始站</td>    
		        <td >终站</td>
		        <td >途径</td>
		        <td >类型</td>
		        <td >班次</td>
		        <td >开始日期</td>
		        <td >结束日期</td>
		        <td >出发时间</td>
		        <td >票价</td>
	        	<td>
					<a id="editRow" href="javascript:;">编辑</a>
					&nbsp;&nbsp;
					<a href="${url2 }delete2?id=${bean.id }">删除</a>
				</td>
	        </tr>
	    </c:forEach>
    </table>
    
    <div class="table_bottom">${pagerinfo }</div>
    <!-- 遮罩层div-->
    <div class="cover" id="cover"></div> 
    <!-- 弹出层div-->
    <div class="layer" id="layer_add" style="overflow: scroll;">
    	<form >
    		<div class="nav_close">
	    		<a class="btclose" id="btclose" href="javascript:histroy();">X</a>
	    	</div>
	    	<div>
	    		<label>始站:</label><input type="text" placeholder="请选择始站" />
	    	</div>
	    	<div>
	    		<label>终站:</label><input type="text" placeholder="请选择终站" />
	    	</div>	
	    	<div>
	    		<label>途径:</label><input type="text" placeholder="途径" />
	    	</div>
	    	<div>
	    		<label>类型:</label><input type="text" placeholder="请选择类型" />
	    	</div>	
	    	<div>
	    		<label>班次:</label><input type="text" placeholder="请输入班次" />		
	    	</div>
	    	<!--类型(班次)选择加班时-->
	    	<div >
	    		<label>开始日期:</label><input type="date" placeholder="请选择出发日期" />
	    	</div>
	    	<div >
	    		<label>结束日期:</label><input type="date" placeholder="请选择出发日期" />
	    	</div>
	    	<!--end-->
	    	
	    	<div>
	    		<label>出发时间:</label><input type="text" placeholder="请输入出发时间,格式：12:00,12:30..." />
	    	</div>
	    	<div>
	    		<label>票价(元):</label><input type="text" placeholder="请输入票价" />
	    	</div>	
	    	<div class="btn">
	    		<a onclick="addRow()" href="javascript:;" id="sure">确定</a>
	    	</div>
    	</form>
    </div>
	<!-- 弹出层(editRow)div-->
    <div class="layer" id="layer_editRow" style="overflow: scroll;">
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
	    		<label>类型:</label><input type="text" value="获取的值" />
	    	</div>	
	    	<div>
	    		<label>班次:</label><input type="text" value="获取的值" />
	    	</div>	 
	    	<div >
	    		<label>开始日期:</label><input type="date" value="获取的值"/>
	    	</div>
	    	<div >
	    		<label>结束日期:</label><input type="date" value="获取的值" />
	    	</div>
	    	<div>
	    		<label>出发时间:</label><input type="text" value="获取的值"/>
	    	</div>
	    	<div>
	    		<label>票价(元):</label><input type="text" value="获取的值" />
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
                + '<td id="bustype' + i + '">类型</td>'
                + '<td id="classes' + i + '">班次</td>'
                + '<td id="godate' + i + '">开始日期</td>'
                + '<td id="stopdate' + i + '">结束日期</td>'
                + '<td id="gotime' + i + '">出发时间</td>'
                + '<td id="price' + i + '">票价</td>'
                + '<td><a href="#" onclick=editRow('+i+') >编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick=delRow('+i+') >删除</a></td>'
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
 	</body>
</html>