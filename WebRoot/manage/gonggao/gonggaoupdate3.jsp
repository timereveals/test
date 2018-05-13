<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />

<script type="text/javascript" language="javascript">

function checkform(){
	if(document.getElementById("biaotiid").value==""){
		
		alert('标题不能为空');
		return false;
	}
	
	
	
	return true;

}


</script>


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
       公告标题：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
        <input type="text" name="biaoti"  id="biaotiid" value="${bean.biaoti }"  readonly="readonly"/>
        </td>
        
      </tr>
      
       <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
       公告内容：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
       <textarea rows="5" cols="50"  name="content" readonly="readonly">${bean.content }</textarea>
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