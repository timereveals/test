<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- right -->

<div class="yd-tittle yd-right martop" style="width:200px;height:100%;border:1px solid rgb(30,191,245);">
<H3>网站公告</H3><B class=hotydr></B></DIV>
<br/><br/>
<c:forEach items="${announcements}" var="bean">
    <div style="width:200px;height:25px;font-size:16px;color:block;line-height:25px;">
        <a href="userMethod!announcement?id=${bean.id}">${bean.title}</a>
    <div>
</c:forEach>
</div>


