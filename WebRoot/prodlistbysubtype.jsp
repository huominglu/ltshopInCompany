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
<title>�����̳�</title>
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
<!-- CSS -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/orange.css"><!--��ɫ-->
<link rel="stylesheet" href="resources/css/skeleton.css"><!--�Ǽ�-->
<link rel="stylesheet" href="resources/css/layout.css"><!--����-->
<link rel="stylesheet" href="resources/css/ddsmoothmenu.css"/>
<link rel="stylesheet" href="resources/css/home_flexslider.css"/>
<link rel="stylesheet" href="resources/css/light_box.css"/>
<!-- ���ض��� -->
<link href="resources/css/zzsc.css" rel="stylesheet" type="text/css" />
<script src="resources/js/zzsc.js"></script>
<!-- �����л� -->
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
                    <li>${sessionScope.allnum }</li>
                    <li><a href="cart.jsp" title="Cart"><img title="Item" alt="Item" src="resources/img/item_icon.png" /></a></li>
                    <li><a href="cart.jsp">���ﳵ</a></li>
                </ul>
                <div id="minicart" class="remain_cart" style="display: none;">
                     <p class="empty">���ﳵ����2����Ʒ</p>
                     <ol>
                        <li>
                            <div class="img-block"><img src="resources/img/small_img.png" title="" alt="" /></div>
                            <div class="detail-block">
                                <h4><a href="#" title="����">����</a></h4>
                                <p>
                                    <strong>1</strong> ��900.00
                                </p>
                                <a href="#" title="����">����</a>
                            </div>
                            <div class="edit-delete-block">
                                <a href="#" title="ɾ��"><img src="resources/img/delete_item_btn.png" alt="Remove" title="ɾ��" /></a>
                            </div>
                        </li>
                        <li>
                            <div class="img-block"><img src="resources/img/small_img.png" title="" alt="" /></div>
                            <div class="detail-block">
                                <h4><a href="#" title="����">�ֻ�</a></h4>
                                <p>
                                    <strong>1</strong> ��1800.00
                                </p>
                                <a href="#" title="����">����</a>
                            </div>
                            <div class="edit-delete-block">
                                <a href="#" title="ɾ��"><img src="resources/img/delete_item_btn.png" alt="Remove" title="ɾ��" /></a>
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
				<li>��ƷС��</li>
			</ul>
		</div>
		<div class="col-left">
			<div class="block man-block">
				<div class="block-title">�Ҿ�&nbsp;�Ҿ�&nbsp;��װ</div>
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
				<div class="block-title">����</div>
                <ul>
                    <li class="question-row">����ϲ������ɫ��ʲô</li>
                    <li><input type="radio"><a >��ɫ</a></li>
                    <li><input type="radio"><a >��ɫ</a></li>
                    <li><input type="radio"><a>��ɫ</a></li>
                    <li><input type="radio"><a >õ��</a></li>
                    <li class="vote-row"><button>ͶƱ</button></li>
                </ul>
			</div>
			<div class="block man-block">
				<div class="block-title">�˶�����</div>
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
            <a onclick="return click_a('divOne_1')" style="cursor:pointer; padding:10px; background:#ccc; display:block;">���ͨ�����Բ�ѯ</a>
            <div id="divOne_1" style="display:none;">
            	<table width="90%">
                	<tr>
                    	<td width="10%"><strong>�Կ���</strong></td>
                        <td width="5%"><a href="">ȫ��</a></td>
                        <td ><a href="">�����Կ�</a></td>
                        <td ><a href="">�����Կ�</a></td>
                        <td ><a href="">�����Կ�</a></td>
                        <td ><a href="">�����Կ�</a></td>
                        <td ><a href="">�����Կ�</a></td>
                        <td ><a href="">�����Կ�</a></td>
                        <td ><a href="">�����Կ�</a></td>
                        <td ><a href="">�����Կ�</a></td>
                    </tr>
                    <tr>
                    	<td><strong>ϵͳ��</strong></td>
                        <td><a href="">ȫ��</a></td>
                        <td><a href="">window8</a></td>
                    </tr>
                     <tr>
                    	<td><strong>��Ļ�ߴ磺</strong></td>
                        <td><a href="">ȫ��</a></td>
                        <td><a href="">14��</a></td>
                        <td><a href="">13��</a></td>
                    </tr>
                </table>
            </div> 
            <hr> 
			<div class="pager-container">
				<div class="view-by-block">					
					<div class="short-by">
						<label>����ʽ</label>
                        <select name="sorttype" id="sorttype">
                       		<option value="intimedesc">���ϼ�ʱ�併��</option>
                            <option value="intimeasc">���ϼ�ʱ������</option>
                            <option value="nowpricedesc">���۸���</option>
                            <option value="nowpricedesc">���۸�����</option>
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
									<a class="add-cart left" href="addcart?product.id=${prod.id}&productcount=1">���빺�ﳵ</a>
									<a class="add-cart right quickCart inline" href="proddetail?product.id=${prod.id}">��Ʒ����</a>					
		                        </div>
								<div class="pro-link-block">
									<a class="add-wishlist left" href="#">�����ղ�</a>
									<a class="add-compare right" href="#">��ӱȽ�</a>
									<div class="clearfix"></div>
								</div>
							</li>
							<c:if test="${(count.index + 1) % 3 == 0}">
								<p>
							</c:if>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			<div class="pager-container">
				<div align="center" id="page">
            <form  action="getprodbysubtypepage?currentpageno=0" method="post">
		<c:if test="${currentpageno>0}">
			<a  href="getprodbysubtypepage?currentpageno=0&pagesize=${pagesize}"  target="_self" >��ҳ</a>  
			<a  href="getprodbysubtypepage?currentpageno=${currentpageno-1}&pagesize=${pagesize}"  target="_self" >��һҳ</a>
		</c:if>	  			
		<c:if test="${currentpageno==0}"> ��ҳ &nbsp;��һҳ</c:if>
		<c:if test="${currentpageno < totalpage-1}">			
			<a  href="getprodbysubtypepage?currentpageno=${currentpageno+1}&pagesize=${pagesize}"  target="_self" >��һҳ</a>  
			<a  href="getprodbysubtypepage?currentpageno=${totalpage-1}&pagesize=${pagesize}"  target="_self" >βҳ</a>		
		</c:if> 
		<c:if test="${currentpageno==totalpage-1}"> ��һҳ &nbsp;βҳ</c:if> ��${currentpageno+1}ҳ   ��${totalpage}ҳ    
		
	           	
	 	</form>
    	</div>
				
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
<!-- С���� -->
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
                    <button title="���빺�ﳵ" class="form-button"><span>���빺�ﳵ</span></button>
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
