<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />

<script type="text/javascript" language="javascript">

function checkform(){
	if(document.getElementById("password1id").value==""){
		
		alert('原密码不能为空');
		return false;
	}
	if(document.getElementById("password2id").value==""){
		
		alert('新密码不能为空');
		return false;
	}
	if(document.getElementById("password3id").value==""){
		
		alert('确认密码不能为空');
		return false;
	}
	
	if(document.getElementById("password2id").value.length<6){
		
		alert('新密码长度必须大于6位');
		return false;
	}
	
	if(document.getElementById("password2id").value != document.getElementById("password3id").value){
		
		alert('新密码和新密码确认不一致');
		return false;
	}
	
	
	return true;

}


</script>


</head>
<body>

<form action="adminMethod!passwordModified" method="post" onsubmit="return checkform() " >
  <table width="1052" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
    <tbody>
      <tr>
        <th align=center colspan=16 style="height: 23px">修改密码</th>
      </tr>
      
      <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
        原密码：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
        <input type="password" name="password1"  id="password1id"/>
        </td>
        
      </tr>
      
       <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
        新密码：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
        <input type="password" name="password2" id="password2id" />
        </td>
        
      </tr>
      
       <tr align="center" bgcolor="#799AE1">
        <td width="6%" align="center" class="txlHeaderBackgroundAlternate">
         确认新密码：
        </td>
        <td width="7%" align="center" class=txlHeaderBackgroundAlternate>
       <input type="password" name="password3" id="password3id" />
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