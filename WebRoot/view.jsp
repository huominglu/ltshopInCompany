<%@ page language="java" import="java.util.*" pageEncoding="GB18030" contentType="text/html; charset=GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String realpath = basePath+"upfile/";
pageContext.setAttribute("realpath", realpath);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; GB18030">
<head>
<base href="<%=basePath%>">
<title>商品详情</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/bitbug_favicon (1).ico">
<!--js-->
<script src="resources/js/jquery-1.8.3.min.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.flexslider.js"></script>
<script src="resources/js/jquery.jcarousel.min.js"></script>
<script src="resources/js/light_box.js"></script>
<script src="resources/js/ddsmoothmenu.js"></script>
<script src="resources/js/common.js"></script>
<script type="text/javascript" class="library" src="resources/js/jquery.colorbox-min.js"></script>
<script type="text/javascript" class="library" src="resources/js/fangdajing.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/orange.css"><!--颜色-->
<link rel="stylesheet" href="resources/css/skeleton.css"><!--骨架-->
<link rel="stylesheet" href="resources/css/layout.css"><!--布局-->
<link rel="stylesheet" href="resources/css/ddsmoothmenu.css"/>
<link rel="stylesheet" href="resources/css/home_flexslider.css"/>
<link rel="stylesheet" href="resources/css/light_box.css"/>
<!-- 返回顶部 -->
<link href="resources/css/zzsc.css" rel="stylesheet" type="text/css" />
<script src="resources/js/zzsc.js"></script>
<!--窗口切换-->
<script type="text/javascript">
	$(function(){
		var tabContainers=$('section.product-collateral > div.commonContent');
		tabContainers.hide().filter(':first').show();
		$('section.product-collateral ul.tab-block a').click(function(){
			tabContainers.hide();
			tabContainers.filter(this.hash).show();
			$('section.product-collateral ul.tab-block a').removeClass('active');
			$(this).addClass('active');
			return false;
			}).filter(':first').click();
	});
</script>
<!-- 弹出小窗口 -->
<script type="text/javascript">$(document).ready(function(){$(".inline").colorbox({inline:true, width:"50%"});});</script>
<!--大图模块-->
<script type="text/javascript">
jQuery (function(){
	var tabContainers=jQuery('div.tabs > div');
	tabContainers.hide().filter(':first').show();
	jQuery('div.tabs ul.tabNavigation a').click(function(){
		tabContainers.hide();
		tabContainers.filter(this.hash).show();
		jQuery('div.tabs ul.tabNavigation a').removeClass('selected');
		jQuery(this).addClass('selected');
		return false;
		}).filter(':first').click();
	});
	
	jQuery(document).ready(function(){
		jQuery(".ajax").colorbox();
	});	
	function qtyUpdate(kind){
		var c = document.getElementById("qty").value;
		if(kind == "up"){
			c++;
		}else if(kind == "down"){
			if(c > 1) c--;
		}
		document.getElementById("qty").value = c;
	}
</script>
 <script type="text/javascript">
$(function(){
		$.ajax({
			type:"post",
			url:"getsupts",
			success:function(result){
			}
		});
	});
</script>
</head>
<body>
	<a href="" class="cd-top">Top</a>
	<div class="mainContainer sixteen container">
        <!--头部-->
        <div class="header-wrapper">
          <header class="container">
            <div class="head-right">
            	<c:if test="${!empty sessionScope.user }">
                    <ul class="top-nav">
                    	<li><a>${sessionScope.user.realname }您好</a></li>
                        <li class=""><a href="userinfo.jsp" title="My Account">个人中心</a></li>
                        <li class="my-wishlist"><a href="favorite.jsp" title="My Wishlist">收藏</a></li>
                        <li class="log-in"><a href="exitUser">退出登录</a></li>
                    </ul>
	                <ul class="currencyBox">
	                    <li id="header_currancy" class="currency">
	                      <a class="mainCurrency" href="#">&lt;我的龙腾商城</a>
	                      <div id="currancyBox" class="currency_detial">
	                      	<a href="listorder1">查看订单</a>
	                      </div>
	                    </li>
	                </ul>
                </c:if>
                <c:if test="${empty sessionScope.user }">
                	<ul class="top-nav">
                		<li><a>您好，欢迎光临龙腾商城</a></li>
                        <li class="contact-us"><a href="register.jsp" title="Contact Us">注册</a></li>
                        <li class="log-in"><a href="login.jsp">登录</a></li>
                    </ul>
                </c:if>
              <section class="header-bottom">
                <div class="cart-block">
                <ul>
                    <li>${sessionScope.allnum }</li>
                    <li><a href="cart.jsp" title="Cart"><img title="Item" alt="Item" src="resources/img/item_icon.png" /></a></li>
                    <li><a href="cart.jsp">购物车</a></li>
                </ul>
                <div id="minicart" class="remain_cart" style="display: none;">
                     <p class="empty">购物车内有${sessionScope.allnum }件商品</p>
                     <ol>
                     	<c:forEach items="${sessionScope.pics }" var="pic">
	                        <li>
	                            <div class="img-block"><img src="resources/img/small_img.png" title="" alt="" /></div>
	                            <div class="detail-block">
	                                <h4><a>${pic.value.productname }</a></h4>
	                                <p>
	                                    <strong>${pic.value.num }</strong> ￥${pic.value.price * pic.value.num }
	                                </p>
	                                <a href="#" title="详情">详情</a>
	                            </div>
	                            <div class="edit-delete-block">
	                                <a href="deletepic?productInCart.productid=${pic.value.productid }" title="删除"><img src="resources/img/delete_item_btn.png" alt="Remove" title="删除" /></a>
	                            </div>
	                        </li>
                        </c:forEach>
                        <li>
                            <div class="total-block">合计:<span>￥${sessionScope.allprice }</span></div>
                            <a href="cart.jsp" class="orange-btn">结算</a>
                            <div class="clear"></div>
                        </li>
                     </ol>
                </div>
            </div>
                <div class="search-block">
                  <input type="text" value="搜索" />
                  <input type="submit" value="Search" title="搜索" />
                </div>
              </section>
            </div>
             <div class="right-nav">
                <ul>
                    <li><a onclick=""><img src="resources/img/1.png" width="20px" height="20px"/>&nbsp;&nbsp;&nbsp;龙腾商城</a></li>						
                </ul>
			</div>
            <h1 class="logo">
              	<img alt="Logo" src="resources/img/logo.gif" />
            </h1>           
            <nav id="smoothmenu1" class="ddsmoothmenu mainMenu">
              <ul id="nav">
                <li class="active"><a href="index.jsp">首页</a></li>
                <li class=""><a href="category.html" title="Shop by">商品分类</a>
                 	<ul id="prodsupertype">
                 		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
                 			<c:forEach items="${sessionScope.supertypes}" var="supt">
                 				<li value="${supt.id}">
                 					<a href="getprodbysupertype?superType.id=${supt.id}">${supt.superTypeName}</a>
                 					<c:if test="${fn:length(supt.subtypes) > 0}">
                 						<ul>
                 						<c:forEach items="${supt.subtypes}" var="subt">
                 							<li>
                 								<a href="getprodbysubtype?subType.id=${subt.id}">${subt.subtypename}</a>
                 							</li>
                 						</c:forEach>
                 						</ul>
                 					</c:if>
                 				</li>
                 			</c:forEach>
                 		</c:if>
                  </ul>
                </li>
	                <li class="">
	                	<a href="getprodbysupertype?superType.id=6">家用电器</a>
	                		<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 6 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtype?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	                			</c:forEach>
	                			</c:if>
                			</c:forEach>
               				</c:if>
	                		</ul>
	                	
	                </li>
	                <li class="">
	                	<a href="getprodbysupertype?superType.id=204">运动&户外</a>
	                	<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 204 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtype?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	                			</c:forEach>
	                			</c:if>
                			</c:forEach>
               				</c:if>
	                		</ul>
	                </li>
	                <li class="">
	                	<a href="getprodbysupertype?superType.id=29">办公用品&电脑</a>
	                	<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 29 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtype?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	                			</c:forEach>
	                			</c:if>
                			</c:forEach>
               				</c:if>
	                		</ul>
	                </li>
	                <li class="">
	                	<a href="getprodbysupertype?superType.id=61">护肤品&化妆品</a>
	                	<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 61 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtype?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	                			</c:forEach>
	                			</c:if>
                			</c:forEach>
               				</c:if>
	                		</ul>
	                </li>
	                <li class="">
	                	<a href="getprodbysupertype?superType.id=30">男装&女装</a>
	                	<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 30 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtype?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	                			</c:forEach>
	                			</c:if>
                			</c:forEach>
               				</c:if>
	                		</ul>
	                </li>
	                <li class="">
	                	<a href="getprodbysupertype?superType.id=202">鞋袜&箱包</a>
	                	<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 202 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtype?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	                			</c:forEach>
	                			</c:if>
                			</c:forEach>
               				</c:if>
	                		</ul>
	                </li>
              </ul>
            </nav>                
          </header>
        </div>
<!--主体内容-->
		<section class="content-wrapper">
		<div class="content-container container">
		<c:if test="${!empty sessionScope.user }">
			<form method="post" action="addCart" >
		</c:if>
		<c:if test="${empty sessionScope.user }">
			<form method="post" action="login.jsp" >
		</c:if>
		<div class="breadcrum-container">
			<ul>
				<li><a href="index.jsp">首页</a><input type="hidden" name="productInCart.productid" value="${prod.id}"></li>
				<li>${prod.productname}<input type="hidden" name="productInCart.productname" value="${prod.productname}"></li>
			</ul>
		</div>
		<div class="main">			
			<div class="product-info-box">
				<div class="product-essential">
					<div class="product-img-box">
                    	<p class="product-image-zoom">
                            <a href="#quick-view-container" class="inline">
                            	<img src="upfile/${prod.picture}"/>
                            	<input type="hidden" name="productInCart.picture" value="${prod.picture}">
                            </a> 
						</p>			
                        <p>
							点击查看大图
						</p>
                        <div class="img-slider">
							<a class="prev slider-btn"><img src="images/prev_img_btn.png" /></a>
							<a class="next slider-btn"><img src="images/next_img_btn.png" /></a>
						</div>
					</div>
					<div class="product-shop">
						<h3 class="product-name">${prod.productname}</h3>
						<div class="price-box">
                		    <span class="price">￥${prod.nowprice}</span>
                		    <input type="hidden" name="productInCart.price" value="${prod.nowprice}">
                		    <c:if test="${prod.productnum > 30}">
                		    	<span class="availability">现有货</span>
                		    </c:if>
                		    <c:if test="${prod.productnum == 0}">
                		    	<span class="availability">暂无货</span>
                		    </c:if>
							
				        </div>
						<div class="model-block">
							<p>
								<span>商品数量: </span>${prod.productnum}
								
							</p>
							
						</div>
                        
						<div class="color-size-block">
							<div class="label-row">
								<label><em>*</em> 颜色</label>
								<span class="required">* 必填</span>
							</div>
							<div class="select-row">
								<select><option>-- Please Select --</option></select>
							</div>
							<div class="label-row">
								<label><em>*</em> 尺码</label>
							</div>
							<div class="select-row">
								<select><option>-- Please Select --</option></select>
							</div>
						</div>
						<div class="add-to-cart-box">
							<span class="qty-box">
								<label for="qty">数量:</label>
								<a href="javascript:qtyUpdate('down')" ><img src="resources/img/qty_prev.png" /></a>
								<input type="text" name="productInCart.num" value="1" maxlength="12" id="qty" class="input-text qty" name="qty">
								<a href="javascript:qtyUpdate('up')"><img src="resources/img/qty_next.png" /></a>
							</span>							
							<button class="form-button"><span>加入购物车</span></button>
							<ul class="add-to-box">
								<li><a class="add-wishlist">加入收藏</a></li>
								<li><a class="add-compare">添加比较</a></li>
								<li class="last">
                                	<a href="resources/img/size_chart.gif" class="size-guide ajax">大小指南</a>
                                </li>
							</ul>
						</div>                   
					</div>
				</div>
			</div>
            <aside class="right">
				<ol class="pro-slider-btn">
					<li><a><img src="resources/img/pro_prev_btn.png" title="Prev" alt="Prev" /></a></li>
					<li><a><img src="resources/img/pro_next_btn.png" title="Next" alt="Next" /></a></li>
				</ol>
				<ul class="right-img">
					<li><a><img src="resources/img/view_right_img01.png" title="Image" alt="Image" /></a></li>
					<li><a><img src="resources/img/view_right_img02.png" title="Image" alt="Image" /></a></li>
					<li><a><img src="resources/img/view_right_img03.png" title="Image" alt="Image" /></a></li>
				</ul>
			</aside>
<!-- ===============================评论显示处===================================== -->
			<section  class="product-collateral">
				<ul class="tab-block">
					<li><a href="#pro-detail" title="Description" class="active">商品描述</a></li>
					<li><a href="#pro-review" title="Reviews">好评</a></li>
					<li><a href="#pro-review1" >中评</a></li>
					<li><a href="#pro-review2" >差评</a></li>
					<li class="video-box"><a href="#pro-video" title="Video Box">商品视频</a></li>
				</ul>
				<div id="pro-detail" class="pro-detail commonContent">
					<p>
						${prod.introduce}
					</p>
				</div>
                
                <div id="pro-review" class="pro-detail commonContent" align="center" style="font-size:13px;">
					<p>
						<table width="90%" >
                        	<tr style="color:orange;">
                            	<td width="15%"><strong>评论用户名</strong></td>
                                <td width="65%"><strong>内容</strong></td>
                                <td width="20%"><strong>评论日期</strong></td>
                            </tr>
                            <tr>
                            <td><hr></td><td><hr></td><td><hr></td>
                            </tr>
                            <c:forEach items="${requestScope.goodComments }" var="gc">
	                            <tr >
	                            	<td>${gc.username }</td>
	                                <td title="${gc.content }">${gc.content }</td>
	                                <td>${gc.cdate }</td>
	                            </tr>
	                            <tr>
	                           	 	<td><hr></td><td><hr></td><td><hr></td>
	                            </tr>
                            </c:forEach>
                        </table>
                        <div align="center" id="page">
                            <a href="">首页</a>
                            <a href="">前页</a>
                            <font>1</font>
                            <a href="">2</a>
                    		<a href="${pageUrl }">下页</a>
                    		<a href="${pageUrl }">尾页</a>
                            转入
                            <input type="text" size="1"/>
                            页 
                            <a href="">跳转</a>
                        </div>
					</p>
				</div>
				
				<div id="pro-review1" class="pro-detail commonContent" align="center" style="font-size:13px;">
					<p>
						<table width="90%" >
                        	<tr style="color:orange;">
                            	<td width="15%"><strong>评论用户名</strong></td>
                                <td width="65%"><strong>内容</strong></td>
                                <td width="20%"><strong>评论日期</strong></td>
                            </tr>
                            <tr>
                            <td><hr></td><td><hr></td><td><hr></td>
                            </tr>
                            <c:forEach items="${requestScope.midComments }" var="mc">
	                            <tr >
	                            	<td>${mc.username }</td>
	                                <td title="${mc.content }">${mc.content }</td>
	                                <td>${mc.cdate }</td>
	                            </tr>
	                            <tr>
	                           	 	<td><hr></td><td><hr></td><td><hr></td>
	                            </tr>
                            </c:forEach>
                        </table>
                        <div align="center" id="page">
                            <a href="">首页</a>
                            <a href="">前页</a>
                            <font>1</font>
                            <a href="">2</a>
                    		<a href="${pageUrl }">下页</a>
                    		<a href="${pageUrl }">尾页</a>
                            转入
                            <input type="text" size="1"/>
                            页 
                            <a href="">跳转</a>
                        </div>
					</p>
				</div>
				
				<div id="pro-review2" class="pro-detail commonContent" align="center" style="font-size:13px;">
					<p>
						<table width="90%" >
                        	<tr style="color:orange;">
                            	<td width="15%"><strong>评论用户名</strong></td>
                                <td width="65%"><strong>内容</strong></td>
                                <td width="20%"><strong>评论日期</strong></td>
                            </tr>
                            <tr>
                            <td><hr></td><td><hr></td><td><hr></td>
                            </tr>
                            <c:forEach items="${requestScope.badComments }" var="bc">
	                            <tr >
	                            	<td>${bc.username }</td>
	                                <td title="${bc.content }">${bc.content }</td>
	                                <td>${bc.cdate }</td>
	                            </tr>
	                            <tr>
	                           	 	<td><hr></td><td><hr></td><td><hr></td>
	                            </tr>
                            </c:forEach>
                        </table>
                        <div align="center" id="page">
                            <a href="">首页</a>
                            <a href="">前页</a>
                            <font>1</font>
                            <a href="">2</a>
                    		<a href="${pageUrl }">下页</a>
                    		<a href="${pageUrl }">尾页</a>
                            转入
                            <input type="text" size="1"/>
                            页 
                            <a href="">跳转</a>
                        </div>
					</p>
				</div>
                
                <div id="pro-tags" class="pro-detail commonContent">
					<p>
						商品标签
					</p>
				</div>
                <div id="pro-video" class="pro-detail commonContent">
					<p>
						放视频
					</p>
				</div>
                              
			</section>
			<div class="like-pro-block">
				<div class="title-block">
					<h2>你也许会喜欢</h2>
				</div>
				<div class="like-pro">
					<ul id="like-pro" class="product-grid">
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
                        <li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
                        <li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="related-pro-block">
				<div class="title-block">
					<h2>相关产品</h2>
				</div>
				<div class="related-pro">
					<ul id="related-pro" class="product-grid">
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
                        <li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
                        <li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
						<li>
							<div class="pro-img"><img alt="Freature Product" src="resources/img/default_img.png" /></div>
							<div class="pro-detail-block">
								<h4 class="pro-name">Sunglass RB3186</h4>
								<div class="pro-price">$600.00</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			  </form>
		</div>
		<div class="clearfix"></div>
		<div class="news-letter-container">
			<div class="free-shipping-block">
                <h1>ENJOY FREE SHIPPING</h1>
                <p>on all orders as our holiday gift for you!</p>
              </div>
              <div class="news-letter-block">
                <h2>订阅促销信息</h2>
                <input type="text" value="输入邮箱" title="" />
                <input type="submit" value="订阅" title="Submit" />
              </div>
		</div>	
	</div>
</section>
</div>
<article style="display:none;">
	<section id="quick-view-container">
    <div align="center" style=" margin-top:10px; margin-bottom:10px">
		<img src="upfile/${prod.picture}" width="400px" height="400px"/>
        </div>
    </section>
</article>     
 <!--页脚-->
        <section class="footer-wrapper">
          <footer class="container">
            <div class="link-block">
              <ul class="stay-connected-blcok">
                <li>
                     <ul class="social-links">
                        <li><a data-tooltip="Like us on facebook" href="#"><img alt="facebook" src="resources/img/facebook.png"></a></li>
                        <li><a data-tooltip="Subscribe to RSS feed" href="#"><img alt="RSS" src="resources/img/rss.png"></a></li>
                        <li><a data-tooltip="Follow us on twitter" href="#"><img alt="twitter" src="resources/img/twitter.png"></a></li>
                        <li><a data-tooltip="Follow us on Dribbble" href="#"><img alt="dribbble" src="resources/img/dribbble.png"></a></li>
                        <li><a data-tooltip="Follow us on Youtube" href="#"><img alt="youtube" src="resources/img/youtube.png"></a></li>
                        <li><a data-tooltip="Follow us on skype" href="#"><img alt="skype" src="resources/img/skype.png"></a></li>
                     </ul>
                     <div class="payment-block"><img src="resources/img/payment.png" alt="payment"></div>
                </li>
              </ul>
            </div>
            <div class="footer-bottom-block" align="center">
              <p class="copyright-block">
              	Copyright &copy; 2016.四组.
              </p>
            </div>
          </footer>
        </section>
</body>
</html>
