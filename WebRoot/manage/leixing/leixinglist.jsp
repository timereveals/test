<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

类型：<input type="text" name="name" value="${name}">
<input type="submit" value="搜索">
<br/>
<a href="${url2 }add">添加新类型</a>
</div>

        </td>
      </tr>
      </form>
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">类型</td>
        <td width="4%" align="center" class=txlHeaderBackgroundAlternate>操作</td>
      </tr>
   
   <c:forEach items="${list}"  var="bean">
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">
       ${bean.name }
        </td>
        <td align=center class=txlrow>
		<a href="${url2 }update?id=${bean.id }">修改</a>&nbsp;&nbsp;&nbsp;
		<a href="${url2 }update3?id=${bean.id }">查看</a>&nbsp;&nbsp;&nbsp;
		<a href="${url2 }delete?id=${bean.id }"> 删除</a>
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