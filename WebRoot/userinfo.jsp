<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>	我的资料</title>
	<link rel="stylesheet" href="css/userinfo.css" />
    <script type="text/javascript">
        function checkeditform(){
            if (document.getElementById('name').value=="")
                {
                	alert("用户名不能为空");
                	return false;
                }
            if (document.getElementById('realName').value=="")
                {
                	alert("真实姓名不能为空");
                	return false;
                }
            var chineseReg = /^[\u4E00-\u9FA5]{2,4}$/;
        	if(!chineseReg.test(document.getElementById('realName').value))
        	    {
        		  alert('真实姓名请填写中文2到4个字!!');
        		  return false;
                }
            if (document.getElementById('phone').value=="")
                {
                	alert("联系方式不能为空");
                	return false;
                }
            valid=/^0?1[3,5,7,8][0,1,2,3,4,5,6,7,8,9]\d{8}$/;
            if(!valid.test(document.getElementById('phone').value))
                {
                    alert("请输入正确的手机格式");
                    return false;
                }
            if (document.getElementById('IDNumber').value=="")
                {
                	alert("身份证号不能为空");
                	return false;
                }
            if (document.getElementById('IDNumber').value.length != 18)
                {
                    alert("请输入正确的身份证号");
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
            var sex = document.getElementById('sex').value;
            if (sex=="")
                {
                	alert("性别不能为空");
                	return false;
                }
            if (sex!="男" && sex !="女")
                {
                    alert("性别必须为男或女");
                    return false;
                }
        }
    </script>
  </head>
  <body>
    <div class="show_userinfo" id="show_userinfo">
		<p>您的基础信息</p>
		<div>用户名称:<span >${user.name }</span></div>
		<div>真实姓名:<span>${user.realName}</span></div>
		<div>手机号码:<span>${user.phone}</span></div>
		<div>身份证号:<span>${user.IDNumber}</span></div>
		<div>&nbsp;&nbsp;email&nbsp;&nbsp;&nbsp;:<span>${user.email}</span></div>
		<div>&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;:<span>${user.sex}</span></div>
		<div>&nbsp;状&nbsp;&nbsp;&nbsp;&nbsp;态&nbsp;&nbsp;:<span>${user.status}</span></div>
		<div><input type="button" value="修改" id="alterinfo"></input></div>
	</div>
	<form action="userMethod!alteruserinfo" onsubmit="return checkeditform()" method="post">
	<div class="alter_userinfo" id="alter_userinfo">
		<p>修改您的基础信息</p>
		<div>用户名称:<input type="text" name="name" id="name" value="${user.name }" ></input></div>
		<div>真实姓名:<input type="text" name="realName" id="realName" value="${user.realName }"></input></div>
		<div>手机号码:<input type="text" name="phone" id="phone" value="${user.phone}"></input></div>
		<div>身份证号:<input type="text" name="IDNumber" id="IDNumber" value="${user.IDNumber}"></input></div>
		<div>&nbsp;&nbsp;email&nbsp;&nbsp;&nbsp;:<input type="email" name="email" id="email" value="${user.email}"></input></div>
        <div>&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;:<input type="text" name="sex" id="sex" value="${user.sex}"></input></div>
        <div>&nbsp;状&nbsp;&nbsp;&nbsp;&nbsp;态&nbsp;&nbsp;:<input type="text" name="status" id="status" value="${user.status}" readonly="true"></input></div>
		<div class="alert_btn">				
			<input type="button" value="取消" id="cancelinfo"></input>
			<input type="submit" value="确认修改" id="submitinfo"></input>
		</div>
		<form>
	</div>

	<script type="text/javascript">
			var btn_1 = document.getElementById('alterinfo');
			var btn_2 = document.getElementById('cancelinfo');
            var div_1 = document.getElementById('show_userinfo');
            var div_2 = document.getElementById('alter_userinfo');
        btn_1.onclick = function(){
                div_1.style.display = 'none';
                div_2.style.display = 'block';
        };

        btn_2.onclick = function(){
                div_1.style.display = 'block';
                div_2.style.display = 'none';
        };


	</script>

  </body>
</html>
