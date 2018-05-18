<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'alterpwd.jsp' starting page</title>

	<link rel="stylesheet" href="css/passenger.css" />
		<link rel="stylesheet" href="awesome/css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/passenger2.css">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
    <script type="text/javascript">
        function checkaddform(){
            if (document.getElementById('name').value=="")
                {
                	alert("姓名不能为空");
                	return false;
                }
            if (document.getElementById('phone').value=="")
                {
                	alert("联系方式不能为空");
                	return false;
                }
            valid=/^0?1[3,5,7,8][0,1,2,3,4,5,6,7,8,9]\d{8}$/;
                if(!valid.test(document.getElementById('phone').value)){
                    alert("请输入正确的手机格式");
                    return false;
                }
            if (document.getElementById('IDNumber').value=="")
                {
                	alert("身份证号不能为空");
                	return false;
                }
            if (document.getElementById('IDNumber').value.length != 18)
                {
                    alert("请输入正确的身份证号");
                    return false;
                }
        }
    </script>
	</head>
	<body>
		<a class="btn btn-link-1 launch-modal" href="#" data-modal-id="modal-addpas">+添加乘车人${passengerSize}</a>
        <!-- MODAL -->
        <div class="modal fade" id="modal-addpas" tabindex="-1" role="dialog" aria-labelledby="modal-addpas-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        				</button>
        				<h3 class="modal-title" id="modal-addpas-label">添加乘车人</h3>
        			</div>
        			<div class="modal-body">
	                    <form action="${urlCreate}" onsubmit="return checkaddform()" method="post" class="addpas-form">
	                        <div class="pas_info_insert">
                                <div>
                                        姓&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" id="name" name="name"></input>
                                    </div>
                                    <div>
                                        电&nbsp;&nbsp;&nbsp;&nbsp;话：<input type="text" id="phone"  name="phone" ></input>
                                    </div>
                                    <div>
                                        身份证： <input type="text" id="IDNumber" name="IDNumber"></input>
                                    </div>

                                <div class="pas_btn">
                                    <input type="submit" value="确定"></input>
                                </div>
						    </div>
	                    </form>
        			</div>
        		</div>
        	</div>
        </div>

<!--
	描述：乘车人信息显示
-->     <c:forEach items="${passengerList}" var="bean">
            <div class="pas_info" id="pas_info">
                    <div class="text1">
                        <label>姓名：</label><input type="text" id="name" value="${bean.name}" readonly="ture"></input>
                    </div>
                    <div class="text1">
                        <label>电话：</label><input type="text" id="phone" value="${bean.phone}" readonly="ture"></input>
                    </div>
                    <div class="text1">
                        <label>身份证：</label><input type="text" id="IDNumber" value="${bean.IDNumber}" readonly="ture"></input>
                    </div>
                <div class="pas_btn">
                    <a href="${urlRemove}?id=${bean.id}"><input type="button" value="删除" ></input></a>
                </div>
            </div>
		</c:forEach>
		

  </body>
</html>
