<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>在线咨询</title>
        <link rel="stylesheet" href="css/common.css" />
        <script type="text/javascript">
             function checkreplyform(){
                 if (document.getElementById('reply_content_show').value=="")
                 {
                      alert("回复内容不能为空");
                      return false;
                 }
             }
         </script>
    </head>
    <body>
    	<div id="title">${title }</div>
        <form action="${url}" method="post">
		    <div class="top">
				&nbsp;&nbsp;&nbsp;关键字：<input type="text" name="keyWord" value="${username}" id="keyWord" placeholder="请输入id进行查询">
				<input type="button" value="搜索" id="submit_find" onclick="search('${url}')">
				<br/>
			</div>
        </form>
    <table id="table">
    	<tr>
	        <th style="width: 5%;">ID</th>       
	        <th style="width: 5%;">用户名</th>
	        <th style="width: 10%;">联系电话</th>
	        <th style="width: 13%;">留言内容</th>
	        <th style="width: 13%";>留言时间</th>
	        <th style="width: 13%;">回复内容</th>
	        <th style="width: 13%";>回复时间</th>
	        <th style="width: 7%;">状态</th>
	        <th style="width: 7%;">操作</th>
	    </tr>
	    <c:forEach items="${list}"  var="bean">
	        <tr>
		        <td >${bean.id}</td>
		        <td >${bean.user.name}</td>
		        <td >${bean.user.phone}</td>
		        <td >${bean.word_content}</td>
		        <td >${bean.word_time}</td>
		        <td >${bean.reply_content}</td>
		        <td >${bean.reply_time}</td>
		        <td >${bean.status}</td>
	        	<td>

				<a id="replyword" href="javascript:replyword(${bean.id},'${bean.user.name}',${bean.user.phone},'${bean.word_content}');">回复</a>
                <a id="showword" href="javascript:showword(${bean.id},'${bean.user.name}',${bean.user.phone},'${bean.word_content}','${bean.word_time}','${bean.reply_content}','${bean.reply_time}');">查看</a>
				</td>
	        </tr>
	    </c:forEach>
    </table>
    <div class="table_bottom">${pagerinfo }</div>
    <!-- 遮罩层div-->
        <div class="cover" id="cover"></div>
        <!-- 弹出层(reply)回复留言div-->
        <div class="layer" id="layer_reply"  onsubmit="return checkreplyform()">
        	<form action="${urlUpdate}" method="post">
        		<div class="nav_close">
    	    		<a class="btclose" id="btclose_reply" href="javascript:;">X</a>
    	    	</div>
    	    	<input type="hidden" name="id" id="wordid" value="wordid"/>
    	    	<div>
    	    		<label>用户名:</label><input name="name" id="name" type="text" readonly="readonly" value="" />
    	    	</div>
    	    	<div>
    	    		<label>联系电话:</label><input name="phone"  id="phone"  type="text" readonly="readonly" value="" />
    	    	</div>
    	    	<div>
                    <label>留言内容:</label><textarea name="word_content" id="word_content" readonly="readonly" style="width: 300px; height: 100px;border: 1px solid gray;margin-top: 15px; overflow: scroll;" placeholder="请输入内容" />
                </div>
    	    	<div>
    	    		<label>回复内容:</label><textarea name="reply_content" id="reply_content" style="width: 300px; height: 100px;border: 1px solid gray;margin-top: 15px; overflow: scroll;" placeholder="请输入内容" />
    	    	</div>
    	    	<div class="btn">
	    		    <button type="submit" id ="sure_reply">确定</button>
    	    	</div>
        	</form>
        </div>

<!-- 弹出层(show)查看留言div-->
        <div class="layer" id="layer_show" >
        	<form >
        		<div class="nav_close">
    	    		<a class="btclose" id="btclose_show" href="javascript:;">X</a>
    	    	</div>
    	    	<input type="hidden" name="id" id="wordid_show" value="wordid_show"/>
    	    	<div>
    	    		<label>用户名:</label><input id="name_show"  type="text" readonly="readonly"  />
    	    	</div>
    	    	<div>
    	    		<label>联系电话:</label><input id="phone_show"type="text" readonly="readonly"  />
    	    	</div>
    	    	<div>
                    <label>留言时间:</label><input id="word_time_show"type="text" readonly="readonly"  />
                </div>
    	    	<div>
    	    		<label>留言内容:</label><textarea  id="word_content_show" style="width: 300px; height: 50px;border: 1px solid gray;margin-top: 15px; overflow: scroll;" readonly="readonly" value="${bean.word_content}" />
    	    	</div>
    	    	<div>
                     <label>回复时间:</label><input id="reply_time_show"type="text" readonly="readonly"  />
                </div>
                <div>
                    <label>回复内容:</label><textarea  id="reply_content_show" style="width: 300px; height: 50px;border: 1px solid gray;margin-top: 15px; overflow: scroll;" readonly="readonly" value="${bean.word_content}" />
                 </div>
    	    	<div class="btn">
    	    		<a   href="javascript:;" id="sure_show">确定</a>
    	    	</div>
        	</form>
        </div>

    <script type="text/javascript">
         function replyword(wordid,name,phone,word_content){
                 document.getElementById("wordid").value=wordid;
                 document.getElementById("name").value = name;
                 document.getElementById("phone").value = phone;
                 document.getElementById("word_content").value = word_content;
                 $("#cover").fadeIn("slow");
                 $("#layer_reply").fadeIn("slow");//淡入淡出效果 显示div
         }
        $(function(){

            $("#btclose_reply").click(function(){
                $("#cover").fadeOut("slow");
                $("#layer_reply").fadeOut("slow");//淡入淡出效果 隐藏div
            });
            $("#sure_reply").click(function(){
                $("#cover").fadeOut("slow");
                $("#layer_reply").fadeOut("slow");//淡入淡出效果 隐藏div
            })
        });
         function showword(wordid_show,name,phone,word_content,word_time,reply_content,reply_time){
                       document.getElementById("wordid_show").value = wordid_show;
                      document.getElementById("name_show").value = name;
                      document.getElementById("phone_show").value = phone;
                      document.getElementById("word_content_show").value = word_content;
                      document.getElementById("word_time_show").value = word_time;
                      document.getElementById("reply_content_show").value = reply_content;
                      document.getElementById("reply_time_show").value = reply_time;
                     $("#cover").fadeIn("slow");
                     $("#layer_show").fadeIn("slow");//淡入淡出效果 显示div
                }
         $(function(){
                    $("#btclose_show").click(function(){
                        $("#cover").fadeOut("slow");
                        $("#layer_show").fadeOut("slow");//淡入淡出效果 隐藏div
                    });
                    $("#sure_show").click(function(){
                        $("#cover").fadeOut("slow");
                        $("#layer_show").fadeOut("slow");//淡入淡出效果 隐藏div
                    })
                });
    </script>
 	</body>
</html>