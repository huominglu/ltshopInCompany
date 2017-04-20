$(function() {
		$(".currencyBox").hover(function() {
			$(this).addClass('active');
			$(".currency_detial").stop(true, true).delay(300).slideDown(500, "easeOutBounce");
			},  
			function() {
			$(".currency_detial").stop(true, true).delay(300).fadeOut(100, "easeInCubic");
		});
		$(".cart-block").hover(function() {
			$(this).addClass('active');
			$("#minicart").stop(true, true).delay(300).slideDown(500, "easeOutBounce");
			},  
			function() {
			$("#minicart").stop(true, true).delay(300).fadeOut(100, "easeInCubic");
		});
});
$(document).ready(function(){
		ddsmoothmenu.init({
		mainmenuid: "smoothmenu1", //menu DIV id
		orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
		classname: 'ddsmoothmenu', //class added to menu's outer DIV
		//customtheme: ["#1c5a80", "#18374a"],
		contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
	});
	$('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
	  $('#mix').jcarousel({
			scroll: 1,
			easing: 'swing',
			animation: 750,
			visible: 0,
			auto: 0
		});	
		$('#like-pro').jcarousel({
			scroll: 1,
			easing: 'swing',
			animation: 750,
			visible: 0,
			auto: 0
		});
		$('#related-pro').jcarousel({
			scroll: 1,
			easing: 'swing',
			animation: 750,
			visible: 0,
			auto: 0
		});
		$('#moreView').jcarousel({
			scroll: 1,
			easing: 'swing',
			animation: 750,
			visible: 0,
			auto: 0
		});
			

	$('.menuBox').click(function() {
			if ($('#menuInnner').is(":hidden"))
			{
			$('#menuInnner').slideDown("fast");
			} else {
			$('#menuInnner').slideUp("fast");
			}
			return false;
			});
			if($(window).width() <= 1000){
				$('#smoothmenu1').hide();
				$('.mobMenu').show();
			}else{
				$('#smoothmenu1').show();
				$('.mobMenu').hide();
				}
});
jQuery(function() {
	var jQueryallVideos = jQuery("iframe[src^='http://player.vimeo.com']"),jQueryfluidEl = jQuery(".about-banner");
	jQueryallVideos.each(function() {
		jQuery(this)
			.data('aspectRatio', this.height / this.width)
			.removeAttr('height')
			.removeAttr('width');
	});
	jQuery(window).resize(function() {
		var newWidth = jQueryfluidEl.width();
		jQueryallVideos.each(function() {
			var jQueryel = jQuery(this);
			jQueryel
				.width(newWidth)
				.height(newWidth * jQueryel.data('aspectRatio'));
		});
		if($(window).width() <= 1000){
			$('#smoothmenu1').hide();
			$('.mobMenu').show();
		}else{
			$('#smoothmenu1').show();
			$('.mobMenu').hide();
			}
	}).resize();

});
/* 评分 */
$(function () {  
	for (var i = 0; i < 5; i++) {  
		var divMsg = "<img src='resources/img/5.jpg' alt='miss' style='cursor:pointer' class='star'/>";  
		$('#initialize').append(divMsg);  
	}  
	RateMsg(-1);  
	
	$(".star").each(function () {  
		var enabled=true;  
		$(this).hover(function () {  
			var pic;  
			var num = $(this).index()
			if (num >= 0) {  
				pic = "star";  
			}  
			for (var i = 0; i < num + 1; i++) {  
				$(".star").eq(i).attr("src", "resources/img/" + pic + ".jpg");  
				RateMsg(i + 1);  
			}   
			for (var j = num + 1; j < 5; j++) {  
				$(".star").eq(j).attr("src", "resources/img/5.jpg");  
			}  
	
		});  
	
		$(this).mouseout(function () {  
			if (enabled) {  
				for (var i = 0; i < 5; i++) {  
					$(".star").eq(i).attr("src", "resources/img/5.jpg");  
				}  
				RateMsg(-1);  
			}  
	
		});  
		$(this).click(function () {  
			enabled = false;  
			var rate = $(this).index() + 1; 
			RateMsg(rate); 
		});  
	});   
	function RateMsg(rate) {  
		switch (rate) {  
			case 1: 
				text = "<font color='red'>1分</font> (差得太离谱，与卖家描述的严重不符，非常不满)";
				$("#level").val("1分");
				break;  
			case 2: 
				text = "<font color='red'>2分</font> (部分有破损，与卖家描述的不符，不满意)";
				$("#level").val("2分");
				break;  
			case 3: 
				text = "<font color='red'>3分</font> (质量一般，没有卖家描述的那么好)"
				$("#level").val("3分");
				break;  
			case 4: 
				text = "<font color='red'>4分</font> (质量不错，与卖家描述的基本一致，还是挺满意的)"
				$("#level").val("4分");
				break;  
			case 5: 
				text = "<font color='red'>5分</font> (质量非常好，与卖家描述的完全一致，非常满意)";
				$("#level").val("5分");
				break;  
			case -1: text = "请评分,默认5分好评哦亲！";  
				break;  
		}  
		$('#rateMsg').html(text);  
	}
	});
<!-- 隐藏和显示属性面板 -->
function click_a(divDisplay)   
{   
	if(document.getElementById(divDisplay).style.display != "block")   
	{   
		document.getElementById(divDisplay).style.display = "block";   
	}   
	else  
	{   
		document.getElementById(divDisplay).style.display = "none";   
	}   
}     

<!-- 5秒跳转页面 -->
function countDown(secs,surl){ 
 var jumpTo = document.getElementById('jumpTo');
 jumpTo.innerHTML=secs; 
 if(--secs>0){ 
  	setTimeout("countDown("+secs+",'"+surl+"')",1000); 
 }
 else
 {  
  	location.href=surl; 
 } 
} 
