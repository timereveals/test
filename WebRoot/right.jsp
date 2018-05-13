<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- right -->
<DIV class=article>

<DIV class="yd-tittle yd-right martop">
<H3>网站公告</H3><B class=hotydr></B></DIV>
<br/><br/>
<c:forEach items="${announcements}" var="bean">
<a href="userMethod!announcement?id=${bean.id}">${bean.title}</a>
<br/>
</c:forEach>
</DIV>


