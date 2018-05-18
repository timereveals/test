<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<link rel="stylesheet" href="layui/css/layui.css" />
		<script>
		function search(url){
		    var url = url+"?keyWord="+document.getElementById("keyWord").value;
		    doclk(url);
		}
		function dockPage(obj){
		    $("#content").load(obj.href);
		    return false;
		}
		</script>
	</head>
	<body>
	    <body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">渝快行</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          欢迎${admin.name}，登录愉客行后台管理系统
        </a>       
      </li>
      <li class="layui-nav-item"><a href="login.jsp">退出登录</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test" style="text-align:center;">
      	<!-- 系统管理员功能 -->
      	<c:if test="${admin.role==0}">
            <li class="layui-nav-item layui-nav-itemed">
              <a class="" href="javascript:;">用户管理</a>
              <dl class="layui-nav-child">
                <dd><a href="javascript:;" onclick="doclk('../adminMethod!adminManage')" id="adminManage">车站管理员</a></dd>
                <dd><a href="javascript:;" onclick="doclk('../adminMethod!userManage')" id="userManage">普通用户</a></dd>
              </dl>
            </li>

            <li class="layui-nav-item">
              <a href="javascript:;">系统管理</a>
              <dl class="layui-nav-child">
                <dd><a href="javascript:;" onclick="doclk('../adminMethod!announcementManage')">公告管理</a></dd>
                <dd><a href="javascript:;" onclick="doclk('../adminMethod!stationManage')">站点管理</a></dd>
              </dl>
            </li>
        </c:if>
        <!-- 车站管理员功能 -->
        <c:if test="${admin.role==1}">
            <li class="layui-nav-item layui-nav-itemed">
              <a class="" href="javascript:;">个人资料</a>
              <dl class="layui-nav-child">
                <dd><a href="javascript:;" onclick="doclk('alertpwd.jsp')">修改密码</a></dd>
                <dd><a href="javascript:;" onclick="doclk('../adminMethod!profile')">个人信息</a></dd>
              </dl>
            </li>

            <li class="layui-nav-item">
              <a href="javascript:;">班车管理</a>
              <dl class="layui-nav-child">
                <dd><a href="javascript:;" id="nav_type" onclick="doclk('../adminMethod!busTypeManage')">类型管理</a></dd>
                <dd><a href="javascript:;" id="nav_line" onclick="doclk('../adminMethod!routeManage')">线路管理</a></dd>
                <dd><a href="javascript:;" id="nav_line" onclick="doclk('../adminMethod!busManage')">车辆管理</a></dd>
                <dd><a href="javascript:;" id="nav_classes" onclick="doclk('../adminMethod!scheduleManage')">班次管理</a></dd>
              </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;" >服务管理</a>
                <dl class="layui-nav-child">
                <dd><a href="javascript:;" id="nav_type" onclick="doclk('../adminMethod!wordManage')">在线咨询</a></dd>
              </dl>
            </li>
        </c:if>
      </ul>
    </div>
  </div>

    <div class="layui-body" id="content" style="background: rgb(241,241,241);">
  	</div>
  	

  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © yukuaixing渝快行
  </div>
</div>

<script type="text/javascript" src="layui/layui.js" ></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>


//content页面调用
<script type="text/javascript">
	function doclk(url){
		$("#content").load(url);		
	}
</script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js" ></script>
</body>
</html>
