<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0040)http://huochepiao.114piaowu.com/beijing/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>
<META content="IE=7.0000" http-equiv="X-UA-Compatible">
<TITLE>网上订票网站</TITLE>
<META content=ie=7 http-equiv=x-ua-compatible>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<link rel=stylesheet type=text/css href="css/common.css">
<link rel=stylesheet type=text/css href="css/trainbasic.css">
<link rel=stylesheet href="css/style.css">
<script type="text/javascript" src="js/jquery-1.11.0.min.js" ></script>
<meta name=GENERATOR content="MSHTML 8.00.7601.18210"></head>
<body>

<%@ include file="head.jsp" %>


    <!-- main -->
    <div class="basic-ss section martop5"><B class="ba-ssl fl"></B>
        <ul class=ba-ssc>
          <li class=basicss-top>
          <h3>网上订票</h3><span>温馨提示：为了提高您的得票率，建议您提前下单，以便更好的为您服务。</span>
        </ul>
    </div>
    <div class=superiority>
        <span><em>· 品牌保证</EM>100%真票，假一罚十！</span>
        <span><em>· 取票方便</EM>自取票或快递送票！</span>
        <span><em>· 支付零风险</EM>支付宝担保交易！</span>
        <span><em>· 退款无忧</EM>无票全额退款！</span>
    </div>
    <div id=main class="section martop5">

    <!-- left -->
    <div class=aside>
        <div class="ydhot position martop">
            <div id="dginforesult" class="yd-list yt ydlist">
                <form  method="post" name="scheduleForm" action="userMethod!schedule">
                    <label class="go_city">出发城市：</label>
                    <input  id=cfCity class=go-city  value="${from}" name="from">
                    <label class="arr_city">到达城市：</label>
                    <input  id="ddCity" class=go-city  value="${to}" name="to">
                    <input type="hidden" value="1"  name="type"/>
                    <input type="hidden" value="2"  name="type2"/>
                    <input type="hidden" value="${fromStation }"  name="from"/>
                    <input type="hidden" value="${toStation }"  name="to"/>
                    <input class="list-yd"  value="查询" type="submit" />
                    <ul class="choose">
                         <li><span><label>出发时间：${ss2 }</label></span>
                         <label><input  class="go-city" onclick="javascript:fPopCalendar(starttime,starttime); return false;"  id="date" name="date" value="${date}" type="date"></label>
                         <label><input  type="radio"  name="time" value="12" <c:if test="${time == 12}">checked</c:if>><span>(00:00-12:00)</span></label>
                         <label><input   type="radio" name="time" value="18" <c:if test="${time == 18}">checked</c:if>><span>(12:00-18:00)</span></label>
                         <label><input  type="radio"  name="time" value="24" <c:if test="${time == 24}">checked</c:if>><span>(18:00-24:00)</span></label>
                         </li>
                    </ul>
                    <ul>
                         <li><label>选择类型：${ss1 }</label>
                             <c:forEach items="${busTypeList}"  var="beanbean">
                                 <label><input type=radio  name="busType"  value="${beanbean.name}" <c:if test="${beanbean.name == busType}">checked</c:if>/><span>${beanbean.name}</span></label>
                             </c:forEach>
                          </li>
                    </ul>
                </form>
                <div style="WIDTH: 720px" class="chooseleft">
                <c:if test="${scheduleList.size() != 0}">
                    <table class="sel_table">
                          <thead>
                              <tr class=chose-tt>
                                <th width="14%">类型-班次</th>
                                <th width="7%">余票</th>
                                <th width="15%">出发城市</th>
                                <th width="15%">目的城市</th>
                                <th width="20%">出发时间</th>
                                <th width="20%">到达时间</th>
                                <th width="10%">参考票价</th>
                                <th width="10%">操作</th>
                              </tr>
                          </thead>
                        <tbody>
                            <c:forEach items="${scheduleList}" var="beanbean">
                                <script>
                                    var count = 0;
                                    <c:forEach items="${beanbean.tickets}" var="ticket">
                                        if(${ticket.status} == 0){
                                            count++;
                                        }
                                    </c:forEach>
                                    if(count>0){
                                        document.write("\
                                        <tr class=blocks begtime='00:05' ttype='D601' name='checi'>\
                                        <td><strong class=bluer>${beanbean.bus.busType.name }-${beanbean.bus.plateNumber }</strong></td>\
                                        <td><B class='font14 q-shi'>"+count+
                                        "</B></TD>\
                                        <td><B class='font14 q-shi'>${beanbean.route.leaveStation.name }</b></td>\
                                        <td><B class='font14 z-dian'>${beanbean.route.arriveStation.name }</b></td>\
                                        <td><B class='font14 z-dian'>${fn:substring(beanbean.leaveTime,0, 16)}</b></td>\
                                        <td><B class='font14 z-dian'>${fn:substring(beanbean.arriveTime,0, 16)}</b></td>\
                                        <td class=zc><em>￥${beanbean.price }</em></td>\
                                        <td>\
                                        <a href='userMethod!order'></a>\
                                        <input class=list-yd  value=预订 type='button' onclick=\"javascript:window.location.href='userMethod!order?scheduleid=${beanbean.id }';\"  />\
                                        </td>\
                                        </tr>")
                                    }
                                </script>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                        <c:if test="${scheduleList.size() == 0}">
                        <div style="color:#f00;margin:5px;" ><h3>暂无班次<h3></div>
                        </c:if>
                </div>
                <div style="TEXT-ALIGN: right; PADDING-BOTTOM: 5px; LINE-HEIGHT: 25px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; COLOR: #f00; PADDING-TOP: 5px">以上查询信息仅供参考，请以站点当日售票信息为准！</div>
            </div>
        </div>
    </div>
    <!-- 公告信息 -->
    <div class=article >
        <div class="yd-tittle yd-right martop" >
            <H3>网站公告</H3><B class=hotydr></B>
        </div>
        <c:forEach items="${announcements}" var="bean">
            <div style="font-size:16px;">
                <a href="userMethod!announcement?id=${bean.id}">${bean.title}</a>
            </div>
        </c:forEach>
        <c:if test="${announcements.size() == 0}">
            <div style="color:#f00;margin:5px;" ><h3>暂无公告<h3></div>
        </c:if>

    </div>
</div>
</body>
</html>
