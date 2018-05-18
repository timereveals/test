<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>车辆管理</title>
    <link rel="stylesheet" href="css/common.css" />
        <script type="text/javascript">
            function checkaddbusform(){
                if (document.getElementById('plateNumber1').value=="")
                	{
                		alert("车牌号不能为空");
                		return false;
                	}

                if (document.getElementById('totalSeats1').value=="")
                	{
                		alert("座位不能为空");
                		return false;
                	}
                if (document.getElementById('description1').value=="")
                	{
                		alert("简介不能为空");
                		return false;
                	}
            }
            function checkeditbusform(){
                if (document.getElementById('plateNumber').value=="")
                	{
                		alert("车牌号不能为空");
                		return false;
                	}
                if (document.getElementById('totalSeats').value=="")
                	{
                		alert("座位不能为空");
                		return false;
                	}
                if (document.getElementById('description').value=="")
                	{
                		alert("简介不能为空");
                		return false;
                	}
            }
        </script>
    </head>
    <body>
    	<div id="title">${title }</div>
    	<form action="${url }" method="post">
		    <div class="top">
				&nbsp;&nbsp;&nbsp;关键字：<input type="text" name="keyWord" value="${username}" id="keyWord" placeholder="请输入id或者车牌号进行查询">
				<input type="button" value="搜索" id="submit_find" onclick="search('${url}')">
				<input type="button" value="添加" id="submit_add">
				<br/>
			</div>
        </form>
    <table id="table">
    	<tr>
	        <th style="width: 5%;">ID</th>
	        <th style="width: 13%;">类型</th>
	        <th style="width: 13%;">车牌号</th>
	        <th style="width: 13%;">座位</th>
	        <th style="width: 13%;">简介</th>
	        <th style="width: 13%;">操作</th>
	    </tr>
	    <c:forEach items="${list}"  var="bean">
	        <tr >
		        <td >${bean.id}</td>
		        <td >${bean.busType.name}</td>
		        <td >${bean.plateNumber}</td>
		        <td >${bean.totalSeats}</td>
		        <td >${bean.description}</td>
	        	<td>
					<a  href="javascript:editBusManage(${bean.id},'${bean.busType.name}','${bean.plateNumber}',${bean.totalSeats},'${bean.description}')">编辑</a>
					&nbsp;&nbsp;
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
    	<form action="adminMethod!busCreate" onsubmit="return checkaddbusform()" method="post">
    		<div class="nav_close">
	    		<a class="btclose" id="btclose" href="javascript:;">X</a>
	    	</div>
	    	<div>
	    		<label>类型:</label>
                <select name="busTypeName" style="width:300px;height:34px;line-height:34px;border:1px solid grey;border-radius:4px;margin-top:15px;">
	    		    <c:forEach items="${busTypeList}" var="bean">
	    		        <option  value="${bean.name}">${bean.name}</option>
	    		    </c:forEach>
	    		</select>
	    	</div>
	    	<div>
                <label>车牌号:</label><input name="plateNumber" id="plateNumber1" type="text" placeholder="请输入车牌号"/>
            </div>
            <div>
                <label>座位:</label><input name="totalSeats" id="totalSeats1" type="text" placeholder="请输入座位"/>
            </div>
	    	<div>
	    		<label>简介:</label><input name="description" id="description1" placeholder="请输入简介" />
	    	</div>
	    	<div class="btn">
	    		<button id="sure" type="submit">确定</button>
	    	</div>
    	</form>
    </div>
    <!-- 弹出层(editRow)div-->
    <div class="layer" id="busTypeEdit" >
    	<form action="${urlUpdate}" onsubmit="return checkeditbusform()" method="post">
    		<div class="nav_close">
	    		<a class="btclose" id="btclose_editRow" href="javascript:;">X</a>
	    	</div>
	    	    <input type="hidden" name="id" id="busid" value="busid"/>
            <div>
	    		<label>类型:</label>
                <select name="busTypeName" id="busTypeName" style="width:300px;height:34px;line-height:34px;border:1px solid grey;border-radius:4px;margin-top:15px;">
	    		    <c:forEach items="${busTypeList}" var="bean">
	    		        <option  value="${bean.name}">${bean.name}</option>
	    		    </c:forEach>
	    		</select>
	    	</div>
	    	<div>
            	<label>车牌号:</label><input name="plateNumber" id="plateNumber" type="text" value=""/>
            </div>
            <div>
            	<label>座位:</label><input name="totalSeats" id="totalSeats" type="text" value=""/>
            </div>
	    	<div>
	    		<label>简介:</label><input name="description" id="description" type="text" value=""/>
	    	</div>
	    	<div class="btn">
	    		<button  type="submit">确定</button>
	    	</div>
    	</form>
    </div>
    <script type="text/javascript" src="js/layer.js" ></script>
     <script type="text/javascript">
             function editBusManage(busid,name,plateNumber,totalSeats,description){
                     document.getElementById("busid").value=busid;
                     document.getElementById("busTypeName").value = name;
                     document.getElementById("plateNumber").value = plateNumber;
                     document.getElementById("totalSeats").value = totalSeats;
                     document.getElementById("description").value = description;
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