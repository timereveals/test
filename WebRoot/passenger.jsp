<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<script type="text/javascript" src="js/semantic.min.js" ></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
	</head>
	<body>
		<a class="btn btn-link-1 launch-modal" href="#" data-modal-id="modal-addpas">+添加乘车人</a>
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
	                    <form role="form" action="" method="post" class="addpas-form">
	              <div class="pas_info_insert">
							<ul>
								<li>
									姓&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" id="username"></input>
								</li>
								<li>
									电&nbsp;&nbsp;&nbsp;&nbsp;话：<input type="text" id="tel"></input>
								</li>
								<li>
									身&nbsp;&nbsp;份&nbsp;&nbsp;证： <input type="text" id="idcard"></input>
								</li>
								<li>
									地&nbsp;&nbsp;&nbsp;&nbsp;址：<input type="text" id="address"></input>
								</li>
								<li>
									备&nbsp;&nbsp;&nbsp;&nbsp;注：<input type="text" id="mark"></input>
								</li>
							</ul>
							<div class="pas_btn">				
								<input type="button" value="确定"></input>
							</div>
						</div>
	                    </form>                    
        			</div>	
        		</div>
        	</div>
        </div>
        
        
        
<!--
	描述：乘车人信息显示
-->       
		<div class="pas_info" id="pas_info">
			<ul>
				<li>
					姓&nbsp;&nbsp;&nbsp;&nbsp;名：<label>username</label>
				</li>
				<li>
					电&nbsp;&nbsp;&nbsp;&nbsp;话：<label>username</label>
				</li>
				<li>
					身&nbsp;份&nbsp;证&nbsp;： <label>username</label>
				</li>
				<li>
					地&nbsp;&nbsp;&nbsp;&nbsp;址：<label>username</label>
				</li>
				<li>
					备&nbsp;&nbsp;&nbsp;&nbsp;注：<label>username</label>
				</li>
			</ul>
			<div class="pas_btn">				
				<input type="button" value="修改" id="alterpasinfo"></input>
				<input type="button" value="删除" id="deletepasinfo"></input>
			</div>
		</div>
		
		<!--
	描述：乘车人信息修改
-->  
		<div class="pas_info_alert" id="pas_info_alert">
			<ul>
				<li>
					姓&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" id="username"></input>
				</li>
				<li>
					电&nbsp;&nbsp;&nbsp;&nbsp;话：<input type="text" id="tel"></input>
				</li>
				<li>
					身&nbsp;份&nbsp;证&nbsp;： <input type="text" id="idcard"></input>
				</li>
				<li>
					地&nbsp;&nbsp;&nbsp;&nbsp;址：<input type="text" id="address"></input>
				</li>
				<li>
					备&nbsp;&nbsp;&nbsp;&nbsp;注：<input type="text" id="mark"></input>
				</li>
			</ul>
			<div class="pas_btn">				
				<input type="submit" value="确定" id="submitpasinfo"></input>
				<input type="button" value="取消" id="cancelpasinfo"></input>
			</div>
		</div>
		<script type="text/javascript">
				var btn1 = document.getElementById('alterpasinfo');
				var btn2 = document.getElementById('submitpasinfo');
				var btn3 = document.getElementById('cancelpasinfo');
				var btn4 = document.getElementById('deletepasinfo');
        var div1 = document.getElementById('pas_info');
        var div2 = document.getElementById('pas_info_alert');
        btn1.onclick = function(){
                div1.style.display = 'none';
                div2.style.display = 'block';
        };
        
        btn2.onclick = function(){
                div1.style.display = 'block';
                div2.style.display = 'none';
        };

        btn3.onclick = function(){
                div1.style.display = 'block';
                div2.style.display = 'none';
        };
        
        btn4.onclick = function(){
                div1.style.display = 'none';
                div2.style.display = 'none';
        };
	</script>
  </body>
</html>
