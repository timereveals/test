<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/common.css" />
        <link rel="stylesheet" href="css/alertpwd.css" />

        <script type="text/javascript">
            function checkalterpwdform(){
                if (document.getElementById('password1').value=="")
                	{
                		alert("原密码不能为空");
                		return false;
                	}
                if (document.getElementById('password2').value=="")
                	{
                		alert("新密码不能为空");
                		return false;
                	}
                if (document.getElementById('password3').value=="")
                	{
                		alert("确认密码不能为空");
                		return false;
                	}
                if (document.getElementById('password2').value != document.getElementById('password3').value)
                    {
                        alert("确认密码与密码不一致");
                        return false;
                    }
            }
        </script>
    </head>
    <body>
    	<div id="title">修改密码</div>
    	    <form action="../adminMethod!changePassword" onsubmit="return checkalterpwdform()"  method="post">
			<div class="op_alertpwd">
				<div>
					<label>&nbsp;原&nbsp;密&nbsp;码：</label>
					<input name="password1" id="password1" type="password"placeholder="请输入您的原密码" />
				</div>
				<div>
					<label>&nbsp;新&nbsp;密&nbsp;码：</label>
					<input name="password2" id="password2" type="password"placeholder="请输入您的新密码" />
				</div>
				<div>
					<label>确认密码：</label>
					<input name="password3" id="password3" type="password"placeholder="请再次输入您的新密码" />
				</div>
			</div>
			<div class="btn_alertpwd">
				<a href="#"><input type="submit" value="确定" /></a>
				<a href="#"><input type="reset" value="取消" /></a>
			</div>
			</form>
 	</body>
</html>