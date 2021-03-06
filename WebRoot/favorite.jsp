<%@ page language="java" import="java.util.*" pageEncoding="GB18030" contentType="text/html; charset=GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=gb18030">
<head>
<base href="<%=basePath%>">
<title>龙腾商城首页</title>
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
<script src="resources/js/test.js"></script>
<script src="resources/js/comment.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/orange.css"><!--颜色-->
<link rel="stylesheet" href="resources/css/skeleton.css"><!--骨架-->
<link rel="stylesheet" href="resources/css/layout.css"><!--布局-->
<link rel="stylesheet" href="resources/css/ddsmoothmenu.css"/>
<link rel="stylesheet" href="resources/css/home_flexslider.css"/>
<link rel="stylesheet" href="resources/css/light_box.css"/>
<link rel="stylesheet" href="resources/css/table.css"/>
<!-- 返回顶部 -->
<link href="resources/css/zzsc.css" rel="stylesheet" type="text/css" />
<script src="resources/js/zzsc.js"></script> 
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
                    <li>(2)</li>
                    <li><a href="cart.jsp" title="Cart"><img title="Item" alt="Item" src="resources/img/item_icon.png" /></a></li>
                    <li><a href="cart.jsp">购物车</a></li>
                </ul>
                <div id="minicart" class="remain_cart" style="display: none;">
                     <p class="empty">购物车内有2件商品</p>
                     <ol>
                        <li>
                            <div class="img-block"><img src="resources/img/small_img.png" title="" alt="" /></div>
                            <div class="detail-block">
                                <h4><a href="#" title="手链">手链</a></h4>
                                <p>
                                    <strong>1</strong> ￥900.00
                                </p>
                                <a href="#" title="详情">详情</a>
                            </div>
                            <div class="edit-delete-block">
                                <a href="#" title="删除"><img src="resources/img/delete_item_btn.png" alt="Remove" title="删除" /></a>
                            </div>
                        </li>
                        <li>
                            <div class="img-block"><img src="resources/img/small_img.png" title="" alt="" /></div>
                            <div class="detail-block">
                                <h4><a href="#" title="手链">手机</a></h4>
                                <p>
                                    <strong>1</strong> ￥1800.00
                                </p>
                                <a href="#" title="详情">详情</a>
                            </div>
                            <div class="edit-delete-block">
                                <a href="#" title="删除"><img src="resources/img/delete_item_btn.png" alt="Remove" title="删除" /></a>
                            </div>
                        </li>
                        <li>
                            <div class="total-block">合计:<span>￥2700.00</span></div>
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
                    <li><a href="category.html" title="暂无二级分类">家用电器</a></li>
                    <li><a href="category.html" title="">手机&nbsp;数码&nbsp;通信</a></li>
                    <li><a href="category.html" title="">电脑&nbsp;办公</a></li>
                    <li><a href="category.html">家居&nbsp;家具&nbsp;家装</a>
                        <ul>
                            <li><a href="category.html">Second level</a></li>
                            <li><a href="category.html">Second level</a></li>
                            <li><a href="category.html">Second level</a></li>
                            <li><a href="category.html">Second level</a></li>
                            <li><a href="category.html">Second level</a></li>
                            <li><a href="category.html">Second level</a></li>
                          </ul>
                    </li>
                    <li><a href="category.html" title="">个护化妆</a></li>
                    <li><a href="category.html" title="">运动户外</a></li>
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
                    <li>收藏夹</li>
                </ul>
            </div>
            <div class="col-left">
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
            </div>
            <div  class="col-main">
                <div class="contact-form-container">
                <form method="post" action="com_success.html">
                    <div  class="form-title">收藏夹</div>
                    <table width="100%">
                        <tr>
                        	<th width="30%">商品图片</th>
                            <th>商品名称</th>
                            <th>商品单价</th>
                            <th>收藏日期</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                        	<td><img src="resources/img/7.jpg" width="165" height="165"/></td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                        </tr>			
                        <tr>
                        	<td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                        </tr>			
                        <tr>
                        	<td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                        </tr>			
                        <tr>
                        	<td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                        </tr>	
                        <tr>
                        	<td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                        </tr>	
                        <tr>
                        	<td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>
                        </tr>																						
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
                </form>
                </div>
            </div>
            <div class="generic-product-list">
				<h4>基于您的选择,您可能会感兴趣的商品:</h4>
				<ul>
					<li>
						<div class="left-img"><img src="resources/img/tshir_img.png" title="" alt="" /></div>
						<div class="right-content">
							<div class="pro-name">White Round Neck <br>T-Shirt</div>
							<div class="pro-price">￥600.00</div>
							<div class="add-cart-row">
                            	<button class="orange-btn">加入购物车</button>
                            </div>
							<a href="#" class="add-wishlist">加入收藏</a>
							<a href="#" class="add-compare">添加比较</a>
						</div>
					</li>
					<li>
						<div class="left-img"><img src="resources/img/tshir_img.png" title="" alt="" /></div>
						<div class="right-content">
							<div class="pro-name">White Round Neck <br>T-Shirt</div>
							<div class="pro-price">￥600.00</div>
							<div class="add-cart-row"><button class="orange-btn" title="加入购物车">加入购物车</button></div>
							<a href="#" class="add-wishlist" title="加入收藏">加入收藏</a>
							<a href="#" class="add-compare" title="添加比较">添加比较</a>
						</div>
					</li>
					<li>
						<div class="left-img"><img src="resources/img/tshir_img.png" title="" alt="" /></div>
						<div class="right-content">
							<div class="pro-name">White Round Neck <br>T-Shirt</div>
							<div class="pro-price">￥600.00</div>
							<div class="add-cart-row"><button class="orange-btn" title="加入购物车">加入购物车</button></div>
							<a href="#" class="add-wishlist" title="加入收藏">加入收藏</a>
							<a href="#" class="add-compare" title="添加比较">添加比较</a>
						</div>
					</li>
					<li>
						<div class="left-img"><img src="resources/img/tshir_img.png" title="" alt="" /></div>
						<div class="right-content">
							<div class="pro-name">White Round Neck <br>T-Shirt</div>
							<div class="pro-price">￥600.00</div>
							<div class="add-cart-row"><button class="orange-btn" title="加入购物车">加入购物车</button></div>
							<a href="#" class="add-wishlist" title="加入收藏">加入收藏</a>
							<a href="#" class="add-compare" title="添加比较">添加比较</a>
						</div>
					</li>
				</ul>
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
