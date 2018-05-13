<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>帮助中心</title>
    <link rel="stylesheet" href="css/helpcenter.css" />
  </head>
  
  <body onload="createCode();">

	<%@ include file="head.jsp" %>
    <div class="help">
	  	<div class="help_left">
	  		<div class="help_title">使用帮助</div>
		  	<a href="<%=path%>#jump1;">服务条款</a>
		  	<a href="javascript:#jump2;">常见问题</a> 
		  	<a href="javascript:#jump3;">网上购票须知</a> 
	  	</div>
	  	<div class="help_right">
		  	<div id="jump1">
				<div class="jump_title">服务条款</div> 
				<p class="jump_title2">一、用户注册协议</p>
				<p>如果您在愉客行官网（www.96096kp.com）、愉客行关联公司网站、愉客行提供的移动应用或软件上（以下简称“愉客行”）或愉客行微信公众号（愉客行重庆市公路客运售票网），访问、预定或使用我们的产品或服务（以上统称为“服务”），便视为您接受了以下服务协议，请仔细阅读以下内容。如果您不同意以下任何内容，请立刻停止访问本网站或使用本网站服务。</p>
				<p>1、总则</p>				
				<p>本协议内容包括协议正文、愉客行子频道各单项服务协议及其他愉客行已经发布的或将来可能发布的各类规则，包括但不限于免责声明、隐私政策、 产品预订须知、旅游合同、账户协议等其他协议（“其他条款”）。如果本协议与“其他条款”有不一致之处，则以“其他条款”为准。除另行明确声明外，任何愉客行提供的服务均受本协议约束。</p>
				<p>2、服务简介</p>
				<p>考虑到愉客行会员服务的重要性，用户同意：</p>
				<p>⑴提供及时、详尽及准确的个人资料。</p>
				<p>⑵不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。</p>
				<p>另外，用户可授权重庆愉客行网络有限公司向第三方透露其基本资料，但重庆愉客行网络有限公司不能公开用户的补充资料。除非：</p>
				<p>⑴用户要求重庆愉客行网络有限公司或授权某人通过电子邮件服务透露这些信息。</p>
				<p>⑵相应的法律要求及程序要求重庆愉客行网络有限公司提供用户的个人资料。</p>
				<p>如果用户提供的资料不准确，重庆愉客行网络有限公司保留结束用户使用愉客行会员服务的权利。</p>
				<p>用户在享用愉客行会员服务的同时，同意接受愉客行会员服务提供的各类信息服务，包括但不限于EDM、短信、愉客行App信息推送、PC端广告等服务类及营销类信息。</p>
		  	</div>
			<div id="jump2">
				<div class="jump_title">常见问题</div> 
				<p >9、隐私政策的适用范围隐私政策的适用范围隐私政策的适用范围隐私政策的适用范围隐私政策的适用范围</p> 
			</div>
			<div id="jump3">
				<div class="jump_title">网上购票须知</div> 
				<p >9、隐私政策的适用范围隐私政策的适用范围隐私政策的适用范围隐私政策的适用范围隐私政策的适用范围</p> 
			</div>
		</div>
	</div>
  </body>
</html>
