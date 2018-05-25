   <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0040)http://huochepiao.114piaowu.com/beijing/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>
<META content="IE=7.0000" http-equiv="X-UA-Compatible">
<TITLE>网上订票网站</TITLE>
<META content=ie=7 http-equiv=x-ua-compatible>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="css/semantic.min.css">
<LINK rel=stylesheet type=text/css href="awesome/css/font-awesome.min.css">
<LINK rel=stylesheet type=text/css href="css/login.css">
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
             if (document.getElementById('usernameid').value=="")
            {
                alert("用户名不能为空");
                return false;
            }
            if (document.getElementById('passwordid').value=="")
            {
                alert("密码不能为空");
                return false;
            }
            return true;
}
</script>
<META name=GENERATOR content="MSHTML 8.00.7601.18210"></HEAD>
<BODY onload="createCode();">
	<form  class="login_form" action="userMethod!login" onsubmit="return 1checkregisterform()" method="post" >
	<i class="fa fa-user-circle-o" aria-hidden="true" style="width:100%;font-size:70px; text-align:center;margin-top:10px;"></i>
		<h2 class="ui center aligned icon header">用户登录 </h2>
		<div class="ui input focus div1">
		    <label>用户名：</label>
		    <input type="text" placeholder="请输入用户名" name="name" size="45"  id="usernameid"/>
		</div>
		<div class="ui input focus div1">
		    <label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
		    <input type="password" placeholder="请输入密码" name="password" size="45" id="passwordid"/>
	    </div>
	    <div class="ui input focus div1">
		    <label>验证码：</label>
		    <input type="text" placeholder="请输入验证码" id="input1" size="45"/>
	    </div>
	    <div >
		    <label>验证码：</label>
		    <input type="text" id="checkCode" class="code" size="20" readonly="readonly"/> 
		    <a href="####" onclick="createCode()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;看不清楚</a>
		</div>
		<div >    
			<INPUT class="list-yd "  value="登&nbsp;&nbsp;&nbsp;录" type="submit"  /> 
			<a href="index.jsp"><INPUT class="list-yd "  value="返&nbsp;回&nbsp;首&nbsp;页" type="button" />  </a> 
		</div> 
		<div class="reg_btn">
			<a class="fg_pwd" href="forgetpwd.jsp">忘记密码?</a>
			<p class="message">还没有账户? <a href="register.jsp">立刻注册</a></p>
		</div>					     
	 </form>
</BODY>
</HTML>
