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
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<head>
<base href="<%=basePath%>">
<title>龙腾商城</title>
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
<!-- 窗口切换 -->
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
	                      	<a href="orderlist.jsp">查看订单详情</a>
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
                  <ul>
                    <c:if test="${fn:length(sessionScope.supertypes) > 0}">
                 			<c:forEach items="${sessionScope.supertypes}" var="supt">
                 				<li value="${supt.id}">
                 					<a href="getprodbysupertypepage?superType.id=${supt.id}">${supt.superTypeName}</a>
                 					<c:if test="${fn:length(supt.subtypes) > 0}">
                 						<ul>
                 						<c:forEach items="${supt.subtypes}" var="subt">
                 							<li>
                 								<a href="getprodbysubtypepage?subType.id=${subt.id}">${subt.subtypename}</a>
                 							</li>
                 						</c:forEach>
                 						</ul>
                 					</c:if>
                 				</li>
                 			</c:forEach>
                 		</c:if>
                  </ul>
                </li>
                <li class=""><a href="">服装城</a></li>
                <li class=""><a href="">美妆馆</a></li>
                <li class=""><a href="">超市</a></li>
                <li class=""><a href="">运动户外</a></li>
                <li class=""><a href="about_us.html" title="About us">关于我们</a></li>
              </ul>
            </nav>          
          </header>
        </div>
<!-- 主体部分 -->
<section class="content-wrapper">
	<div class="content-container container">
		<div class="breadcrum-container">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li>商品小类</li>
			</ul>
		</div>
		<div class="col-left">
			<div class="block man-block">
				<div class="block-title">家居&nbsp;家具&nbsp;家装</div>
				<ul>
					
					<c:if test="${fn:length(sessionScope.supertypes) > 0}">
						
               			<c:forEach items="${sessionScope.supertypes}" var="supertype">
	               			<c:if test="${supertype.id == 8 and fn:length(supertype.subtypes) > 0}">
	               			<c:forEach items="${supertype.subtypes}" var="subtype">
	               				
	               				<li><a href="getprodbysubtypepage?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	               			</c:forEach>
	               			</c:if>
              			</c:forEach>
        			</c:if>
				</ul>
			</div>
			<div class="block community-block">
				<div class="block-title">调查</div>
                <ul>
                    <li class="question-row">你最喜欢的颜色是什么</li>
                    <li><input type="radio"><a >绿色</a></li>
                    <li><input type="radio"><a >红色</a></li>
                    <li><input type="radio"><a>黑色</a></li>
                    <li><input type="radio"><a >玫红</a></li>
                    <li class="vote-row"><button>投票</button></li>
                </ul>
			</div>
			<div class="block man-block">
				<div class="block-title">运动户外</div>
				<ul>
					
					<c:if test="${fn:length(sessionScope.supertypes) > 0}">
						
               			<c:forEach items="${sessionScope.supertypes}" var="supertype">
	               			<c:if test="${supertype.id == 204 and fn:length(supertype.subtypes) > 0}">
	               			<c:forEach items="${supertype.subtypes}" var="subtype">
	               				
	               				<li><a href="getprodbysubtypepage?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	               			</c:forEach>
	               			</c:if>
              			</c:forEach>
        			</c:if>
				</ul>
			</div>
			<div class="paypal-block">
				<img src="resources/img/paypal_img.png" title="Paypal" alt="Paypal" />
			</div>
		</div>
		<div class="col-main">
			<div class="category-banner"><img src="resources/img/sunglass.jpg" alt="Banner" /></div>
            <hr>
            <a onclick="return click_a('divOne_1')" style="cursor:pointer; padding:10px; background:#ccc; display:block;">点击通过属性查询</a>
            <div id="divOne_1" style="display:none;">
            	<table width="90%">
                	<tr>
                    	<td width="10%"><strong>显卡：</strong></td>
                        <td width="5%"><a href="">全部</a></td>
                        <td ><a href="">独立显卡</a></td>
                        <td ><a href="">集成显卡</a></td>
                        <td ><a href="">集成显卡</a></td>
                        <td ><a href="">集成显卡</a></td>
                        <td ><a href="">集成显卡</a></td>
                        <td ><a href="">集成显卡</a></td>
                        <td ><a href="">集成显卡</a></td>
                        <td ><a href="">集成显卡</a></td>
                    </tr>
                    <tr>
                    	<td><strong>系统：</strong></td>
                        <td><a href="">全部</a></td>
                        <td><a href="">window8</a></td>
                    </tr>
                     <tr>
                    	<td><strong>屏幕尺寸：</strong></td>
                        <td><a href="">全部</a></td>
                        <td><a href="">14寸</a></td>
                        <td><a href="">13寸</a></td>
                    </tr>
                </table>
            </div> 
            <hr> 
			<div class="pager-container">
				<div class="view-by-block">					
					<div class="short-by">
						<label>排序方式</label>
                        <select name="sorttype" id="sorttype">
                       		<option value="intimedesc">按上架时间降序</option>
                            <option value="intimeasc">按上架时间升序</option>
                            <option value="nowpricedesc">按价格降序</option>
                            <option value="nowpricedesc">按价格升序</option>
                        </select>
					</div>
				</div>
			</div>
			<c:if test="${currentpageno==null }">
				<c:set var="currentpageno" value="0" scope="request"/>
			</c:if>
			<div class="new-product-block">
				<ul class="product-grid">
					<c:if test="${fn:length(requestScope.prods) > 0}">
						<c:forEach items="${requestScope.prods}" var="prod" varStatus="count">
							<li>
								<div class="pro-img"><img src="${pageScope.realpath}${prod.picture}" /></div>
								<div class="pro-content"><p>${prod.productname}</p></div>
								<div class="pro-price">${prod.nowprice}</div>
								<div class="pro-btn-block">
									<a class="add-cart left" href="addcart?product.id=${prod.id}&productcount=1">加入购物车</a>
									<a class="add-cart right quickCart inline" href="proddetail?product.id=${prod.id}">商品详情</a>					
		                        </div>
								<div class="pro-link-block">
									<a class="add-wishlist left" href="#">加入收藏</a>
									<a class="add-compare right" href="#">添加比较</a>
									<div class="clearfix"></div>
								</div>
							</li>
							<c:if test="${(count.index + 1) % 3 == 0}">
								<p>
							</c:if>
						</c:forEach>
					</c:if>
			</div>
			<div class="pager-container">
				<div align="center" id="page">
            <form  action="getprodbysupertypepage?currentpageno=0" method="post">
		<c:if test="${currentpageno>0}">
			<a  href="getprodbysupertypepage?currentpageno=0&pagesize=${pagesize}"  target="_self" >首页</a>  
			<a  href="getprodbysupertypepage?currentpageno=${currentpageno-1}&pagesize=${pagesize}"  target="_self" >上一页</a>
		</c:if>	  			
		<c:if test="${currentpageno==0}"> 首页 &nbsp;上一页</c:if>
		<c:if test="${currentpageno < totalpage-1}">			
			<a  href="getprodbysupertypepage?currentpageno=${currentpageno+1}&pagesize=${pagesize}"  target="_self" >下一页</a>  
			<a  href="getprodbysupertypepage?currentpageno=${totalpage-1}&pagesize=${pagesize}"  target="_self" >尾页</a>		
		</c:if> 
		<c:if test="${currentpageno==totalpage-1}"> 下一页 &nbsp;尾页</c:if> 第${currentpageno+1}页   共${totalpage}页    
		
	           	<%-- 每页记录数<input type="text" name="pagesize" value="${pagesize }"/>
	           			<input type="submit" value="确定"/> --%>
	 	</form>
    	</div>
				<!-- <div class="view-by-block">					
					<div class="short-by">
						<label>排序方式</label>
                        <select>
                       		<option>按上架时间降序</option>
                            <option>按上架时间升序</option>
                            <option>按价格降序</option>
                            <option>按价格升序</option>
                        </select>
					</div>
				</div> -->
			</div>
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
<!-- 小窗口 -->
<article style="display:none;">
        <section id="quick-view-container" class="quick-view-wrapper">
        <div class="quick-view-container">
            <div class="quick-view-left">
                <h2>Sunglass RB3184</h2>
                <div class="product-img-box">
                    <p class="product-image">
                        <img src="resources/img/sale_icon_img.png" title="Sale" alt="Sale" class="sale-img" />
                        <a href="view.html" title="Image"><img src="resources/img/quick_view_img.png" title="Image" alt="Image" /></a>				</p>
                    <ul class="thum-img">
                        <li><img  src="resources/img/quick_thum_img.png" title="" alt="" /></li>
                        <li><img  src="resources/img/quick_thum_img.png" title="" alt="" /></li>
                    </ul>
                </div>
            </div>
            <div class="quick-view-right tabs">
                <ul class="tab-block tabNavigation">
                    <li><a class="selected" title="Overview" href="#tabDetail">Overview</a></li>
                    <li><a title="Description" href="#tabDes">Description</a></li>
                </ul>
                <div id="tabDetail" class="tabDetail">
                    <div class="first-review">Be the first to review this product</div>
                <div class="price-box">
                    <span class="price">$600.00</span>			</div>
                <div class="availability">In stock</div>
                <div class="color-size-block">
                    <div class="label-row">
                        <label><em>*</em> color</label>
                        <span class="required">* Required Fields</span>				</div>
                    <div class="select-row">
                        <select><option>-- Please Select --</option></select>
                    </div>
                    <div class="label-row">
                        <label><em>*</em> size</label>
                    </div>
                    <div class="select-row">
                        <select><option>-- Please Select --</option></select>
                    </div>
                </div>
                <div class="add-to-cart-box">
                    <span class="qty-box">
                        <label for="qty">Qty:</label>
                        <a class="prev" title="" href="#"><img alt="" title="" src="resources/img/qty_prev.png"></a>
                        <input type="text" name="qty" class="input-text qty" id="qty" maxlength="12" value="1">
                        <a class="next" title="" href="#"><img alt="" title="" src="resources/img/qty_next.png"></a>				</span>
                    <button title="加入购物车" class="form-button"><span>加入购物车</span></button>
                </div>
                </div>
                <div id="tabDes" class="tabDes">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas erat odio, suscipit eu porta et, ultricies id sapien. Quisque posuere odio eget lectus suscipit sodales. Sed consequat, leo ut varius scelerisque, augue massa tincidunt est, et tincidunt enim tortor a metus. In sit amet diam in tellus tincidunt mollis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi hendrerit eleifend tortor, a dapibus tellus suscipit porta. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In mollis adipiscing mi et volutpat. Aliquam vitae dui nunc. Nulla ac ante eu massa dictum volutpat. Sed mauris sem, posuere sit amet pretium consectetur, ullamcorper vel orci. Aenean feugiat luctus lectus ac hendrerit. Fusce pulvinar, mauris eget sodales suscipit, diam neque condimentum lectus, id imperdiet felis turpis egestas neque. In aliquet orci eget nisl sollicitudin sed gravida tortor commodo</p>
                </div>
            </div>
            <div class="clearfix"></div>
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
