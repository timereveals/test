<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="css/personalinfo.css" />
    <link rel="stylesheet" href="css/common.css" />
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
            function checkalterform(){
                if (document.getElementById('name').value=="")
                	{
                		alert("用户名不能为空");
                		return false;
                	}
                if (document.getElementById('realName').value=="")
                	{
                		alert("姓名不能为空");
                		return false;
                	}
                var chineseReg = /^[\u4E00-\u9FA5]{2,4}$/;
            	if(!chineseReg.test(document.getElementById('realName').value))
                    {
                          alert('姓名请填写中文2到4个字!!');
                          return false;
                    }
                if (document.getElementById('phone').value=="")
                	{
                		alert("联系方式不能为空");
                		return false;
                	}
                valid=/^0?1[3,5,8][0,1,2,3,4,5,6,7,8,9]\d{8}$/;
            	if(!valid.test(document.getElementById('phone').value))
                    {
                        alert("请输入正确的手机格式");
                        return false;
                    }
                if (document.getElementById('idNumber').value=="")
                	{
                		alert("身份证号不能为空");
                		return false;
                	}
                var IDNumberReg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
            	if (!IDNumberReg.test(document.getElementById("idNumber").value))
                    {
                        alert("请输入正确的身份证号");
                        return false;
                    }
            }
    </script>
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
		<form action="../adminMethod!modifyProfile" onsubmit="return checkalterform()" method="post">
		<div><label>用户名:</label><input type="text" name="name" id="name" value="${user.name }" ></input></div>
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



	</script>
 	</body>
</html>