function checkShikeForm(){
	var fromstation = document.getElementById("cfCity");
	var tostation = document.getElementById("ddCity");
	var godate = document.getElementById("tTime");
	if(fromstation.value =="" || fromstation.value == "出发城市"){
		alert("请选择出发城市");
		fromstation.select();
		fromstation.focus();
		return false;
	}
	if(tostation.value =="" || tostation.value == "到达城市"){
		alert("请选择到达城市");
		tostation.select();
		tostation.focus();
		return false;
	}
	if(godate.value ==""){
		alert("请选择出发日期");
		godate.select();
		godate.focus();
		return false;
	}
	return true;
}
function checkCheci(){
	var fromstation = document.getElementById("checi");
	if(fromstation.value =="" || fromstation.value == ""){
		alert("请填写要查询的车次");
		fromstation.select();
		fromstation.focus();
		return false;
	}
	return true;
}
function checkDsd(){
	var fromstation = document.getElementById("scity");
	if(fromstation.value =="" || fromstation.value == ""){
		alert("请填写要查询的城市名称");
		fromstation.select();
		fromstation.focus();
		return false;
	}
	return true;
}
function checkStation(){
	var fromstation = document.getElementById("scity");
	if(fromstation.value =="" || fromstation.value == ""){
		alert("请填写要查询的车站名称");
		fromstation.select();
		fromstation.focus();
		return false;
	}
	return true;
}