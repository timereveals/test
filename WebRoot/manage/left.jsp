<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>管理页面</TITLE>
<STYLE type=text/css>BODY {
	BACKGROUND: #799ae1; MARGIN: 0px; FONT: 9pt 宋体
}
TABLE {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
TD {
	FONT: 12px 宋体
}
IMG {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; VERTICAL-ALIGN: bottom; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
A {
	FONT: 12px 宋体; COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #428eff; TEXT-DECORATION: underline
}
.sec_menu {
	BORDER-RIGHT: white 1px solid; BACKGROUND: #d6dff7; OVERFLOW: hidden; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid
}
.menu_title {
	
}
.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 7px; COLOR: #215dc6; POSITION: relative; TOP: 2px
}
.menu_title2 {
	
}
.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 8px; COLOR: #428eff; POSITION: relative; TOP: 2px
}
</STYLE>

<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>

<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2900.2180" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=left border=0>
  <TBODY>
  <TR>
    <TD vAlign=top bgColor=#799ae1>
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD vAlign=bottom height=42><span style="font-size: 18px; color: white;font-weight:bold; margin-bottom:20px;">网上订票管理后台</span> </TD></TR></TBODY>
          
      </TABLE>
      
	  <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
	        <TR>
	          <TD class=menu_title id=menuTitle1 
	          onmouseover="this.className='menu_title2';" onclick=showsubmenu(0) 
	          onmouseout="this.className='menu_title';" 
	          background=left.files/admin_left_1.gif 
	            height="30px"
	            margin-top="20px";
	            >            
	            	<span><B>系统管理</B></span>            
	            </TD>
	        </TR>
        <TR>
          <TD id=submenu0>
            <DIV class=sec_menu style="WIDTH: 158px ">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
               <TR>
                 <TD height=20><a href="adminMethod!changePwd" target="mainFrame">修改密码</a></TD>
               </TR>
               <TR>
                 <TD height=20><a href="adminMethod!logout" target="_top">退出系统</a></TD>
               </TR>
              </TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>
   
	  

      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
          <TR>
            <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(2) 
          onmouseout="this.className='menu_title';" 
          background=left.files/admin_left_2.gif height="30px"><SPAN>常规管理</SPAN> </TD>
          </TR>
          <TR>
            <TD id=submenu2><DIV class=sec_menu style="WIDTH: 158px">
                <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                  <TBODY>
                    <TR>
                      <TD height=20><a href="adminMethod!busTypeManage" target=mainFrame>车辆类型</a></TD>
                    </TR>
                    
                     <TR>
                       <TD height=20><a href="adminMethod!routeManage" target=mainFrame>线路</a></TD>
                    </TR>
                     <TR>
                       <TD height=20><a href="adminMethod!busManage" target=mainFrame>车</a></TD>
                    </TR>

                  </TBODY>
                </TABLE>
            </DIV>
                <DIV style="WIDTH: 158px">
                  <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                    <TBODY>
                      <TR>
                        <TD 
      height=20></TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                </DIV></TD>
          </TR>
        </TBODY>
      </TABLE>
      
      
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
          <TR>
            <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(3) 
          onmouseout="this.className='menu_title';" 
          background=left.files/admin_left_2.gif height="30px"><SPAN>经营管理</SPAN> </TD>
          </TR>
          <TR>
            <TD id=submenu3><DIV class=sec_menu style="WIDTH: 158px">
                <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                  <TBODY>
                    <TR>
                      <TD height=20><a href="adminMethod!ticketManage" target=mainFrame>票</a></TD>
                    </TR>
                    <TR>
                       <TD height=20><a href="adminMethod!scheduleManage" target=mainFrame>班次</a></TD>
                    </TR>
                    
                  </TBODY>
                </TABLE>
            </DIV>
                <DIV style="WIDTH: 158px">
                  <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                    <TBODY>
                      <TR>
                        <TD 
      height=20></TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                </DIV></TD>
          </TR>
        </TBODY>
      </TABLE>
      
      
       <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
          <TR>
            <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(4) 
          onmouseout="this.className='menu_title';" 
          background=left.files/admin_left_2.gif height="30px"><SPAN>用户管理</SPAN> </TD>
          </TR>
          <TR>
            <TD id=submenu4><DIV class=sec_menu style="WIDTH: 158px">
                <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                  <TBODY>
                    <TR>
                      <TD height=20><a href="adminMethod!userManage" target=mainFrame>用户</a></TD>
                    </TR>
                    <TR>
                      <TD height=20><a href="adminMethod!adminManage" target=mainFrame>管理员</a></TD>
                    </TR>

                    
                    
                  </TBODY>
                </TABLE>
            </DIV>
                <DIV style="WIDTH: 158px">
                  <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                    <TBODY>
                      <TR>
                        <TD 
      height=20></TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                </DIV></TD>
          </TR>
        </TBODY>
      </TABLE>
      
      
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
          <TR>
            <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(4) 
          onmouseout="this.className='menu_title';" 
          background=left.files/admin_left_2.gif height="30px"><SPAN>公告管理</SPAN> </TD>
          </TR>
          <TR>
            <TD id=submenu4><DIV class=sec_menu style="WIDTH: 158px">
                <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                  <TBODY>
                    <TR>
                      <TD height=20><a href="adminMethod!announcementManage" target=mainFrame>公告</a></TD>
                     
                    </TR>
                    
                    
                    
                  </TBODY>
                </TABLE>
            </DIV>
                <DIV style="WIDTH: 158px">
                  <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                    <TBODY>
                      <TR>
                        <TD 
      height=20></TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                </DIV></TD>
          </TR>
        </TBODY>
      </TABLE>
      
      
      
      
      
      
      
      
      
      

	  
				  </BODY></HTML>