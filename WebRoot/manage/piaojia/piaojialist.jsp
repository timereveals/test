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
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">班次</td>
      
          <td width="6%" align="center" class="txlHeaderBackgroundAlternate">出发时间</td>
           <td width="6%" align="center" class="txlHeaderBackgroundAlternate">到站时间</td>
             <td width="6%" align="center" class="txlHeaderBackgroundAlternate">开始站点</td>
         <td width="6%" align="center" class="txlHeaderBackgroundAlternate">结束站点</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">票价（￥）：</td>
        <td width="4%" align="center" class=txlHeaderBackgroundAlternate>操作</td>
      </tr>
   
   <c:forEach items="${list}"  var="bean">
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">
       ${bean.xianlu.banci }
        </td>
       
         <td align="center" class="txlrow">
       ${bean.chufashijian }
        </td>
         <td align="center" class="txlrow">
       ${bean.daozhanshijian }
        </td>
         <td align="center" class="txlrow">
       ${bean.kaishizhan }
        </td>
         <td align="center" class="txlrow">
       ${bean.jieshuzhan }
        </td>
        <td align="center" class="txlrow">
       ${bean.jiage }
        </td>
       
        <td align=center class=txlrow>
       
      
        
        
       
        <a href="${url2 }update?id=${bean.id }">修改票价</a>&nbsp;&nbsp;&nbsp;
    
		

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