// JavaScript Document
var _ListData_cf=[['重庆主城','cqzc','chongqingzhucheng'],['重庆机场','cqzjc','chongqingjichang'],['铜梁','tl','tongliang'],['璧山','bs','bishan'],['北碚','bb','beibei'],['城口','ck','chengkou'],['长寿','cs','changshou'],['垫江','dj','dianjiang'],['大学城','dxc','daxuecheng'],['大足','dz','dazu'],['丰都','fd','fengdu'],['奉节','fj','fengjie'],['涪陵','fl','fuling'],['合川','hc','hechuan'],['江津','jj','jiangjin'],['九龙坡','jlp','jiulongpo'],['开州','kz','kaizhou'],['梁平','lp','liangping'],['南川','nc','nanchuan'],['彭水','ps','pengshui'],['綦江','qj','qijiang'],['黔江','qj','qianjiang'],['荣昌','rc','rongchang'],['石柱','sz','shizhu'],['潼南','tn','tongnan'],['武隆','wl','wulong'],['万盛','ws','wansheng'],['巫山','ws','wushan'],['巫溪','wx','wuxi'],['万州','wz','wanzhou'],['秀山','xs','xiushan'],['渝北','yb','yubei'],['永川','yc','yongchuan'],['酉阳','yy','youyang'],['云阳','yy','yunyang'],['忠县','zx','zhongxian']];

document.write('<div id="cityList" style="display:none; z-index:9999;top:-1;position:absolute"></div>');
var _CloseAdmit_=true;
var _InputID_	="";
var TrainNumber_InputID_	="";
var _ListSelectID_	=	0;
var _ListSelectStr_	=	"";
document.onkeydown=function(event)
{
	event	=	(event)?event:window.event;//Mozilla浏览器中没有默认的event对象，只能在事件发生的现场使用。
	if(_InputID_!="")
	{
		switch(event.keyCode)//火狐2.0版本未考虑
		{
			case 38:	_ListMove_(-1);break;//↑
			case 40:	_ListMove_(1);break;//↓
			case 13:	_GetValue_(_InputID_,_ListSelectStr_.split(",")[_ListSelectID_]);return false;break;//Enter
			default:	setTimeout("_UpdateList_()",50);
		}
	}
	else
	{
		if(TrainNumber_InputID_!="")
		{
			switch(event.keyCode)//火狐2.0版本未考虑
			{
				case 38:	TrainNumber_ListMove_(-1);break;//↑
				case 40:	TrainNumber_ListMove_(1);break;//↓
				case 13:	TrainNumber_GetValue_(TrainNumber_InputID_,TrainNumber_ListSelectStr_.split(",")[TrainNumber_ListSelectID_]);return false;break;//Enter
				default:	setTimeout("TrainNumber_UpdateList_()",50);
			}
		}		
	}
}

function _ListMove_(ID)
{
	if(_ListSelectStr_!="")
	{
		var StrArray	=	_ListSelectStr_.split(",")
		switch(ID)
		{
			case 1:if(_ListSelectID_>=StrArray.length-2){return ;}break;
			case -1:if(_ListSelectID_<=0){return ;}break;
			default:return ;
		}
		document.getElementById("_ListID"+_ListSelectID_+"_").style.backgroundColor="";
		_ListSelectID_	=	_ListSelectID_+ID;
		document.getElementById("_ListID"+_ListSelectID_+"_").style.backgroundColor="#C5E7F6";
	}
}

function _UpdateList_()
{
	var Str	=	document.getElementById(_InputID_).value.toLowerCase();
	var Len	=	Str.length;
	var i	=	0;
	var ListStr	=	"";
	_ListSelectID_	=	0;
	_ListSelectStr_	=	"";
	if(Str!="")
	{
		for(var j=0;j<_ListData_cf.length;j++)
		{
			if(_ListData_cf[j][0].substr(0,Len)==Str||_ListData_cf[j][1].substr(0,Len)==Str||_ListData_cf[j][2].substr(0,Len)==Str)
			{
				if(i==0)
				{
					ListStr	=	ListStr+'<tr height="20" onMouseOver="this.style.backgroundColor=\'#C5E7F6\'" onMouseOut="this.style.backgroundColor=\'\'" style="cursor:pointer;background-color:#C5E7F6" onClick="JavaScript:_GetValue_(\''+_InputID_+'\',\''+_ListData_cf[j][0]+'\')" id="_ListID'+i+'_"><td>&nbsp;&nbsp;'+_ListData_cf[j][0]+'('+_ListData_cf[j][1].toUpperCase()+')</td><td align="right">'+_ListData_cf[j][2]+'&nbsp;&nbsp;</td></tr>';
				}
				else
				{
					ListStr	=	ListStr+'<tr height="20" onMouseOver="this.style.backgroundColor=\'#C5E7F6\'" onMouseOut="this.style.backgroundColor=\'\'" style="cursor:pointer" onClick="JavaScript:_GetValue_(\''+_InputID_+'\',\''+_ListData_cf[j][0]+'\')" id="_ListID'+i+'_"><td>&nbsp;&nbsp;'+_ListData_cf[j][0]+'('+_ListData_cf[j][1].toUpperCase()+')</td><td align="right">'+_ListData_cf[j][2]+'&nbsp;&nbsp;</td></tr>';
				}
				_ListSelectStr_=_ListSelectStr_+_ListData_cf[j][0]+',';
				
				if(i>=11)
				//提示12个
				{
					break;
				}
				else
				{
					i=i+1;
				}		
			}
		}
		
		if(ListStr!="")
		{
			_ListSelectID_	=	0;
			ListStr	=	'<table align="left" width="240" cellpadding="0" cellspacing="0" style="border:1px solid #999999;font-size:12px; font-family:Arial; color:#555555;background-color:#FFFFFF;filter:alpha(opacity=95);">'+ListStr+'</table>';
			document.getElementById("cityList").innerHTML	=	ListStr;
		}
		else
		{
			document.getElementById("cityList").innerHTML	=	"";
		}
	}
}

function showCity(ID)
{
	try
	{
		document.getElementById(ID).value=""; 
		_CloseAdmit_	=	false;
		_InputID_		=	ID;
		var ListStr		=	'<table align="left" width="300" height="180" cellpadding="0" cellspacing="0" style="border:1px solid #999999;font-size:12px; font-family:Arial; color:#555555;background-color:#FFFFFF;filter:alpha(opacity=95);">'
							+'<tr style="border-bottom:1px dotted #999999; color:#000000">'
							+'<td colspan="4" style="font-size:13px;color:blue"><span style="font-size:12px;color:#999999">(可直接输入城市或城市拼音)</span></td>'
							+'<td align="right"><span style="cursor:pointer" onClick="JavaScript:_HideList_()"><img border="0" title="关闭窗口" src="images/close.gif" width="10px" height="10px"></span>&nbsp;&nbsp;&nbsp;</td></tr>';
		var StrArray="重庆主城，重庆机场，铜梁，璧山，北碚，城口，长寿，垫江，大学城，大足，丰都，奉节，涪陵，合川，江津，九龙坡，开州，梁平，南川，彭水，綦江，黔江，荣昌，石柱，潼南，武隆，万盛，巫山，巫溪，万州，秀山，渝北，永川，酉阳，云阳，忠县".split("，");
		ListStr			=	ListStr+'<tr>';

		for(var i=0;i<StrArray.length;i++)
		{
			if(i!=0&&i%5==0)
			{
				ListStr	=	ListStr+'</tr><tr>';		
			}
			ListStr		=	ListStr+'<td onMouseOver="this.style.backgroundColor=\'#C5E7F6\'" onMouseOut="this.style.backgroundColor=\'\'" style="cursor:pointer" onClick="JavaScript:_GetValue_(\''+ID+'\',\''+StrArray[i]+'\')">&nbsp;&nbsp;&nbsp;'+StrArray[i]+'</td>';
		}
		ListStr			=	ListStr+'</table>';
		var ListObj		=	document.getElementById("cityList");
		ListObj.innerHTML	=	ListStr;
		
		var TextTop=0;
		var TextLeft=0;
		var TextID		=	document.getElementById(ID);
		var TextHeight	=	TextID.clientHeight;
		while(TextID&&TextID.tagName!="body")
		{
			TextTop		=	TextTop+TextID.offsetTop;
			TextLeft	=	TextLeft+TextID.offsetLeft;
			TextID		=	TextID.offsetParent;
		}
		ListObj.style.top	=	TextTop+TextHeight+5+"px";
		ListObj.style.left	=	TextLeft+"px";
		ListObj.style.display	=	"inline";
	}
	catch(Err)
	{
		//alert(Err.description);
	}
}
function _GetValue_(ID,Value)
{
	_CloseAdmit_	=	true;
	if(typeof(Value)=="string"&&Value!="")
	{
		document.getElementById(ID).value=Value;
	}
	_HideList_();
}
function _HideList_()
{
	if(_CloseAdmit_	)
	{
		document.getElementById("cityList").style.display	=	"none";
		_InputID_	="";
	}
}
function hideCity()
{
	_CloseAdmit_	=	true;
	setTimeout("_HideList_()",200);
}

