<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>站点管理</title>
        <link rel="stylesheet" href="css/stationmanage.css" />
        <link rel="stylesheet" href="css/common.css" />
        <script>
        	function changeway(){
        	var select=document.getElementById("select");
        	var select1=document.getElementById("select1");
        	var select2=document.getElementById("select2");
        	var select3=document.getElementById("select3");
        	var val=select.options[select.selectedIndex].value;
		        if(val=="1"){
		        	select1.style.display = "block";
		        	select2.style.display = "none";
		        	select3.style.display = "none";
		        }if(val=="2"){
		        	select1.style.display = "none";
		        	select2.style.display = "block";
		        	select3.style.display = "none";
		        }if(val=="3"){
		        	select1.style.display = "none";
		        	select2.style.display = "none";
		        	select3.style.display = "block";
		        }
	        }	
        </script>
    </head>
    <body>
		<div id="title" >站点管理</div>
		<div class="station1">
			<div class="station_tip">请选择所在城区或所在区县进行搜索</div>
			<div class="station_select">
				<form action="?" method="get">				
					<dl id="select_city">
						<dt>所在城区：</dt>
						<dd>
							<select  id="select"  onchange="changeway()">
								<option id="unlimit" value="1">不限制</option>
								<option id="city" value="2">市辖区</option>
								<option id="country" value="3">县</option>
							</select>
						</dd>
					</dl>
					<!--当所在城区选择不限制  所在区县-->
					<dl id="select1">
						<dt>所在区县：</dt>
						<dd>
							<select name="area" id="area">
								<option value="">不限制</option>							
							</select>
						</dd>
					</dl>
					<!--当所在城区选择市辖区  所在区县-->
					<dl id="select2">
						<dt>所在区县：</dt>
						<dd>
							<select name="area" id="area">
								<option value="">不限制</option>	
								<option value="500101">万州区</option>
								<option value="500102">涪陵区</option>
								<option value="500103">渝中区</option>
								<option value="500104">大渡口区</option>
								<option value="500105">江北区</option>
								<option value="500106">沙坪坝区</option>
								<option value="500107">九龙坡区</option>
								<option value="500108">南岸区</option>
								<option value="500109">北碚区</option>
								<option value="500110">綦江区</option>
								<option value="500111">大足区</option>
								<option value="500113">巴南区</option>
								<option value="500112">渝北区</option>
								<option value="500114">黔江区</option>
								<option value="500115">长寿区</option>
								<option value="500116">江津区</option>
								<option value="500117">合川区</option>
								<option value="500118">永川区</option>
								<option value="500120">璧山区</option>
								<option value="500151">铜梁区</option>
								<option value="500119">南川区</option>
								<option value="500226">荣昌区</option>
							</select>
						</dd>
					</dl>
					<!--当所在城区选择县  所在区县-->
					<dl id="select3">
						<dt>所在区县：</dt>
						<dd>
							<select name="area" id="area">
								<option value="">不限制</option>	
								<option value="500234">开县</option>
								<option value="500228">梁平县</option>
								<option value="500229">城口县</option>
								<option value="500230">丰都县</option>
								<option value="500231">垫江县</option>
								<option value="500232">武隆县</option>
								<option value="500233">忠县</option>
								<option value="500235">云阳县</option>
								<option value="500236">奉节县</option>
								<option value="500237">巫山县</option>
								<option value="500238">巫溪县</option>
								<option value="500240">石柱土家族自治县</option>
								<option value="500241">秀山土家族苗族自治县</option>
								<option value="500242">酉阳土家族苗族自治县</option>
								<option value="500243">彭水苗族土家族自治县</option>					
							</select>
						</dd>
					</dl>
					<input type="button" value="搜索" id="submit_search" >
					<input type="button" value="添加" id="submit_add" >
				</form>
			</div>
		</div>
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