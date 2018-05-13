
/* var cover=document.getElementById("cover"); 
 var layer=document.getElementById("layer"); 
 var add=document.getElementById("submit_add"); 
 var btclose=document.getElementById("btclose"); 
 var sure=document.getElementById("sure")
 add.onclick=function() 
 { 
  cover.style.display="block"; 
  layer.style.display="block"; 
 } 

  btclose.onclick=function() 
   { 
	cover.style.display="none"; 
	layer.style.display="none";  
   } 
	sure.onclick=function()
	{ 
	cover.style.display="none"; 
	layer.style.display="none";  
   } */
$(function(){
    //$("#layer").hide(); //先让div隐藏
    $("#submit_add").click(function(){
        $("#cover").fadeIn("slow");
        $("#layer_add").fadeIn("slow");//淡入淡出效果 显示div
    });
    $("#btclose").click(function(){
        $("#cover").fadeOut("slow");
        $("#layer_add").fadeOut("slow");//淡入淡出效果 隐藏div
    });
    $("#sure").click(function(){
        $("#cover").fadeOut("slow");
        $("#layer_add").fadeOut("slow");//淡入淡出效果 隐藏div
    })
});

$(function(){
    $("#editRow").click(function(){
        $("#cover").fadeIn("slow");
        $("#layer_editRow").fadeIn("slow");//淡入淡出效果 显示div
    });
    $("#btclose_editRow").click(function(){
        $("#cover").fadeOut("slow");
        $("#layer_editRow").fadeOut("slow");//淡入淡出效果 隐藏div
    });
    $("#sure_editRow").click(function(){
        $("#cover").fadeOut("slow");
        $("#layer_editRow").fadeOut("slow");//淡入淡出效果 隐藏div
    })
});
$(function(){
    $("#lookRow").click(function(){
        $("#cover").fadeIn("slow");
        $("#layer_lookRow").fadeIn("slow");//淡入淡出效果 显示div
    });
    $("#btclose_lookRow").click(function(){
        $("#cover").fadeOut("slow");
        $("#layer_lookRow").fadeOut("slow");//淡入淡出效果 隐藏div
    });
    $("#sure_lookRow").click(function(){
        $("#cover").fadeOut("slow");
        $("#layer_lookRow").fadeOut("slow");//淡入淡出效果 隐藏div
    })
});


