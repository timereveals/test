<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>






<!-- right -->
<DIV class=article>

<DIV class="yd-tittle yd-right martop">
<H3>网站公告</H3><B class=hotydr></B></DIV>
<br/><br/>
<%
org.springframework.web.context.WebApplicationContext app = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
dingpiao.dao.AnnouncementDAO announcementDAO = (dingpiao.dao.AnnouncementDAO)app.getBean("announcementDAO");
List<dingpiao.model.Announcement> list = announcementDAO.selectBeanList(0,10,"");

for(dingpiao.model.Announcement bean:list){
	out.println("<a href='userMethod!announcement?id="+bean.getId()+"'><span style='font-size: 20px;font-weight: bold;'>"+bean.getTitle()+"</span></a>");
	out.println("<br/>");out.println("<br/>");out.println("<br/>");
}
%>


</DIV>


