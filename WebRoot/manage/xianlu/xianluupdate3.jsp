<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />

<script type="text/javascript" language="javascript">

function checkform(){


	if(document.getElementById("banciid").value==""){
		
		alert('班次不能为空');
		return false;
	}
	
	if(document.getElementById("qidianzhanid").value==""){
		
		alert('起点站不能为空');
		return false;
	}
	
	if(document.getElementById("zhongdianzhanid").value==""){
		
		alert('终点站不能为空');
		return false;
	}
	
	
	
	
	 var reg1 =  /^\d+$/;
	 
	

	if (document.getElementById('zuoweiid').value.match(reg1) == null)
	{
		alert("票数必须为正整数");
		return false;
	}
	
	
	return true;

}


</script>


</head>
<body style="background-color: #CCCCFF;">

<form action="${url }" method="post" onsubmit="return checkform() " >
  <table width="1052" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
    <tbody>
      <tr>
        <th align=center colspan=16 style="height: 23px">${title }</th>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       班次：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
        <input type="text" name="banci"  id="banciid" value="${bean.banci }" readonly="readonly"/>
        </td>
      </tr>
      
       <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       类型：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
      	<input type="text" name="banci"  id="banciid" value="${bean.leixing.name }" readonly="readonly"/>
        </td>
      </tr>
      
       <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       起点站：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
        <input type="text" name="qidianzhan"  id="qidianzhanid" value="${bean.qidianzhan }" readonly="readonly"/>
        </td>
      </tr>
      
       <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       终点站：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
        <input type="text" name="zhongdianzhan"  id="zhongdianzhanid" value="${bean.zhongdianzhan }" readonly="readonly"/>
        </td>
      </tr>
      
       <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       票数：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
        <input type="text" name="zuowei"  id="zuoweiid" value="${bean.zuowei }" readonly="readonly"/>
        </td>
      </tr>
      
       <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       途径：(站点用-符号间隔，否则输入失败，比如上海-杭州-宁波)
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
        <textarea rows="7" cols="50" name="tujing"  id="tujingid" readonly="readonly">${bean.tujing }</textarea>
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