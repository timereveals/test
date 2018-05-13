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
    
    <title>message消息</title>
	<link rel="stylesheet" type="text/css" href="css/message.css">

  </head>
  
  <body>
       <div class="title_message">消息</div>
       <div class="show_word_status">
            <a href="javascript:useraction!wordList?list='1'";"><input type="button" value="全部" /></a>
            <a href="javascript:useraction!wordList?list='2'";"><input type="button" value="已回复"  /></a>
            <a href="javascript:useraction!wordList?list='3';"><input type="button" value="未回复" /></a>
       </div>
       <c:forEach items="${wordList}"  var="bean2">
       <div class="show_word_detail">
            <div>
                <label>&nbsp;&nbsp;状&nbsp;&nbsp;&nbsp;态&nbsp;&nbsp;：</label><input type="text" readonly="ture" value="${bean2.status}" />
            </div>
            <div>
                 <label>留言时间：</label><input type="text" readonly="ture" value="${bean2.word_time}"/>
            </div>
            <div>
                <label>留言内容：</label><textarea  readonly="ture" >${bean2.word_content}</textarea>
            </div>
            <div>
                <label>回复时间：</label><input type="text" readonly="ture" value="${bean2.reply_time}"/>
            </div>
            <div>
                <label>回复内容：</lable><textarea  readonly="ture">${bean2.reply_content}</textarea>
            </div>
       </div>
       </c:forEach>

  </body>
</html>
