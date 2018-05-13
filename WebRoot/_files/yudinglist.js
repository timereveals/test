function formatTable()
{
	var typeG	=	document.getElementById("beg-G").checked;
	var typeD	=	document.getElementById("beg-D").checked;
	var typeT	=	document.getElementById("beg-T").checked;
	var typeZ	=	document.getElementById("beg-Z").checked;
	var typeK	=	document.getElementById("beg-K").checked;
	var typeC	=	document.getElementById("beg-C").checked;
	var typeL	=	document.getElementById("beg-L").checked;
	var typeO	=	document.getElementById("beg-O").checked;
	
	var AM	=	document.getElementById("chk-AM").checked;
	var PM	=	document.getElementById("chk-PM").checked;
	var NT	=	document.getElementById("chk-NT").checked;
	
	var sign=false;
	if(typeG&&typeD&&typeT&&typeZ&&typeK&&typeC&&typeL&&typeO)
	{
		var sign=true;
	}
	
	if(!typeG&&!typeD&&!typeT&&!typeZ&&!typeK&&!typeC&&!typeL&&!typeO)
	{
		var sign=true;
	}

	if(sign)
	{							
		var divs	=	$("tr[name='checi']");
		var length	=	divs.length;
		for(var i=0;i<length;i++)
		{
			var time1=divs[i].getAttribute("begtime").replace(/:.*/,"");
			var time =parseInt(time1);
			sign=true;
			if((AM&&PM&&NT)||(!AM&&!PM&&!NT))
			{
				sign = true;
			}else{
				if(AM&&time1<12)
				{
					sign=true;
				}else if(PM&&(time1>=12&&time1<=18))
				{
					sign=true;
				}else if(NT&&time1>18)
				{
					sign=true;
				}else
				{
					sign=false;
				}
			}
			if(sign)
			divs[i].style.display="";
			else divs[i].style.display="none";
		}	
	}
	else
	{
		var divs	=	$("tr[name='checi']");
		var length	=	divs.length;
		for(var i=0;i<length;i++)
		{
			var type =divs[i].getAttribute("ttype").substring(0,1).toUpperCase().replace(/\d/,"O");
			var time1=divs[i].getAttribute("begtime").replace(/:.*/,"");
			
			var time =parseInt(time1);
			sign=false;
			//车次类型
			if(typeG&&(type=="G"))
			{
				sign=true;
			}
			if(!sign&&typeD&&type=="D")
			{
				sign=true;
			}
			if(!sign&&typeT&&type=="T")
			{
				sign=true;
			}
			if(!sign&&typeZ&&type=="Z")
			{
				sign=true;
			}
			if(!sign&&typeK&&type=="K")
			{
				sign=true;
			}
			if(!sign&&typeC&&type=="C")
			{
				sign=true;
			}
			if(!sign&&typeL&&type=="L")
			{
				sign=true;
			}
			if(!sign&&typeO&&type!="G"&&type!="D"&&type!="T"&&type!="Z"&&type!="K"&&type!="C"&&type!="L")
			{
				sign=true;
			}
			if(sign){
				if((AM&&PM&&NT)||(!AM&&!PM&&!NT))
				{
					sign =true;
				}else
				{
					if(AM&&time1<12)
					{
						sign=true;
					}else if(PM&&(time1>=12&&time1<=18))
					{
						sign=true;
					}else if(NT&&time1>18)
					{
						sign=true;
					}else
					{
						sign=false;
					}
				}
			}
			if(sign)
			{
				divs[i].style.display="";
			}
			else
			{
				divs[i].style.display="none";
			}
		}		
	}
}
Date.prototype.format = function(format) 
{ 
  var o = { 
    "M+" : this.getMonth()+1, //month 
    "d+" : this.getDate(),    //day 
    "h+" : this.getHours(),   //hour 
    "m+" : this.getMinutes(), //minute 
    "s+" : this.getSeconds(), //second 
    "q+" : Math.floor((this.getMonth()+3)/3),  //quarter 
    "S" : this.getMilliseconds() //millisecond 
  } 
  if(/(y+)/.test(format)) format=format.replace(RegExp.$1, 
    (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
  for(var k in o)if(new RegExp("("+ k +")").test(format)) 
    format = format.replace(RegExp.$1, 
      RegExp.$1.length==1 ? o[k] : 
        ("00"+ o[k]).substr((""+ o[k]).length)); 
  return format; 
}
Date.prototype.add = function(part, value) {
	value *= 1;
	if(isNaN(value)) {
		value = 0;
	}
	switch(part) {
			case 'y':
				this.setUTCFullYear(this.getUTCFullYear() + value);
				break;
			case 'm':
				this.setUTCMonth(this.getUTCMonth() + value);
				break;
			case 'd':
				this.setUTCDate(this.getUTCDate() + value);
				break;
			case 'h':
				this.setUTCHours(this.getUTCHours() + value);
				break;
			case 'n':
				this.setUTCMinutes(this.getUTCMinutes() + value);
				break;
			case 's':
				this.setUTCSeconds(this.getUTCSeconds() + value);
				break;
			default:
	}
	 return this;
}
function showDate(obj)  {//显示可选择日期
    var today = new Date();
    var lastDay = new Date();
    lastDay.setTime(today.getTime() + 30 * 24 * 60 * 60 * 1000);
    var Day = new Array("周日", "周一", "周二", "周三", "周四", "周五", "周六");
    var _split = obj.split("-");
    var d = new Date(_split[0], _split[1] - 1, _split[2]);
    var start = d.add("d", -4);
    var s = "";
    var d2 = null;
    var num = 0;
    var clickStr = '';
    for (var i = 0; i < 8; i++) {
        d2 = d.add("d", 1);
        num = d2.getDay();
        var str = d2.format("MM-dd", 1) + "  " + Day[num];
        if (d2 >= today && d2 <= lastDay) { 
        	 if (i == 3){
        		 s += "<li class=\"yes\">" + str + "</li>";
             }
             else{
            	 s += "<li class=\"not\" onclick=\"changeTab('" + d2.format("yyyy-MM-dd") + "')\">" + str + "</li>";
             }
        }
        else {
        	s += "<li class=\"none\">" + str + "</li>";
        }
    };
    $("#lis0").html(s);
}
function changeTab(obj){
	document.daigouForm.godate.value=obj;
	document.daigouForm.submit()
}
function tobook(t1,t2,t3,t4,t5,t6)
{
	var newGoTime =  $("#tTime").val();
	if(newGoTime != null && newGoTime != "" && newGoTime !='undefined'){
		t2 = newGoTime;
	}
	
	var checi = t1;
	var gotime = t2;
	var from = t3;
	var to = t4;
	var piao = t5;
	var web = t6;
	var date = new Date();
	var s1 = date.format("yyyy-MM-dd");//当前日期
	var s4 = date.format("yyyy-MM-dd hh");//当前时间
	var s3 = s1 + " 16";//4点前
	var gotemp =gotime.replace(/-/g, "/");
	var godate= new Date(gotemp);
	s1 = new Date(s1.replace(/-/g, "/"));
	s3 = new Date(s3.replace(/-/g, "/"));
	s4 = new Date(s4.replace(/-/g, "/")); 

	//piao = escape(piao);
	var c = godate.getTime()-s1.getTime();
	window.location.href = "http://huochepiao.114piaowu.com/tobuy?traincode="+checi+"&seat=111&zuoxi="+piao+"&fromstation="+encodeURI(encodeURI(from))+"&tostation="+encodeURI(encodeURI(to))+"&godate="+gotime+"&websource="+web;

}
function formatDgTable()
{
	var typeG	=	document.getElementById("beg-G").checked;
	var typeD	=	document.getElementById("beg-D").checked;
	var typeC	=	document.getElementById("beg-C").checked;
	
	var AM	=	document.getElementById("chk-AM").checked;
	var PM	=	document.getElementById("chk-PM").checked;
	var NT	=	document.getElementById("chk-NT").checked;
	
	var sign=false;
	if(typeG&&typeD&&typeC)
	{
		var sign=true;
	}
	if(!typeG&&!typeD&&!typeC)
	{
		var sign=true;
	}
	if(sign)
	{							
		var divs	=	$("tr[name='checi']");
		var length	=	divs.length;
		for(var i=0;i<length;i++)
		{
			var time1=divs[i].getAttribute("begtime").replace(/:.*/,"");
			var time =parseInt(time1);
			sign=true;
			if((AM&&PM&&NT)||(!AM&&!PM&&!NT))
			{
				sign = true;
			}else{
				if(AM&&time1<12)
				{
					sign=true;
				}else if(PM&&(time1>=12&&time1<=18))
				{
					sign=true;
				}else if(NT&&time1>18)
				{
					sign=true;
				}else
				{
					sign=false;
				}
			}
			if(sign)
			divs[i].style.display="";
			else divs[i].style.display="none";
		}	
	}
	else
	{
		var divs	=	$("tr[name='checi']");
		var length	=	divs.length;
		for(var i=0;i<length;i++)
		{
			var type =divs[i].getAttribute("ttype").substring(0,1).toUpperCase().replace(/\d/,"O");
			var time1=divs[i].getAttribute("begtime").replace(/:.*/,"");
			
			var time =parseInt(time1);
			sign=false;
			//车次类型
			if(typeG&&(type=="G"))
			{
				sign=true;
			}
			if(!sign&&typeD&&type=="D")
			{
				sign=true;
			}
			if(!sign&&typeC&&type=="C")
			{
				sign=true;
			}
			if(!sign&&type!="G"&&type!="D"&&type!="C")
			{
				sign=true;
			}
			if(sign){
				if((AM&&PM&&NT)||(!AM&&!PM&&!NT))
				{
					sign =true;
				}else
				{
					if(AM&&time1<12)
					{
						sign=true;
					}else if(PM&&(time1>=12&&time1<=18))
					{
						sign=true;
					}else if(NT&&time1>18)
					{
						sign=true;
					}else
					{
						sign=false;
					}
				}
			}
			if(sign)
			{
				divs[i].style.display="";
			}
			else
			{
				divs[i].style.display="none";
			}
		}		
	}
}