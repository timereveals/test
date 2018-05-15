<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>公告管理</title>
    <link rel="stylesheet" href="css/common.css" />
    </head>
    <body>
    	<div id="title">${title }</div>
    	<form action="${url}" method="post">
		    <div class="top">		        	
				&nbsp;&nbsp;&nbsp;&nbsp;关键字<input type="text" name="keyWord" value="${username}" id="keyWord" placeholder="请输入id或者标题或者内容进行查询">
				<input type="button" value="搜索" id="submit_find" onclick="search('${url}')">
				<input type="button" value="添加" id="submit_add" >
				<br/>
			</div>
        </form>
    <table id="table">
    	<tr>
    		<th style="width: 8%;">ID</th>
	        <th style="width: 10%;">标题</th>
	        <th style="width: 15%;">内容</th>
	        <th style="width: 15%;">开始时间</th>
	        <th style="width: 15%;">结束时间</th>
	        <th style="width: 13%;">操作</th>
	    </tr>  
	    <c:forEach items="${list}"  var="bean">
	        <tr>
		        <td >${bean.id}</td>
		        <td >${bean.title}</td>
		        <td >${bean.content}</td>
		        <td >${bean.start_time}</td>
		        <td >${bean.end_time}</td>
	        	<td>
					<a  href="javascript:editannouncement(${bean.id},'${bean.title}','${bean.content}','${bean.start_time}','${bean.end_time}');">编辑</a>
					<a href="${urlRemove}?id=${bean.id}">删除</a>
				</td>
	        </tr>
	    </c:forEach>
    </table>   
    <div class="table_bottom">${pagerinfo }</div>
    <!-- 遮罩层div-->
    <div class="cover" id="cover"></div> 
    <!-- 弹出层(add)div-->
    <div class="layer" id="layer_add" >
    	<form action="adminMethod!announcementCreate" onsubmit="return checknoticeform()" method="post">
    		<div class="nav_close">
	    		<a class="btclose" id="btclose" href="javascript:;">X</a>
	    	</div>
	    	<div>
	    		<label>标题:</label><input name="title" id="title1" type="text" placeholder="请输入标题,不能多于20字" />
	    	</div>
	    	<div>
	    		<label>内容:</label><textarea name="content" id="content" style="width: 300px; height: 100px;border: 1px solid gray;margin-top: 15px; overflow: scroll;" placeholder="请输入内容,多于20字,小于1000字" />
	    	</div>
	    	<div>
	    	    <label>开始时间:</label><input id="start" name="start" type="datetime-local" value=""/>
	    	</div>
	    	<div>
	    	    <label>结束时间:</label><input id="end" name="end" type="datetime-local" value=""/>
	    	</div>
	    	<div class="btn">
	    		<button id="sure_editRow" type="submit" onclick="test();">确定</button>
	    	</div>
    	</form>
    </div>
    <!-- 弹出层(editRow)div-->
    <div class="layer" id="layer_editRow" >
    	<form action="${urlUpdate}" method="post">
    		<div class="nav_close">
	    		<a class="btclose" id="btclose_editRow" href="javascript:;">X</a>
	    	</div>
	    	<input type="hidden" name="id" id="editid" value="editid"/>
            <div>
	    		<label>标题:</label><input name="title" id="title2" type="text" value=""/>
	    	</div>
	    	<div>
	    		<label>开始时间:</label><input name="start" id="start_time" type="text" value=""/>
	    	</div>
	    	<div>
	    		<label>结束时间:</label><input name="end" id="end_time" type="text" value=""/>
	    	</div>
	    	<div>
	    		<label>内容:</label><textarea name="content" id="content2" style="width: 300px; height: 100px;border: 1px solid gray;margin-top: 15px; overflow: scroll;" value="" />
	    	</div>
	    	<div class="btn">
	    	<button type="submit" id ="sure_editRow">确定</button>
	    	</div>
    	</form>
    </div>
    <script type="text/javascript" src="js/layer.js" ></script>
    <script>
        function editannouncement(editid,title,content,start_time,end_time){
             document.getElementById("editid").value=editid;
             document.getElementById("title2").value = title;
             document.getElementById("content2").value = content;
             document.getElementById("start_time").value = start_time;
             document.getElementById("end_time").value = end_time;
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
        function checknoticeform(){
        if (document.getElementById('title1').value=="")
             {
                alert("标题不能为空");
                return false;
             }
        if (document.getElementById('content').value=="")
        	{
        		alert("内容不能为空");
        		return false;
        	}
        if (document.getElementById('start').value=="")
        	{
        		alert("开始时间不能为空");
        		return false;
        	}
        if (document.getElementById('end').value=="")
        	{
        		alert("结束时间不能为空");
        		return false;
        	}
        }
     </script>
 	</body>
</html>