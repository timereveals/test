<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>修改密码</title>
	<link rel="stylesheet" href="css/alertpwd.css" />
	</head>
	<body>
			<div class="title_alertpwd">修改密码</div>
			<form action="userMethod!alterpwd" method="post">
                <div class="op_alertpwd">
                    <div>
                        <label>&nbsp;原&nbsp;密&nbsp;码：</label>
                        <input type="password" name="password1" placeholder="请输入您的原密码" />
                    </div>
                    <div>
                        <label>&nbsp;新&nbsp;密&nbsp;码：</label>
                        <input type="password" name="password2" placeholder="请输入您的新密码" />
                    </div>
                    <div>
                        <label>确认密码：</label>
                        <input type="password" name="password3" placeholder="请再次输入您的新密码" />
                    </div>
                </div>
                <div class="btn_alertpwd">
                    <input type="submit" value="确定" />
                    <input type="reset" value="取消" />
                </div>
			</form>
  </body>
</html>
