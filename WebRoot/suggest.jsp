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
            <ul  class='sourceType'>
                <li>
                    用户名：<input type="text" name="name"  readonly="readonly" style='background-color:rgba(221, 221, 221, 0.28);' value="${user.name}" ></input>
                </li>
                <li>
                    手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：<input type="text" name="phone"  readonly="readonly" style='background-color:rgba(221, 221, 221, 0.28);' value="${user.phone}" ></input>
                </li>
                <li >
                    <label>内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容&nbsp;&nbsp;：</label><textarea name="wordContent" cols="30" id="wordContent" placeholder="请输入4-200个字符" style="border:1px solid grey;overflow:scroll" ></textarea>
                </li>
                <li >
                    <input type="submit" value="提交"/>
                </li>
            </ul>
   		</form>
   	</div>
  </body>
</html>
