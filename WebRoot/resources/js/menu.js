// JavaScript Document

//瀵艰埅鑿滃崟
function navList(id) {
    var $obj = $("#nav_dot"), $item = $("#J_nav_" + id);
    $item.addClass("on").parent().removeClass("none").parent().addClass("selected");
    $obj.find("h4").hover(function () {
        $(this).addClass("hover");
    }, function () {
        $(this).removeClass("hover");
    });
    $obj.find("p").hover(function () {
        if ($(this).hasClass("on")) { return; }
        $(this).addClass("hover");
    }, function () {
        if ($(this).hasClass("on")) { return; }
        $(this).removeClass("hover");
    });
    $obj.find("h4").click(function () {
        var $div = $(this).siblings(".list-item");
        if ($(this).parent().hasClass("selected")) {
            $div.slideUp(600);
            $(this).parent().removeClass("selected");
        }
        if ($div.is(":hidden")) {
            $("#nav_dot li").find(".list-item").slideUp(200);
            $("#nav_dot li").removeClass("selected");
            $(this).parent().addClass("selected");
            $div.slideDown(300);

        } else {
            $div.slideUp(200);
        }
    });
}

/****琛ㄦ牸闅旇楂樹寒鏄剧ず*****/
window.onload=function(){
	oTable=document.getElementById("tab");//鎵捐〃鏍�
	aTr=document.getElementsByTagName("tr");//鎵炬墍鏈夌殑琛�
	for(i=0;i<aTr.length;i++){
		if(i%2==0){
			aTr[i].style.background="#fff";	
		}else{
			aTr[i].style.background="#ccc";	
		};
	};
};
