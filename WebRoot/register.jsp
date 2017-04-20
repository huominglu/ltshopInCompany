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
<title>ע��</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/bitbug_favicon (1).ico">
<!--js-->
<script src="resources/js/jquery-1.8.3.min.js"></script>
<script src="resources/js/json2.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.flexslider.js"></script>
<!-- <script src="resources/js/jquery.elastislide.js"></script> -->
<script src="resources/js/jquery.jcarousel.min.js"></script>
<!-- <script src="resources/js/jquery.accordion.js"></script> -->
<script src="resources/js/light_box.js"></script>
<script src="resources/js/ddsmoothmenu.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/test.js"></script>
<!-- <script src="js/html.js"></script> -->
<script type="text/javascript">$(document).ready(function(){$(".inline").colorbox({inline:true, width:"50%"});});</script>
<!-- CSS  -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/orange.css"><!--��ɫ-->
<link rel="stylesheet" href="resources/css/skeleton.css"><!--�Ǽ�-->
<link rel="stylesheet" href="resources/css/layout.css"><!--����-->
<link rel="stylesheet" href="resources/css/ddsmoothmenu.css"/>
<!--<link rel="stylesheet" href="css/elastislide.css"/> -->
<link rel="stylesheet" href="resources/css/home_flexslider.css"/>
<link rel="stylesheet" href="resources/css/light_box.css"/>
<script type="text/javascript">
$().ready(function(){
	$("#phone").blur(function(){
		var mobil = $("#phone").val();
		$.ajax({
			type:"post",
			url:"registercheck",
			data:"info="+mobil,
			success:function(re){
				var obj = JSON.parse(re);
				var ret = obj.re;
				if(ret == "�Ѿ�����"){
					$("#phone").val("");
					alert("���ֻ����Ѿ�ע��");
				}
			}
		});
	});
	$("#email").blur(function(){
		var email = $("#email").val();
		$.ajax({
			type:"post",
			url:"registercheck",
			data:"info="+email,
			success:function(re){
				var obj = JSON.parse(re);
				var ret = obj.re;
				if(ret == "�Ѿ�����"){
					$("#email").val("");
					alert("�������Ѿ�ע��");
				}
			}
		});
	});
	$("#username").blur(function(){
		var username = $("#username").val();
		$.ajax({
			type:"post",
			url:"registercheck",
			data:"info="+username,
			success:function(re){
				var obj = JSON.parse(re);
				var ret = obj.re;
				if(ret == "�Ѿ�����"){
					$("#username").val("");
					alert("���û����Ѿ�����");
				}
			}
		});
	});
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
	                      	<a href="listorder1">�鿴����</a>
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
                    <li>${sessionScope.allnum }</li>
                    <li><a href="cart.jsp" title="Cart"><img title="Item" alt="Item" src="resources/img/item_icon.png" /></a></li>
                    <li><a href="cart.jsp">���ﳵ</a></li>
                </ul>
                <div id="minicart" class="remain_cart" style="display: none;">
                     <p class="empty">���ﳵ����${sessionScope.allnum }����Ʒ</p>
                     <ol>
                     	<c:forEach items="${sessionScope.pics }" var="pic">
	                        <li>
	                            <div class="img-block"><img src="resources/img/small_img.png" title="" alt="" /></div>
	                            <div class="detail-block">
	                                <h4><a>${pic.value.productname }</a></h4>
	                                <p>
	                                    <strong>${pic.value.num }</strong> ��${pic.value.price * pic.value.num }
	                                </p>
	                                <a href="#" title="����">����</a>
	                            </div>
	                            <div class="edit-delete-block">
	                                <a href="deletepic?productInCart.productid=${pic.value.productid }" title="ɾ��"><img src="resources/img/delete_item_btn.png" alt="Remove" title="ɾ��" /></a>
	                            </div>
	                        </li>
                        </c:forEach>
                        <li>
                            <div class="total-block">�ϼ�:<span>��${sessionScope.allprice }</span></div>
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
	                	<a href="getprodbysupertype?superType.id=6">���õ���</a>
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
	                	<a href="getprodbysupertype?superType.id=204">�˶�&����</a>
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
	                	<a href="getprodbysupertype?superType.id=29">�칫��Ʒ&����</a>
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
	                	<a href="getprodbysupertype?superType.id=61">����Ʒ&��ױƷ</a>
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
	                	<a href="getprodbysupertype?superType.id=30">��װ&Ůװ</a>
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
	                	<a href="getprodbysupertype?superType.id=202">Ь��&���</a>
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
<!--���ⲿ��-->
<section class="content-wrapper">
	<div class="content-container container">
		<div class="main">
			<h1 class="page-title">ע���˺�</h1>
			<div class="fieldset">
            <form method="post" action="register" class="login" onClick="return checkRegister()">
	            <h2 class="legend">������Ϣ</h2>
				<ul class="form-list">
					<li class="fields">
						<div>
							<div class="input-box">
								<label >�ֻ���<em>*</em></label>
								<input type="text" class="required-entry input-text" value="" id="phone" name="user.mobil">
                                <label id="info"></label>
							</div>
							<div class="input-box">
								<label >����<em>*</em></label>
								<input type="text" class="required-entry input-text" value="" id="email" name="user.email">
                                <label id="info1"></label>
							</div>
							<div class="clear"></div>
						</div>                
                    </li>
				</ul>
				<h2 class="legend">��½��Ϣ</h2>
				<ul class="form-list">
					<li class="fields">
						<div >
							<div class="input-box ">
								<label >�û���<em>*</em></label>
								<input type="text" class="required-entry input-text" value="" id="username" name="user.username">
                                <label id="info2"></label>
							</div>
							<div class="input-box">
								<label >����<em>*</em></label>
								<input type="password" class="required-entry input-text" value="" id="password" name="user.password">
                                <label id="info3"></label>
							</div>
                            <div class="input-box">
								<label >ȷ������<em>*</em></label>
								<input type="password" class="required-entry input-text" value="" id="psw">
                                <label id="info4"></label>
							</div>
							<div class="clear"></div>
						</div>
					</li>
				</ul>
				<div class="buttons-set">
					<button class="orange-btn" type="submit">ע��</button>
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

