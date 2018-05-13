<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>忘记密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=stylesheet type=text/css href="css/semantic.min.css">
<LINK rel=stylesheet type=text/css href="awesome/css/font-awesome.min.css">
<LINK rel=stylesheet type=text/css href="css/register.css">
<SCRIPT language=javascript type=text/javascript src="js/jquery-1.4.2.min.js"></SCRIPT>
<script language=javascript type="text/javascript" src="js/semantic.min.js"></script>
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
		
function checkforgetpwdform(){
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
	 if (document.getElementById('name').value=="")
	{
		alert("用户名不能为空");
		return false;
	}
	var valid=/^\w+$/;
	if(!valid.test(document.getElementById('name').value)){
		alert("用户名必须是数字、字母或下划线");
		return false;
	}
	if (document.getElementById('password').value=="")
	{
		alert("密码不能为空");
		return false;
	}
	if (document.getElementById('password').value.length<6)
	{
		alert("密码长度必须大于6位");
		return false;
	}
	if (document.getElementById('passwordconfirm').value != document.getElementById('password').value)
	{
		alert("确认密码与密码不一致");
		return false;
	}	 
	if (document.getElementById('realName').value=="")
	{
		alert("真实姓名不能为空");
		return false;
	}

	if (document.getElementById('phone').value=="")
	{
		alert("手机不能为空");
		return false;
	}
	valid=/^0?1[3,5,8][0,1,2,3,4,5,6,7,8,9]\d{8}$/;  
	if(!valid.test(document.getElementById('phone').value)){
		alert("请输入正确的手机格式");
		return false;
	}	
	return true;	
}
</script>

<META name=GENERATOR content="MSHTML 8.00.7601.18210"></HEAD>
<BODY onload="createCode();">
<form action="userMethod!forgetpwd" onsubmit="return checkforgetpwdform()"  method="post" >
<h2 class="ui center aligned icon header"><i class="circular users icon "></i> 忘记密码 </h2>
		<div class="ui input focus">
		    <label>用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名：</label>
		    <input type="text" placeholder="请输入用户名" name="name" size="45"  id="name"/>
		</div>
		<div class="ui input focus">
        		    <label>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</label>
        		    <input type="text" placeholder="请输入手机号码" name="phone" size="45" id="phone"/>
        	    </div>
		<div class="ui input focus">
		    <label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
		    <input type="password" placeholder="请输入新密码" name="password" size="45" id="password"/>
	    </div>
	    <div class="ui input focus">
		    <label>确认密码：</label>
		    <input type="password" placeholder="请确认新密码" name="passwordconfirm" size="45" id="passwordconfirm"/>
	    </div>
   		<div class="ui input focus">
		    <label>真实姓名：</label>
		    <input type="text" placeholder="请真实姓名" name="realName" size="45" id="realName"/>
	    </div>
		<div class="ui input focus">
		    <label>验&nbsp;&nbsp;证&nbsp;&nbsp;码：</label>
		    <input type="text" placeholder="请输入验证码" id="input1" size="45"/>
	    </div>
	    <div >
		    <label>验&nbsp;&nbsp;证&nbsp;&nbsp;码：</label>
		    <input type="text" id="checkCode" class="code" size="20" readonly="readonly"/> 
		    <a href="####" onclick="createCode()">看不清楚</a>
		</div>
		<div>    
			<INPUT class="list-yd"  value="提&nbsp;&nbsp;&nbsp;交" type="submit"  /> 
			<a href="index.jsp"><INPUT class="list-yd"  value="返&nbsp;回&nbsp;首&nbsp;页" type="button"   /> </a>
		</div> 	
		<div class="log_btn">			
			<p class="message">想起密码啦? <a href="login.jsp">立刻登录</a></p>
		</div>
  </form>
  </body>
</html>
