<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>

<TITLE>网上订票网站</TITLE>
<META content=ie=7 http-equiv=x-ua-compatible>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<link rel=stylesheet href="css/personal.css">
<script type="text/javascript" src="js/jquery-1.11.0.min.js" ></script>
<BODY>
<%@ include file="head.jsp" %>
<!-- main -->
<div class="personal">
    <div class="person_nav">
        <ul>
        	<label >个人信息</label>
        	<a href="javascript:;" onclick="doclk('userinfo.jsp')"><li  id="nav-userinfo"  >我的资料</li></a>
        	<a href="javascript:;" onclick="doclk('alertpwd.jsp')"><li  id="nav-alertpwd" >修改密码</li></a>
        	<a href="javascript:;" onclick="doclk('userMethod!passengerManage')"><li  id="nav-passenger" >常用乘车人</li></a>
        	<a href="javascript:;" onclick="doclk('userMethod!wordList')"><li  id="nav-message" >消息</li></a>
        	</br>
        	<label>客户服务</label>
        	<a href="javascript:;" onclick="doclk('suggest.jsp')"><li  id="nav-suggest">在线咨询</li></a>
        </ul>
        </div>
      	<div id="content"  style="background: #f2f2f2">


      	</div>
    </div>
</div>
<script type="text/javascript">
	function doclk(url){
		$("#content").load(url);
	}
</script>


</BODY></HTML>
