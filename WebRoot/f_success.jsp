<%@ page language="java" import="java.util.*" pageEncoding="GB18030" contentType="text/html; charset=GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=gb18030">
<head>
<title>�����̳���ҳ</title>
<!-- titleͼ�� -->
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
<!-- CSS -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/orange.css"><!--��ɫ-->
<link rel="stylesheet" href="resources/css/skeleton.css"><!--�Ǽ�-->
<link rel="stylesheet" href="resources/css/layout.css"><!--����-->
<link rel="stylesheet" href="resources/css/ddsmoothmenu.css"/>
<!--<link rel="stylesheet" href="resources/css/elastislide.css"/> -->
<link rel="stylesheet" href="resources/css/home_flexslider.css"/>
<link rel="stylesheet" href="resources/css/light_box.css"/>
<!-- ���ض��� -->
<link href="resources/css/zzsc.css" rel="stylesheet" type="text/css" />
<script src="resources/js/zzsc.js"></script> 
</head>
<body>
	<a href="" class="cd-top">Top</a>
	<div class="mainContainer sixteen container">
        <!--ͷ��-->
        <div class="header-wrapper">
          <header class="container">
            <div class="head-right">
            	<c:if test="${!empty sessionScope.user }">
                    <ul class="top-nav">
                    	<li><a>${sessionScope.user.realname }����</a></li>
                        <li class=""><a href="userinfo.jsp" title="My Account">��������</a></li>
                        <li class="my-wishlist"><a href="favorite.jsp" title="My Wishlist">�ղ�</a></li>
                        <li class="log-in"><a href="exitUser">�˳���¼</a></li>
                    </ul>
	                <ul class="currencyBox">
	                    <li id="header_currancy" class="currency">
	                      <a class="mainCurrency" href="#">&lt;�ҵ������̳�</a>
	                      <div id="currancyBox" class="currency_detial">
	                      	<a href="orderlist.jsp">�鿴��������</a>
	                      </div>
	                    </li>
	                </ul>
                </c:if>
                <c:if test="${empty sessionScope.user }">
                	<ul class="top-nav">
                		<li><a>���ã���ӭ���������̳�</a></li>
                        <li class="contact-us"><a href="register.jsp" title="Contact Us">ע��</a></li>
                        <li class="log-in"><a href="login.jsp">��¼</a></li>
                    </ul>
                </c:if>
              <section class="header-bottom">
                <div class="cart-block">
                <ul>
                    <li>(2)</li>
                    <li><a href="cart.jsp" title="Cart"><img title="Item" alt="Item" src="resources/resources/resources/img/item_icon.png" /></a></li>
                    <li><a href="cart.jsp">���ﳵ</a></li>
                </ul>
                <div id="minicart" class="remain_cart" style="display: none;">
                     <p class="empty">���ﳵ����2����Ʒ</p>
                     <ol>
                        <li>
                            <div class="img-block"><img src="resources/resources/resources/img/small_img.png" title="" alt="" /></div>
                            <div class="detail-block">
                                <h4><a href="#" title="����">����</a></h4>
                                <p>
                                    <strong>1</strong> ��900.00
                                </p>
                                <a href="#" title="����">����</a>
                            </div>
                            <div class="edit-delete-block">
                                <a href="#" title="ɾ��"><img src="resources/resources/resources/img/delete_item_btn.png" alt="Remove" title="ɾ��" /></a>
                            </div>
                        </li>
                        <li>
                            <div class="img-block"><img src="resources/resources/resources/img/small_img.png" title="" alt="" /></div>
                            <div class="detail-block">
                                <h4><a href="#" title="����">�ֻ�</a></h4>
                                <p>
                                    <strong>1</strong> ��1800.00
                                </p>
                                <a href="#" title="����">����</a>
                            </div>
                            <div class="edit-delete-block">
                                <a href="#" title="ɾ��"><img src="resources/resources/resources/img/delete_item_btn.png" alt="Remove" title="ɾ��" /></a>
                            </div>
                        </li>
                        <li>
                            <div class="total-block">�ϼ�:<span>��2700.00</span></div>
                            <a href="cart.jsp" class="orange-btn">����</a>
                            <div class="clear"></div>
                        </li>
                     </ol>
                </div>
            </div>
                <div class="search-block">
                  <input type="text" value="����" />
                  <input type="submit" value="Search" title="����" />
                </div>
              </section>
            </div>
             <div class="right-nav">
                <ul>
                    <li><a onclick=""><img src="resources/img/1.png" width="20px" height="20px"/>&nbsp;&nbsp;&nbsp;�����̳�</a></li>						
                </ul>
			</div>
            <h1 class="logo">
              	<img alt="Logo" src="resources/img/logo.gif" />
            </h1>           
            <nav id="smoothmenu1" class="ddsmoothmenu mainMenu">
              <ul id="nav">
                <li class="active"><a href="index.jsp">��ҳ</a></li>
                <li class=""><a href="category.html" title="Shop by">��Ʒ����</a>
                  <ul>
                    <li><a href="category.html" title="���޶�������">���õ���</a></li>
                    <li><a href="category.html" title="">�ֻ�&nbsp;����&nbsp;ͨ��</a></li>
                    <li><a href="category.html" title="">����&nbsp;�칫</a></li>
                    <li><a href="category.html">�Ҿ�&nbsp;�Ҿ�&nbsp;��װ</a>
                        <ul>
                            <li><a href="category.html">Second level</a></li>
                            <li><a href="category.html">Second level</a></li>
                            <li><a href="category.html">Second level</a></li>
                            <li><a href="category.html">Second level</a></li>
                            <li><a href="category.html">Second level</a></li>
                            <li><a href="category.html">Second level</a></li>
                          </ul>
                    </li>
                    <li><a href="category.html" title="">������ױ</a></li>
                    <li><a href="category.html" title="">�˶�����</a></li>
                  </ul>
                </li>
                <li class=""><a href="">��װ��</a></li>
                <li class=""><a href="">��ױ��</a></li>
                <li class=""><a href="">����</a></li>
                <li class=""><a href="">�˶�����</a></li>
                <li class=""><a href="about_us.html" title="About us">��������</a></li>
              </ul>
            </nav>          
          </header>
        </div>
<!-- ���岿�� -->
<section class="content-wrapper">
	<div class="content-container container">
		<div class="breadcrum-container">
			<ul>
				<li><a href="index.jsp">��ҳ</a></li>
                <li>�ղسɹ�</li>
			</ul>
		</div>
		<div class="main">
			<div class="error-container">
				<img src="resources/img/7.jpg" /><h2>��Ʒ�ղسɹ�</h2>
				<p><span id="jumpTo">5</span>����Զ���ת����ҳ</p>
                <script type="text/javascript">countDown(5,'index.jsp');</script> 
				<div class="f-fix">
					<a href="index.jsp" class="orange-btn">������ҳ</a>
					<a href="favorite.jsp" class="orange-btn">ȥ�ղؼ�</a>
				</div>
			</div>
		</div>
        <div class="generic-product-list">
				<h4>��������ѡ��,�����ܻ����Ȥ����Ʒ:</h4>
				<ul>
					<li>
						<div class="left-img"><img src="resources/img/tshir_img.png" title="" alt="" /></div>
						<div class="right-content">
							<div class="pro-name">White Round Neck <br>T-Shirt</div>
							<div class="pro-price">��600.00</div>
							<div class="add-cart-row">
                            	<button class="orange-btn">���빺�ﳵ</button>
                            </div>
							<a href="#" class="add-wishlist">�����ղ�</a>
							<a href="#" class="add-compare">��ӱȽ�</a>
						</div>
					</li>
					<li>
						<div class="left-img"><img src="resources/img/tshir_img.png" title="" alt="" /></div>
						<div class="right-content">
							<div class="pro-name">White Round Neck <br>T-Shirt</div>
							<div class="pro-price">��600.00</div>
							<div class="add-cart-row"><button class="orange-btn" title="���빺�ﳵ">���빺�ﳵ</button></div>
							<a href="#" class="add-wishlist" title="�����ղ�">�����ղ�</a>
							<a href="#" class="add-compare" title="��ӱȽ�">��ӱȽ�</a>
						</div>
					</li>
					<li>
						<div class="left-img"><img src="resources/img/tshir_img.png" title="" alt="" /></div>
						<div class="right-content">
							<div class="pro-name">White Round Neck <br>T-Shirt</div>
							<div class="pro-price">��600.00</div>
							<div class="add-cart-row"><button class="orange-btn" title="���빺�ﳵ">���빺�ﳵ</button></div>
							<a href="#" class="add-wishlist" title="�����ղ�">�����ղ�</a>
							<a href="#" class="add-compare" title="��ӱȽ�">��ӱȽ�</a>
						</div>
					</li>
					<li>
						<div class="left-img"><img src="resources/img/tshir_img.png" title="" alt="" /></div>
						<div class="right-content">
							<div class="pro-name">White Round Neck <br>T-Shirt</div>
							<div class="pro-price">��600.00</div>
							<div class="add-cart-row"><button class="orange-btn" title="���빺�ﳵ">���빺�ﳵ</button></div>
							<a href="#" class="add-wishlist" title="�����ղ�">�����ղ�</a>
							<a href="#" class="add-compare" title="��ӱȽ�">��ӱȽ�</a>
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
                <h2>���Ĵ�����Ϣ</h2>
                <input type="text" value="��������" title="" />
                <input type="submit" value="����" title="Submit" />
            </div>
		</div>	
	</div>
</section>
</div>    
      
 <!--ҳ��-->
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
              	Copyright &copy; 2016.����.
              </p>
            </div>
          </footer>
        </section>
</body>
</html>
