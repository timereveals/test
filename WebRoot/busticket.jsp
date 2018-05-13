<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css/selectpage.css" type="text/css">
<script language="javascript" type="text/javascript" src="js/ss_city.js"></script>
<script language="javascript" type="text/javascript" src="js/WdatePicker.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="js/valform.js"></script>
<script language="javascript" type="text/javascript" src="js/yudinglist.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js" ></script>
<script type="text/javascript" src="js/selectpage.js" ></script>
<script type="text/javascript" src="js/dropmenu.js" ></script>
<META name=GENERATOR content="MSHTML 8.00.7601.18210"></HEAD>
<BODY>

<%@ include file="head.jsp" %>


<!-- main -->
<DIV class="basic-ss section martop5"><B class="ba-ssl fl"></B>
	<UL class=ba-ssc>
	  <LI class=basicss-top>
	  <H3>网上订票</H3><SPAN>温馨提示：为了提高您的得票率，建议您提前下单，以便更好的为您服务。</SPAN>
	</UL>
</DIV>


<DIV class=superiority>
	<SPAN><EM>· 品牌保证</EM>100%真票，假一罚十！</SPAN>
	<SPAN><EM>· 取票方便</EM>自取票或快递送票！</SPAN>
	<SPAN><EM>· 支付零风险</EM>支付宝担保交易！</SPAN>
	<SPAN><EM>· 退款无忧</EM>无票全额退款！</SPAN>
</DIV>
<!-- main -->
<DIV id=main class="section martop5">

<!-- left -->
<DIV class=aside>

<DIV class="ydhot position martop">



<DIV id=dginforesult class="yd-list yt ydlist">
<FORM  method=post name="scheduleForm" action="userMethod!schedule">
  <label class="go_city">出发城市：</label>
  <INPUT onblur=hideCity() id=cfCity class=go-city  value="${from}" name="from">
  <label class="arr_city">到达城市：</label>
  <INPUT onblur=hideCity() id="ddCity" class=go-city  value="${to}" name="to">
  <input type="hidden" value="1"  name="type"/>
  <input type="hidden" value="2"  name="type2"/>
  <input type="hidden" value="${fromStation }"  name="from"/>
  <input type="hidden" value="${toStation }"  name="to"/>
  <INPUT class="list-yd"  value="查询" type="submit" />
<UL class="choose">
  <LI><SPAN><label>出发时间：${ss2 }</label></SPAN>
  <label><INPUT  class="go-city" onclick="javascript:fPopCalendar(starttime,starttime); return false;"  id="date" name="date" value="${date}" type="date"></label>
  <LABEL><INPUT  type="radio"  name="time" value="12" <c:if test="${time == 12}">checked</c:if>><SPAN>(00:00-12:00)</SPAN></LABEL>
  <LABEL><INPUT   type="radio" name="time" value="18" <c:if test="${time == 18}">checked</c:if>><SPAN>(12:00-18:00)</SPAN></LABEL>
  <LABEL><INPUT  type="radio"  name="time" value="24" <c:if test="${time == 24}">checked</c:if>><SPAN>(18:00-24:00)</SPAN></LABEL>
  </LI>
</UL>

<ul>
  <LI><SPAN><label>选择类型：${ss1 }</label></SPAN>
  <c:forEach items="${busTypeList}"  var="beanbean">
   <LABEL><INPUT type=radio  name="busType"  value="${beanbean.name}" <c:if test="${beanbean.name == busType}">checked</c:if>><SPAN>${beanbean.name}</SPAN></LABEL>
  </c:forEach>
   </li>
</ul>

</FORM>
<DIV style="WIDTH: 720px" class="chooseleft">
<TABLE class="sel_table">
  <THEAD>
  <TR class=chose-tt>
    <TH width="10%">类型-班次</TH>
    <TH width="10%">余票</TH>
    <TH width="15%">出发站</TH>
    <TH width="15%">目的站</TH>
    <TH width="20%">出发时间</TH>
    <TH width="20%">到达时间</TH>
    <TH width="10%">参考票价</TH>
    <TH width="10%">操作</TH></TR></THEAD>
  <TBODY>

  <c:forEach items="${scheduleList}" var="beanbean">
  <TR class=blocks begtime="00:05" ttype="D601" name="checi">
    <TD><STRONG class=bluer>${beanbean.bus.busType.name }-${beanbean.id }</STRONG></TD>
    <TD><B class="font14 q-shi">
    <script>
    var count = 0;
    <c:forEach items="${beanbean.tickets}" var="ticket">
    if(${ticket.status} == 0){
        count++;
    }
    </c:forEach>
    document.write(count);
    </script>
    </B></TD>
    <TD><B class="font14 q-shi">${beanbean.route.leaveStation.name }</B></TD>
    <TD><B class="font14 z-dian">${beanbean.route.arriveStation.name }</B></TD>
    <TD><B class="font14 z-dian">${beanbean.leaveTime }</B></TD>
    <TD><B class="font14 z-dian">${beanbean.arriveTime }</B></TD>
    <TD class=zc><EM>￥${beanbean.price }</EM></TD>
    <TD>
    <a href="userMethod!order"></a>
    <INPUT class=list-yd  value=预订 type="button" onclick="javascript:window.location.href='userMethod!order?scheduleid=${beanbean.id }';"  />
    </TD>
  </TR>
  </c:forEach>


      </TBODY></TABLE></DIV>
<DIV
style="TEXT-ALIGN: right; PADDING-BOTTOM: 5px; LINE-HEIGHT: 25px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; COLOR: #f00; PADDING-TOP: 5px">以上查询信息仅供参考，请以站点当日售票信息为准！</DIV></DIV></DIV></DIV>



<%@ include file="right.jsp" %>


</BODY></HTML>
