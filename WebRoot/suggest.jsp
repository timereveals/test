<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>在线咨询</title>
	<link rel="stylesheet" href="css/suggest.css" />
  </head>
  
  <body>
   <div class="suggest">
        <form method="post" action="userMethod!word">
            <div class="title_suggest">在线咨询</div>
            <div  class='sourceType'>
                <div>
                    <label>用户名：</label><input type="text" name="name"  readonly="readonly" style='background-color:rgba(221, 221, 221, 0.28);' value="${user.name}" ></input>
                </div>
                <div>
                    <label>手机：</label><input type="text" name="phone"  readonly="readonly" style='background-color:rgba(221, 221, 221, 0.28);' value="${user.phone}" ></input>
                </div>
                <div >
                    <label>内容：</label><textarea name="wordContent" cols="30" id="wordContent" placeholder="请输入4-200个字符" ></textarea>
                </div>
                <div >
                    <input id="submit" type="submit" value="提交"/>
                </div>
            </div>
   		</form>
   	</div>
  </body>
</html>
