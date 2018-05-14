<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>站点管理</title>
        <link rel="stylesheet" href="css/common.css" />
    </head>
    <body>
		<div id="title" >站点管理</div>
        <form action="${url}" method="post">
		    <div class="top">
				&nbsp;&nbsp;&nbsp;关键字：<input type="text" name="keyWord" value="${username}" id="keyWord" >
				<input type="button" value="搜索" id="submit_find" onclick="search('${url}')">
				<input type="button" value="添加" id="submit_add" >
				<br/>
			</div>
        </form>
		<table id="table">
			<tr>
				<th style="width: 3%;">ID</th>
				<th style="width: 7%;">站点名称</th>
				<th style="width: 7%;">所在省市县</th>
				<th style="width: 13%;">地址</th>
				<th style="width: 10%;">电话</th>
				<th style="width: 6%;">操作</th>
			</tr>
			<c:forEach items="${list}" var="bean">
			<tr>
				<td>${bean.id}</td>
				<td>${bean.name}</td>
				<td>${bean.locationBrief}</td>
				<td>${bean.locationDetail}</td>
				<td>${bean.phone}</td>
				<td>
				    <a  href="javascript:editStation(${bean.id},'${bean.name}','${bean.locationBrief}','${bean.locationDetail}','${bean.phone}');">编辑</a>
					<a id="delete" href="${urlRemove}?id=${bean.id}">删除</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	<div class="table_bottom">${pagerinfo }</div>
	<!-- 遮罩层div-->
    <div class="cover" id="cover"></div> 
    <!-- 弹出层div  添加add-->
    <div class="layer" id="layer_add" >
    	<form action="adminMethod!stationCreate" method="post">
    		<div class="nav_close">
	    		<a class="btclose" id="btclose" href="javascript:histroy();">X</a>
	    	</div>
	    	<div>
	    		<label>站点名称:</label><input name="name" type="text" placeholder="请输入站点名称" />
	    	</div>
	    	<div>
	    		<label>所在省市县:</label><input name="locationBrief" type="text" placeholder="请输入所在省/市/县" />
	    	</div>
	    	<div>
	    		<label>地址:</label><input name="locationDetail" type="text" placeholder="请输入地址" />
	    	</div>
	    	<div>
	    		<label>电话:</label><input name="phone" type="text" placeholder="请输入电话,区号和电话请用-分隔" />
	    	</div>	    	
	    	<div class="btn">
	    		<button type="submit">确定</button>
	    	</div>
    	</form>
    </div>
    <!-- 弹出层(editRow)div-->
    <div class="layer" id="layer_editRow" >
    	<form action="${urlUpdate}" method="post">
    		<div class="nav_close">
	    		<a class="btclose" id="btclose_editRow" href="javascript:;">X</a>
	    	</div>
    	    	<input type="hidden" name="id" id="stationid" value="stationid"/>
	    	<div>
	    		<label>站点名称:</label><input name="name" id="name" type="text" value="" />
	    	</div>
	    	<div>
	    		<label>所在省市县:</label><input name="locationBrief" id="locationBrief" type="text" value=""  />
	    	</div>
	    	<div>
	    		<label>地址:</label><input name="locationDetail" id="locationDetail" type="text" value=""  />
	    	</div>
	    	<div>
	    		<label>电话:</label><input name="phone" id="phone" type="text" value=""  />
	    	</div>
	    	<div class="btn">
	    		<button type="submit">确定</button>
	    	</div>
    	</form>
    </div>
    <script type="text/javascript" src="js/layer.js" ></script>
    <script>
        function editStation(stationid,name,locationBrief,locationDetail,phone){
             document.getElementById("stationid").value=stationid;
             document.getElementById("name").value = name;
             document.getElementById("locationBrief").value = locationBrief;
             document.getElementById("locationDetail").value = locationDetail;
             document.getElementById("phone").value = phone;
             $("#cover").fadeIn("slow");
             $("#layer_editRow").fadeIn("slow");//淡入淡出效果 显示div
        }
        $("#btclose_editRow").click(function(){
                $("#cover").fadeOut("slow");
                $("#layer_editRow").fadeOut("slow");//淡入淡出效果 隐藏div
            });
            $("#sure_editRow").click(function(){
                $("#cover").fadeOut("slow");
                $("#layer_editRow").fadeOut("slow");//淡入淡出效果 隐藏div
            })
     </script>
 	</body>
</html>