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

班次：<input type="text" name="banci" value="${banci}">
<input type="submit" value="搜索">
<br/>

</div>

        </td>
      </tr>
      </form>
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">班次</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">类型</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">起点站</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">终点站</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">总票数</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">途径</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">可买票数</td>
 
      </tr>
   
   <c:forEach items="${list}"  var="bean">
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">
       ${bean.banci }
        </td>
        <td align="center" class="txlrow">
       ${bean.leixing.name }
        </td>
        <td align="center" class="txlrow">
       ${bean.qidianzhan }
        </td>
        <td align="center" class="txlrow">
       ${bean.zhongdianzhan }
        </td>
        <td align="center" class="txlrow">
       ${bean.zuowei }
        </td>
        <td align="center" class="txlrow">
       ${bean.tujing }
        </td>
         <td align="center" class="txlrow">
       ${bean.goumaishuliang }
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