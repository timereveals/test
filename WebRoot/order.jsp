<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0040)http://huochepiao.114piaowu.com/beijing/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><META content="IE=7.0000" 
http-equiv="X-UA-Compatible">
<TITLE>网上订票网站</TITLE>
<META content=ie=7 http-equiv=x-ua-compatible>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<link rel=stylesheet type=text/css href="css/common.css">
<link rel=stylesheet type=text/css href="css/trainbasic.css">
<link rel=stylesheet href="css/style.css">
<script language=javascript type=text/javascript src="js/ss_city.js"></script>
<script language=javascript type=text/javascript src="js/WdatePicker.js"></script>
<script language=javascript type=text/javascript src="js/jquery-1.4.2.min.js"></script>
<script language=javascript type=text/javascript src="js/valform.js"></script>
<script language=javascript type=text/javascript src="js/yudinglist.js"></script>
<script language="javascript" type="text/javascript"> 
	var code ; //在全局 定义验证码
	function createCode(){ 
	code = "";
	var codeLength = 4;//验证码的长度
	var checkCode = document.getElementById("checkCode");
	checkCode.value = "";
	var selectChar = new Array(2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');
	for(var i=0;i<codeLength;i++) {
	   var charIndex = Math.floor(Math.random()*32);
	   code +=selectChar[charIndex];
	}
	if(code.length != codeLength){
	   createCode();
	}
	checkCode.value = code;
}
function checkform(){
	var inputCode = document.getElementById("input1").value.toUpperCase();
	if(inputCode.length <=0) {
	   alert("请输入验证码！");
	   return false;
	}
	else if(inputCode != code ){
	   alert("验证码输入错误！");
	   createCode();
	   return false;		
	}	 
	if (document.getElementById('truenameid').value=="")
	{
		alert("真实姓名不能为空");
		return false;
	}
	
	if (document.getElementById('sfzid').value=="")
	{
		alert("身份证不能为空");
		return false;
	}
	
	if (document.getElementById('sfzid').value.length!=18)
	{
		alert("身份证必须为18位");
		return false;
	}
	
	if (document.getElementById('phoneid').value=="")
	{
		alert("手机不能为空");
		return false;
	}
	
	valid=/^0?1[3,5,8][0,1,2,3,4,5,6,7,8,9]\d{8}$/;  
	if(!valid.test(document.getElementById('phoneid').value)){
		alert("请输入正确的手机格式");
		return false;
	}	
	var reg1 =  /^\d+$/;
	if (document.getElementById('shuliangid').value.match(reg1) == null)
	{
		alert("购买数量必须为正整数");
		return false;
	}		
	return true;	
}
</script>
<META name=GENERATOR content="MSHTML 8.00.7601.18210"></HEAD>
<BODY onload="createCode();">

<%@ include file="head.jsp" %>


<!-- main -->
<DIV id=main class="section martop5">

<!-- left -->
<DIV class=aside>

<DIV class="ydhot position martop">



<DIV id=dginforesult class="yd-list yt ydlist">
<div style="font-size: 30px;font-weight: bold;" align="center">
填写订单信息
</div>
<br/>
<DIV style="WIDTH: 720px" class=chooseleft>
<form action="userMethod!createOrder?scheduleid=${schedule.id}" onsubmit="return checkform()" method="post" >

<TABLE class=sel_table border=0 cellSpacing=0 cellPadding=0 width="100%">
   <THEAD>
  <TR >
    <TH width="30%" align="right">真实姓名</TH>
    <TH width="70%">
    ${user.realName}
    </TH>
   </THEAD>
   <THEAD>
  <TR >
    <TH width="30%" align="right">身份证号</TH>
    <TH width="70%">
    ${user.IDNumber}
    </TH>
   </THEAD>

   <THEAD>
  <TR >
    <TH width="30%" align="right">起始站</TH>
    <TH width="70%">
    ${schedule.route.leaveStation}
    </TH>
   </THEAD>
   <THEAD>
  <TR >
    <TH width="30%" align="right">终点站</TH>
    <TH width="70%">
    ${schedule.route.arriveStation}
    </TH>
   </THEAD>
   <THEAD>
  <TR >
    <TH width="30%" align="right">出站时间</TH>
    <TH width="70%">
    ${schedule.leaveTime}
    </TH>
   </THEAD>
   <THEAD>
  <TR >
    <TH width="30%" align="right">到站时间</TH>
    <TH width="70%">
    ${schedule.arriveTime}
    </TH>
   </THEAD>
   <THEAD>
  <TR >
    <TH width="30%" align="right">购买数量：</TH>
    <TH width="70%">
    <input type="text" name="num" id="num" value="1"/>
    </TH>
   </THEAD>

   <THEAD>
  <TR >
    <TH width="30%" align="right">是否携带小孩</TH>
    <TH>
    <input type="radio" name="isWithChildren" size="45"  id="isWithChildren" value="1">是</input>
    <input type="radio" name="isWithChildren" size="45"  id="isWithChildren" value="0">否</input>
    </TH>
   </THEAD>

    <THEAD>
  <TR >
    <TH width="30%" align="right">请输入验证码：</TH>
    <TH width="70%"><input type="text" id="input1" size="45"/></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">验证码：</TH>
    <TH width="70%"><input type="text" id="checkCode" class="code" style="width: 55px" size="20" readonly="readonly"/> <a href="####" onclick="createCode()">看不清楚</a></TH>
   </THEAD>
   
   <THEAD>
  <TR >
    <TH width="30%" align="right">操作：</TH>
    <TH width="70%">
     <INPUT class=list-yd  value=提交 type="submit"  /> 

   	&nbsp;&nbsp;&nbsp;&nbsp;
   	<INPUT class=list-yd  value=返回 type="button" onclick="javascript:history.go(-1)"  /> 

   					</TH>
   </THEAD>
  </TABLE>
  </form>
  </DIV>
</DIV></DIV></DIV>


<%@ include file="right.jsp" %>


</BODY></HTML>
