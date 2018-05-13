$(function(){
  $(".top-nav").on("click", "button", function(){
    var sid = $(this).data("id"); //获取data-id的值
    window.location.hash = sid; //设置锚点
    loadinner(sid);
  });
  function loadinner(sid){
    var sid = window.location.hash;
    var pathn, i;
    switch(sid){
    	case "#homepage": pathn = "../WebRoot/homepage.jsp"; i = 0; break;
    	case "#busticket": pathn = "busticketpage.jsp"; i = 1; break;
    	case "#hotrode": pathn = "hotrodepage.jsp"; i = 2; break;
    	case "#bugticketway": pathn = "bugticketwaypage.jsp"; i = 3; break;
    	case "#aboutus": pathn = "aboutuspage.jsp"; i = 4; break;
   		default: pathn = "homepage.jsp"; i = 0; break;
    }
    $("#content").load(pathn); //加载相对应的内容
    $(".nav #nav LI").eq(i).addclass("current").siblings().removeclass("current"); 
  }
  var sid = window.location.hash;
  loadinner(sid);
});