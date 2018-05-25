<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0040)http://huochepiao.114piaowu.com/beijing/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META content="IE=7.0000" http-equiv="X-UA-Compatible">
<TITLE>网上订票网站</TITLE>
<META content=ie=7 http-equiv=x-ua-compatible>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="css/semantic.min.css">
<LINK rel=stylesheet type=text/css href="css/register.css">
<LINK rel=stylesheet type=text/css href="awesome/css/font-awesome.min.css">
<script language=javascript type=text/javascript src="js/jquery-1.4.2.min.js"></script>
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
		
function checkregisterform(){
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
    var chineseReg = /^[\u4E00-\u9FA5]{2,4}$/;
	if(!chineseReg.test(document.getElementById('realName').value)) {
		  alert('真实姓名请填写中文2到4个字!!');
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
    if (document.getElementById('IDNumber').value=="")
        {
            alert("身份证号不能为空");
            return false;
        }
    var IDNumberReg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	if (!IDNumberReg.test(document.getElementById("IDNumber").value))
	{
		alert("请输入正确的身份证号");
		return false;
	}
	if (document.getElementById('email').value=="")
	{
		alert("email不能为空");
		return false;
	}

	return true;
	
}
	</script>

<META name=GENERATOR content="MSHTML 8.00.7601.18210"></HEAD>
<BODY onload="createCode();">
<form action="userMethod!register" onsubmit="return checkregisterform()" method="post" >
<i class="fa fa-user-circle-o" aria-hidden="true" style="width:100%;font-size:70px; text-align:center;margin-top:10px;"></i>
<h2 class="ui center aligned icon header"> 用户注册 </h2>
		<div class="ui input focus">
		    <label>用&nbsp;&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
		    <input type="text" placeholder="请输入用户名" name="name" size="45"  id="name"/>
		</div>
		<div class="ui input focus">
		    <label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
		    <input type="password" placeholder="请输入密码" name="password" size="45" id="password"/>
	    </div>
	    <div class="ui input focus">
		    <label>确&nbsp;认&nbsp;密&nbsp;码：</label>
		    <input type="password" placeholder="请再次输入密码" name="passwordconfirm" size="45" id="passwordconfirm"/>
	    </div>
   		<div class="ui input focus">
		    <label>真&nbsp;实&nbsp;姓&nbsp;名：</label>
		    <input type="text" placeholder="请输入真实姓名" name="realName" size="45" id="realName"/>
	    </div>
	    <div class="ui input focus">
		    <label>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</label>
		    <input type="text" placeholder="请输入手机号" name="phone" size="45" id="phone"/>
	    </div>
	    <div class="ui input focus">
        	<label>身&nbsp;份&nbsp;证&nbsp;号：</label>
        	<input type="text" placeholder="请输入身份证号" name="IDNumber" size="45" id="IDNumber"/>
        </div>
        <div class="ui input focus">
              <label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
              <select id="sex" name="sex" style="width:371px;height:38px;border:1px solid rgb(133,183,217);border-radius:5px;">
                <option value="男">男</option>
                <option value="女">女</option>
              </select>
        </div>
	    <div class="ui input focus">
		    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：</label>
		    <input type="email" placeholder="请输入email" name="email" size="45" id="email"/>
	    </div>
		<div class="ui input focus">
		    <label>验&nbsp;&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;码&nbsp;：</label>
		    <input type="text" placeholder="请输入验证码" id="input1" size="45"/>
	    </div>
	    <div >
		    <label>验&nbsp;&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;码&nbsp;：</label>
		    <input type="text" id="checkCode" class="code" size="20" readonly="readonly"/> 
		    <a href="####" onclick="createCode()">看不清楚</a>
		</div>
		<div>    
			<INPUT class="list-yd"  value="注&nbsp;&nbsp;册" type="submit"  /> 
			<a href="index.jsp"><INPUT class="list-yd"  value="返&nbsp;回&nbsp;首&nbsp;页" type="button" ></input> </a>
		</div> 	
		<div class="log_btn">			
			<p class="message">已经有用户? <a href="login.jsp">立刻登录</a></p>
		</div>
  </form>

</BODY></HTML>
