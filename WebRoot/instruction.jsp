<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0040)http://huochepiao.114piaowu.com/beijing/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><META content="IE=7.0000"
http-equiv="X-UA-Compatible">
<TITLE>网上订票网站</TITLE>
<META content=ie=7 http-equiv=x-ua-compatible>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet
type=text/css href="_files/common.css">
<LINK
rel=stylesheet type=text/css
href="_files/trainbasic.css">
<SCRIPT language=javascript type=text/javascript
src="_files/ss_city.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript
src="_files/WdatePicker.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript
src="_files/jquery-1.4.2.min.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript
src="_files/valform.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript
src="_files/yudinglist.js"></SCRIPT>
<LINK rel=stylesheet href="_files/style.css">


<META name=GENERATOR content="MSHTML 8.00.7601.18210"></HEAD>
<BODY>

<%@ include file="head.jsp" %>


<!-- main -->
<DIV id=main class="section martop5">

<!-- left -->
<DIV class=aside>

<DIV class="ydhot position martop">

<h4>
一、购票方式

　　1.旅客可在汽车客运站售票窗口购票；

　　2.旅客可在汽车客运站自助售票机购票；

　　3.旅客可关注微信公众号“深圳汽车客运”；

　　4.旅客也可电话拨打88895000或114，订购客货中心各汽车客运站车票。

　　二、购票须知

　　1.旅客购票时，请依顺序说清楚需购票的乘车日期、班次、开车时间、到达站、张数，取票后核对找赎的金额，如有差错，应立即声明更正，离开窗口后责任自负。儿童身高1.2米至1.5米，应购儿童票，按全票的半价收费；身高超过1.5米者，应购全票，每壹成人客票可随身携带1.2米以下儿童壹名，超过壹名时应购儿童票。

　　2.残废军人凭民政部颁发的《革命残废军人抚恤证》，可购买残废军人半价优待票，享受全票旅客待遇。

　　3.旅客随身携带乘车的行李包裹，每一张全票免费10千克，每一张儿童票免费5千克，体积不能超过0.02立方米，以能放置本人座位下及车厢行李架上为限，超过规定时，其超过部分按行包收费，占用座位时按实际占用座位数购票。

　　4.网上购票须知

　　客货中心http://www.88895000.com网上售票平台及“深圳汽车客运”微信售票公众号为您提供客货中心所属车站，包括罗湖汽车站、福田汽车站、南山汽车站（包括总站、天桥和南侨服务点）、东湖汽车站（总站）、皇岗汽车站（皇岗口岸、福田口岸）、机场汽车站、盐田汽车站及深圳北汽车站的长途汽车票。若有疑问，可在6:30-22:30期间致电客货中心服务热线：88895000。

　　订票

　　（1）网上购票可购买次日后并在预售期内的车票，在同一个订单中，旅客预购票数最多为5张。

　　（2）网上售票服务只办理全价票的预订，不接受优惠票的预订。

　　（3）网上购票时，请您务必如实填写相关个人资料及联系方式（有效取票凭证、联系方法等）。提交订单时请确认您输入的联系信息正确无误，并保持通讯畅通，以便我们的客服人员能及时与您联系。因您所留的资料不详或者不正确，或您所提供的电话号码长时间处于无人接听、忙音等状况而使我们的服务人员不能及时联系到您，由此造成的系列损失，均由您本人自行负责。

　　支付

　　（1）网上购票支持银联网银支付、微信支付。

　　（2）旅客必须在预订后的20分钟内完成支付操作，逾时支付系统将自动取消该次订座。

　　（3）请勿重复提交订单。当您进行支付后，请查询订单支付状态，系统如没有返回电子订单号等异常情况，请勿急于重复提交订单，请您在服务时间拨打0755-88895000咨询，以免造成您不必要的损失。

　　取票

　　旅客在网上及微信购票成功后，请在营业时间到发车站的服务窗口或自助售取票机凭所登记的取票人有效二代身份证或电子订单号取票车票，并在班车发车30分钟前办理取票手续。

　　退票

　　（1）根据《广东省汽车客运站收费实施细则》第十五条规定，由于客运站或承运人的责任造成延误或脱班，应允许旅客退票，并免收退票手续费；开车后不办理退票；旅客退票在班车开车时间2小时前办理的，按票面额10%计收退票费；在班车开车时间2小时内办理退票手续的，按票面额20%计收退票费。

　　（2）目前，已开通“深圳汽车客运”微信公众号退票功能，您可以在“深圳汽车客运”微信公众号办理购退票服务或者到发车站办理。

　　注意事项

　　（1）网上购票时请务必保管好您个人银行帐号、密码、回单等资料，建议勿在网吧等公共场所使用本购票系统。

　　（2）旅客应按照系统提示认真进行购票操作，因旅客原因造成的损失由旅客自行承担。

　　（3）购票过程中如发现已被扣款，但系统未显示成功支付，请及时联系客服人员进行核实处理。

　　三、乘车须知

　　1.旅客应自觉遵守场站、车上秩序，讲究文明礼貌，爱护公共设施，讲究卫生，保持清洁。服从站务人员及驾、乘人员安排，按车站规定的售票方法和时间依次购票，凭票乘车。

　　2.酒醉及神经失常或患有急性传染病、病人无人护送或有人护送但仍可能危害他人健康及安全者，不予乘车。

　　3.办理货物托运或自带行李时，不准夹带危险品、爆炸品、易燃品、杀伤性、有毒害品等法律和政府规定的禁运物品；或有碍行车安全和有碍公共卫生的物件乘车。

　　4.乘车时要坐稳扶好，头、手不得伸出车外，不准翻越车窗，车未停稳不准随意开启车门及上下车。

　　5.候车室、车上不准吸烟，不准从车窗向外扔东西，不准随地吐痰。行车中不得与驾驶员闲谈及妨碍驾驶员操作。
</h4>

</div>
</div>
<%@ include file="right.jsp" %>


</BODY></HTML>