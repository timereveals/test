<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />

 <script src="js/Calendar.js"></script>




</head>
<body style="background-color: #CCCCFF;">

<form action="${url }?id=${bean.id }" method="post"  >
  <table width="1052" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
    <tbody>
      <tr>
        <th align=center colspan=16 style="height: 23px">${title }</th>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       到站时间(或出发时间)：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
        <input type="text" name="shijian" size="30" onfocus='setDayHM(this);' value="${bean.shijian }"/>
        </td>
      </tr>
      
             
       
      
       <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
        操作：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
       <input type="submit" value="提交" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" value="重置"  />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="返回"  onclick="javascript:history.go(-1)" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        
      </tr>
      
   
      
    </tbody></table>
</form>
</BODY>
  </HTML>