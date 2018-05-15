<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>车站管理员</title>
        <link type="text/css" rel="stylesheet" href="css/common.css" />
        <script type="text/javascript">
            function checkaddform(){
                if (document.getElementById('name').value=="")
                	{
                		alert("用户名不能为空");
                		return false;
                	}
                if (document.getElementById('realName').value=="")
                	{
                		alert("姓名不能为空");
                		return false;
                	}
                if (document.getElementById('phone').value=="")
                	{
                		alert("联系方式不能为空");
                		return false;
                	}
                if (document.getElementById('idNumber').value=="")
                	{
                		alert("身份证号不能为空");
                		return false;
                	}
            }
        </script>
    </head>
    <body>
    	<div id="title">${title }</div>
    	<form action="${url}" method="post">
		    <div class="top">		        	
				&nbsp;&nbsp;&nbsp;关键字：<input type="text" name="keyWord" value="${username}" id="keyWord" placeholder="请输入id或者姓名进行查询">
				<input type="button" value="搜索" id="submit_find" onclick="search('${url}')">
				<input type="button" value="添加" id="submit_add" >
				<br/>
			</div>
        </form>
    <table id="table">
    	<tr>
	        <th style="width: 3%;">ID</th>
	        <th style="width: 3%;">用户名</th>
	        <th style="width: 3%;">真实姓名</th>
	        <th style="width: 4%;">密码</th>
	        <th style="width: 5%;">联系方式</th>
	        <th style="width: 5%;">身份证号</th>
	        <th style="width: 2%;">性别</th>
	        <th style="width: 6%;">站点</th>
	        <th style="width: 3%;">状态</th>
	        <th style="width: 5%;">操作</th>
	    </tr>  
	    <c:forEach items="${list}"  var="bean">
	        <tr >
		        <td >${bean.id}</td>
		        <td >${bean.name}</td>
		        <td >${bean.realName}</td>
		        <td >${bean.password}</td>
		        <td >${bean.phone}</td>
		        <td >${bean.IDNumber}</td>
		        <td >${bean.sex}</td>
		        <td >${bean.station.name}</td>
		        <td >
                	<c:if test="${bean.status == 0}">
                		正常使用
                	</c:if>
                	<c:if test="${bean.status != 0}">
                	    已被停用
                	</c:if>
	        	<td>
					<a href="${urlResetpwd }?id=${bean.id }" >重置</a>
					<a href="${urlReleaseLock }?id=${bean.id }" >启用</a>
					<a href="${urlSetLock }?id=${bean.id }">停用</a>

				</td>
	        </tr>
	    </c:forEach>	    
    </table>
    <div class="table_bottom">${pagerinfo }</div>
    <!-- 遮罩层div-->
    <div class="cover" id="cover"></div> 
    <!-- 弹出层div-->
    <div class="layer" id="layer_add" >
    	<form action="adminMethod!adminCreate" onsubmit="return checkaddform()" method="post">
    		<div class="nav_close">
	    		<a class="btclose" id="btclose" href="javascript:;">X</a>
	    	</div>
	    	<div>
	    		<label>用户名:</label><input name="name" id="name" type="text" placeholder="请输入姓名" />
	    	</div>
	    	<div>
	    		<label>密码:</label><input name="password" id="password" type="text" value="123456" readonly="ture" />
	    	</div>
	    	<div>
	    		<label>联系方式:</label><input name="phone" id="phone" type="text" placeholder="请输入联系方式" />
	    	</div>
	    	<div>
	    		<label>真实姓名:</label><input name="realName" id="realName" type="text" placeholder="请输入真实姓名" />
	    	</div>
	    	<div>
	    		<label>身份证号:</label><input name="idNumber" id="idNumber" type="text" placeholder="请输入身份证号" />
	    	</div>
	    	<div>
	    		<label>性别:</label>
	    		<select id="sex" name="sex" style="width:300px;height:34px;line-height:34px;border:1px solid grey;border-radius:4px;margin-top:15px;">
                     <option value="男">男</option>
                     <option value="女">女</option>
                 </select>
	    	</div>
	    	<div>
	    		<label>站点:</label>
	    		<select id="stationName"  name="stationName" style="width:300px;height:34px;line-height:34px;border:1px solid grey;border-radius:4px;margin-top:15px;">
                    <c:forEach items="${stationlist}"  var="bean">
                       	<option value="${bean.name}">${bean.name}</option>
                    </c:forEach>
                </select>
	    	</div>
	    	<div class="btn">
	    		<button type="submit">确定</button>
	    	</div>
    	</form>
    </div>   
    <script type="text/javascript" src="js/layer.js" ></script> 
    <script type="text/javascript" src="js/selectpage.js" ></script>
    <script type="text/javascript" src="js/dropmenu.js" ></script>
 	</body>
</html>