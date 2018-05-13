<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />




</head>
<body style="background-color: #CCCCFF;">

<form action="${url }?id=${bean.id }" method="post" onsubmit="return checkform() " >
  <table width="1052" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
    <tbody>
      <tr>
        <th align=center colspan=16 style="height: 23px">${title }</th>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       订单号：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
      ${order.orderid }
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
      下单时间：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
       ${fn:substring(order.createtime,0, 19)}
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       班次：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
      ${order.piaojia.xianlu.banci }
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
      出发站点：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
     ${order.piaojia.kaishizhan }
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
     到达站点：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
      ${order.piaojia.jieshuzhan }
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       出发时间：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
       ${order.piaojia.chufashijian }
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
     到站时间：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
      ${order.piaojia.daozhanshijian }
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       真实姓名：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
       ${order.truename }
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
     身份证号码：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
       ${order.sfz }
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       手机：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
       ${order.phone }
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
    购买数量:
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
      ${order.shuliang }
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       单价：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
       ￥${order.danjia }
        </td>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       总价：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
       ￥${order.zongjia }
        </td>
      </tr>
      
      
      
       
      
       <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
        操作：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>

        <input type="button" value="返回"  onclick="javascript:history.go(-1)" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        
      </tr>
      
   
      
    </tbody></table>
</form>
</BODY>
  </HTML>