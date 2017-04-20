<%@ page language="java" import="java.util.*" pageEncoding="GB18030" contentType="text/html; charset=GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<head>
<base href="<%=basePath%>">
<title>个人信息</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/bitbug_favicon (1).ico">
<!--js-->
<script src="resources/js/jquery-1.8.3.min.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.flexslider.js"></script>
<!-- <script src="resources/js/jquery.elastislide.js"></script> -->
<script src="resources/js/jquery.jcarousel.min.js"></script>
<!-- <script src="resources/js/jquery.accordion.js"></script> -->
<script src="resources/js/light_box.js"></script>
<script src="resources/js/ddsmoothmenu.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/test.js"></script>
<!-- <script src="resources/js/html.js"></script> -->
<script src="laydate/laydate.js"></script>
<script type="text/javascript">$(document).ready(function(){$(".inline").colorbox({inline:true, width:"50%"});});</script>
<!-- CSS  -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/orange.css"><!--颜色-->
<link rel="stylesheet" href="resources/css/skeleton.css"><!--骨架-->
<link rel="stylesheet" href="resources/css/layout.css"><!--布局-->
<link rel="stylesheet" href="resources/css/ddsmoothmenu.css"/>
<!--<link rel="stylesheet" href="resources/css/elastislide.css"/> -->
<link rel="stylesheet" href="resources/css/home_flexslider.css"/>
<link rel="stylesheet" href="resources/css/light_box.css"/>
<script type="text/javascript">
	$().ready(function(){
		var gender = '${sessionScope.user.gender }';
		if(gender == 0){
			$("#gender1").attr("checked","checked");
		}else{
			$("#gender2").attr("checked","checked");
		}
	});
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
<!--Content Block-->
<section class="content-wrapper">
	<div class="content-container container">
		<div class="main">
			<h1 class="page-title">完善个人信息</h1>
			<div class="fieldset">
            <form method="post" action="userInfoModify" class="login" >
	            <h2 class="legend">个人信息</h2>
				<ul class="form-list">
					<li class="fields">
                    	<div>
							<div class="input-box">
								<label>用户名<em>*</em></label>
								<input type="hidden" name="user.id" value="${sessionScope.user.id }">
								<input type="text" class="required-entry input-text" value="${sessionScope.user.username }" readonly="readonly" id="username" name="user.username">
								<label>用户名不能修改</label>
							</div>
							<div>
								<label>密码<em>*</em></label><br>
                                <input type="password" class="required-entry input-text" value="${sessionScope.user.password }" id="password" name="user.password" onBlur="return checkUserinfo()"><br>
                                <label id="info1"></label>
							</div>
							<div class="clear"></div>	
						</div>
                        <br>   
                        <div>
							<div class="input-box">
								<label>用户真实姓名<em>*</em></label>
								<input type="text" class="required-entry input-text" value="${sessionScope.user.realname }" id="realname" name="user.realname" onBlur="return checkUserinfo()">
                                <label id="info2"></label>
							</div>
                            <div class="input-box">
								<label>地址<em>*</em></label>
								<input type="text" class="required-entry input-text" value="${sessionScope.user.address }" id="address" name="user.address" onBlur="return checkUserinfo()">
                                <label id="info3"></label>
							</div>
							<div class="clear"></div>	
						</div>
                        <br>     
                        <div>
							<div class="input-box">
								<label>生日<em>*</em></label><br>
								<input type="text" class="required-entry input-text" value="${sessionScope.user.birthday }" id="birthday" name="user.birthday" onclick="laydate()">
							</div>
							<div>
								<label>性别<em>*</em></label><br>
                                <input id="gender1"  name="user.gender" type="radio" value="0">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input id="gender2"  name="user.gender" type="radio" value="1">女
							</div>
							<div class="clear"></div>	
						</div>     
                        <br>     
                        <div>
							<div class="input-box">
								<label>手机号<em>*</em></label>
								<input type="text" class="required-entry input-text" value="${sessionScope.user.mobil }" id="mobil" name="user.mobil" onBlur="return checkUserinfo()">
                                <label id="info4"></label>
							</div>
                            <div class="input-box">
								<label>固定电话<em>*</em></label>
								<input type="text" class="required-entry input-text" value="${sessionScope.user.phone }" id="phone" name="user.phone" onBlur="return checkUserinfo()">
                                <label id="info5"></label>
							</div>
							
							<div class="clear"></div>	
						</div>  
                        <br>     
                        <div>
							<div class="input-box">
								<label>邮箱<em>*</em></label>
								<input type="text" class="required-entry input-text" value="${sessionScope.user.email }" id="email" name="user.email" onBlur="return checkUserinfo()">
                                <label id="info6"></label>
							</div>
                            <div class="input-box">
								<label>邮编<em>*</em></label>
								<input type="text" class="required-entry input-text" value="${sessionScope.user.postcode }" id="postcode" name="user.postcode" onBlur="return checkUserinfo()">
                                <label id="info7"></label>
							</div>							
							<div class="clear"></div>	
						</div> 
                        <br> 
                        <div>
                        	<div class="input-box">
								<label>积分&nbsp;&nbsp;</label>
								<label>${sessionScope.user.score }</label>
								<input type="hidden" name="user.score" value="${sessionScope.user.score }"/>
								<input type="hidden" name="user.status" value="${sessionScope.user.status }"/>
							</div>
                        	<div class="clear"></div>	
                        </div>                
                    </li>
				</ul>
				<div class="buttons-set">
					<button class="orange-btn" type="submit" onClick="return checkUserinfo()">提交</button>
					<div class="clear"></div>
				</div>
                </form>
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