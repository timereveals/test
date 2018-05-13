<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/common.css" /> />
        <link rel="stylesheet" href="css/alertpwd.css" />
    </head>
    <body>
    	<div id="title">修改密码</div>
    	    <form action="../adminMethod!adminCreate" method="post">
			<div class="op_alertpwd">
				<div>
					<label>姓名</label>
					<input type="text" name="name"/>
				</div>
				<div>
					<label>&nbsp;&nbsp;密&nbsp;码：</label>
					<input type="text" name="password"/>
				</div>
				<div>
					<label>确认密码：</label>
					<input type="text" name="passwordComfirm"/>
				</div>
				<div>
					<label>真实姓名：</label>
					<input type="text" name="realName"/>
				</div>
				<div>
					<label>身份证号</label>
					<input type="text" name="idNumber"/>
			    </div>
				<div>
					<label>性别</label>
					<input type="text" name="sex"/>
			    </div>
				<div>
					<label>联系方式</label>
					<input type="text" name="phone"/>
			    </div>
			<div class="btn_alertpwd">
				<a href="#"><input type="submit" value="确定" /></a>
				<a href="#"><input type="reset" value="取消" /></a>
			</div>
			</form>
		</div>
 	</body>
</html>