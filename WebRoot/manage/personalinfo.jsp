<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="css/personalinfo.css" />
    <link rel="stylesheet" href="css/common.css" />
  </head>
  <body>
  	<div id="title">${title }</div>
    <div class="show_userinfo" id="show_userinfo">
    	<p>您的个人信息</p>
    	<div><label>用户名:</label><span >${user.name}</span></div>
		<div><label>真实姓名:</label><span >${user.realName }</span></div>
		<div><label>手机号码:</label><span>${user.phone}</span></div>
		<div><label>身份证号:</label><span>${user.IDNumber}</span></div>
		<div><label>性别:</label><span >${user.sex }</span></div>
		<div><input type="button" value="修改" id="alterinfo"></input></div>
	</div>
	<div class="alter_userinfo" id="alter_userinfo">
		<p>修改您的个人信息</p>
		<form action="../adminMethod!modifyProfile" method="post">
		<div><label>用户名:</label><input type="text" name="name" id="name" value="${user.name }"></input></div>
		<div><label>真实姓名:</label><input type="text" name="realName" id="realname" value="${user.realName }"></input></div>
		<div><label>手机号码:</label><input type="text" name="phone" id="tel" value="${user.phone}"></input></div>
		<div><label>身份证号:</label><input type="text" name="idNumber" id="idcard" value="${user.IDNumber}"></input></div>
		<div><label>性别:</label><input type="text" name="sex" id="sex" value="${user.sex}"></input></div>
		<div class="alert_btn">
			<input type="submit" value="确认修改" id="confirminfo"></input>
			<input type="reset" value="取消" id="cancelinfo"></input>
		</div>
		</form>
	</div>			
	<script type="text/javascript">
		var btn1 = document.getElementById('alterinfo');
		var btn2 = document.getElementById('cancelinfo');
		var btn3 = document.getElementById('confirminfo');
        var div1 = document.getElementById('show_userinfo');
        var div2 = document.getElementById('alter_userinfo');
        btn1.onclick = function(){
                div1.style.display = 'none';
                div2.style.display = 'block';
        };
        
        btn2.onclick = function(){
                div1.style.display = 'block';
                div2.style.display = 'none';
        };


	</script>
 	</body>
</html>