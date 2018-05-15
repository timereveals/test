<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上订票管理后台</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>


<body>

<div align="center"  style="padding-top: 50px;">
<span style="font-size: 40px;color: white;font-weight: bold;">网上订票管理后台</span>

<form method="post"  name="NETSJ_Login" action="adminMethod!login">
	<div class="panel-lite">
		<div class="thumbur">
			<div class="icon-lock"></div>
		</div>
		<h4>用户登录</h4>
		<div class="form-group">
			<input required="required" class="form-control" name="name" id="user"/>
			<label class="form-label">用户名    </label>
		</div>
		<div class="form-group">
		<input type="password" required="required" class="form-control" name="password" id="pwd" size="21"/>
		<label class="form-label">密　码</label>
		</div>
		<button class="floating-btn" ><i class="icon-arrow"></i></button>
		</br>
		<div >
		<input type="submit" class="man_login" name="submit"  value=" 登  录 "> 
		<input type="reset" class="man_cancel" name="Submit" value=" 取  消 ">
		</div>
		<a class="returnhome" href="../">返回首页  </a>
	</div>
</form>
</div>



</body>
</html>
