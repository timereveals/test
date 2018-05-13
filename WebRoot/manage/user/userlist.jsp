<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />
</head>
<body style="background-color: #CCCCFF;">

  <table width="1052" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
    <tbody>
      <tr>
        <th align=center colspan=16 style="height: 23px">${title }</th>
      </tr>
      <form action="${url }" method="post">
      <tr bgcolor="#DEE5FA">
        <td colspan="16" align="center" class=txlrow>
<div align="left">

用户名：<input type="text" name="username" value="${username}">
<input type="submit" value="搜索">
<br/>
</div>

        </td>
      </tr>
      </form>
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">用户名</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">密码</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">真实姓名</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">联系方式</td>
         <td width="6%" align="center" class="txlHeaderBackgroundAlternate">注册时间</td>
         <td width="6%" align="center" class="txlHeaderBackgroundAlternate">账户状态</td>
        <td width="4%" align="center" class=txlHeaderBackgroundAlternate>操作</td>
      </tr>
   
   <c:forEach items="${list}"  var="bean">
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">
       ${bean.name }
        </td>
        <td align="center" class="txlrow">
       ${bean.password }
        </td>
        <td align="center" class="txlrow">
       ${bean.realName }
        </td>
        <td align="center" class="txlrow">
       ${bean.phone }
        </td>
         <td align="center" class="txlrow">
      ${fn:substring(bean.createtime,0, 19)}
        </td>
        <td align="center" class="txlrow">
      <c:if test="${bean.status==0}">正常使用</c:if>
      <c:if test="${bean.status==1}">账户锁定</c:if>
        </td>
        
        <td align=center class=txlrow>

		<a href="${url2 }?id=${bean.id }">锁定用户</a>
		<br/>
		<a href="${url3 }?id=${bean.id }">解锁用户</a>
		</td>
       
      </tr>
   </c:forEach>
    <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow"  colspan="100">
        ${pagerinfo }
        </td>
       
       
      </tr>
    
    
      <tr bgcolor="#DEE5FA">
        <td colspan="16" align=center bgcolor="#DEE5FA" class=txlrow>
        
         </td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td colspan=16 align=center class=txlrow></td>
      </tr>
    </tbody></table>

</BODY>
  </HTML>