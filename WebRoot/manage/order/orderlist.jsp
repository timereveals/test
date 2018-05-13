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

订单号：<input type="text" name="banci" value="${orderid}">
班次：<input type="text" name="orderid" value="${banci}">
<input type="submit" value="搜索">

</div>

        </td>
      </tr>
      </form>
      <tr align="center" bgcolor="#799AE1">
       <td width="6%" align="center" class="txlHeaderBackgroundAlternate">订单状态</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">订单号</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">下单时间</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">班次</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">票数</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">单价</td>
         <td width="6%" align="center" class="txlHeaderBackgroundAlternate">总价</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">真实姓名</td>
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">身份证号码</td>

        <td width="4%" align="center" class=txlHeaderBackgroundAlternate>操作</td>
      </tr>
   
   <c:forEach items="${list}"  var="bean">
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">
       ${bean.status }
        </td>
          <td align="center" class="txlrow">
       ${bean.orderid }
        </td>
        <td align="center" class="txlrow">
      ${fn:substring(bean.createtime,0, 19)}
        </td>
        <td align="center" class="txlrow">
      ${bean.piaojia.xianlu.banci }
        </td>
        <td align="center" class="txlrow">
      ${bean.shuliang }
        </td>
        <td align="center" class="txlrow">
      ${bean.danjia}
        </td>
         <td align="center" class="txlrow">
       ${bean.zongjia }
        </td>
        <td align="center" class="txlrow">
      ${bean.truename }
        </td>
        <td align="center" class="txlrow">
      ${bean.sfz }
        </td>
        <td align=center class=txlrow>

		<a href="${url2 }update3?id=${bean.id }">查看</a>
		<br/>
		<a href="${url2 }delete?id=${bean.id }"> 完成取票</a>
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