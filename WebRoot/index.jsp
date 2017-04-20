<%@ page language="java" import="java.util.*" pageEncoding="GB18030" contentType="text/html; charset=GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String realpath = basePath + "upfile/";
pageContext.setAttribute("realpath",realpath);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<head>
<base href="<%=basePath%>">
<title>�����̳���ҳ</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!--js-->
<script src="resources/js/jquery-1.8.3.min.js"></script>
<script src="resources/js/json2.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.flexslider.js"></script>
<script src="resources/js/jquery.jcarousel.min.js"></script>
<script src="resources/js/light_box.js"></script>
<script src="resources/js/ddsmoothmenu.js"></script>
<script src="resources/js/common.js"></script>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/index1.css"/>
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
<!-- ����� -->
<script type="text/javascript">
		var meninfo = "HTC�¿���VT(T328t) 4G�ֻ�(��Լ��) ȫ��ͨ";
		function runhorse() {
			var divObj = document.getElementById("word1");
			divObj.innerText = meninfo.substring(0, meninfo.length);
			meninfo = meninfo + meninfo.substring(0, 1);
		    meninfo = meninfo.substring(1, meninfo.length);
		}
		window.setInterval("runhorse()", 500);  
</script>
<!-- �л� -->
<script type="text/javascript" language="javascript">
	function jdtxArrowMove(obj){
		document.getElementById("jdtx_arrow").style.left = obj.style.left;
		document.getElementById("jdtx_arrow").style.width = obj.style.width;
	}
	function jdtxSel(arr){
		for(var i = 0; i < arr.length; i++){
			document.getElementById(arr[i]).style.color = "#666";
			document.getElementById(arr[i]).parentNode.lastChild.className = "smc dn";
		}
		document.getElementById(arr[0]).style.color = "#F75010";
		document.getElementById(arr[0]).parentNode.lastChild.className = "smc";
	}
</script>
 <script type="text/javascript" language="javascript">
function jdtxRBADVMove(obj){
	var spans = document.getElementById("jdtx_rbadv_control").getElementsByTagName("span");
	for(var i = 0; i < spans.length; i++){
		if(spans[i] == obj){
			document.getElementById("jdtx_rbadv_win").scrollLeft = 209*i;
			obj.className = "curr";
		} else {
			spans[i].className = "";
		}
	}
}
var registerinfo = '${requestScope.registerinfo}';
if(registerinfo != ""){
	alert(registerinfo);
}
</script>
<script type="text/javascript">
//��ȡ����
$().ready(function(){
	$.ajax({
		type:"post",
		url:"getNewNotice",
		success:function(re){
			var obj = JSON.parse(re);
			$.each(obj,function(i,value){
				var htm = "<font style='font-weight: bold;'>��"+value.noticetitle+"��</font>&nbsp;&nbsp;<label id='wenzi'>"+value.noticecontent+"</label><br>";
				$("#notice").append(htm);
			});
		}
	});
});
</script>
<script type="text/javascript">
//��ȡ���
$().ready(function(){
	$.ajax({
		type:"post",
		url:"getNewAd",
		success:function(res){
			var obj1 = JSON.parse(res);
			$.each(obj1,function(j,va){
				$("#adlist img:eq("+j+")").attr("src","upfile/"+va.picture);
			});
		}
	});
//��ȡ���д���С�����session�Ա�����ҳ��ʾ���������˵�
	$.ajax({
		type:"post",
		url:"getsupts",
		success:function(result){
		}
	});
//��ȡ����ҳ��ʾ���ؼ���Ʒ
	$.ajax({
		type:"post",
		url:"getprodbyissale",
		success:function(result){
			var jsonobj = JSON.parse(result);
			$("#mix").html("");
			var picpath = "${pageScope.realpath }";
			$.each(jsonobj,function(i,value){
				var opo = "<li><div class='pro-img'><img src='"+picpath+value.picture+"' width='175' height='175'/></div>"
				+"<div class='pro-hover-block'"+">"+
                    "<h4 class='pro-name'"+">"+value.productname+"</h4>"+
                    "<div class='link-block'"+">"+ 
                    "<a href="+"proddetail?product.id="+value.id+" class='quickproLink'"+" title='��Ʒ����'"+">"+value.productname+"</a></div>"+
                    "<div class='pro-price'"+">��"+value.nowprice+"</div>"+
                  "</div>"+
                "</li>";
                if (i<4) {
					 $("#mix").append(opo);
				}
          
			});
// 			alert("aaaaaaaaaaaa");
			getInewProd();
			getisspecial();
		}
	});
});
//��ȡ������Ʒ
function getInewProd(){
	$.ajax({
		type:"post",
		url:"getprodbyisnew",
		success:function(result){
			var jsonobj = JSON.parse(result);
			$("#isnew").html("");
			var picpath = "${pageScope.realpath }";
			$.each(jsonobj,function(i,value){
				var opo = "<li>"+
			      "<div class='pro-img'"+">"+
			        "<img width='175'"+" height='175'"+" src='"+picpath+value.picture+"'/>"+
			      "</div>"+
			      "<div class='pro-content'"+">"+
			        "<p>"+value.productname+"</p>"+
			      "</div>"+
			      "<div class='pro-price'"+">��"+value.nowprice+"</div>"+
			      "<div class='pro-btn-block'"+">"+ 
			          "<a class='add-cart left'"+" href="+"addcart?product.id="+value.id+"&prodcount=1"+">���빺�ﳵ</a>"+ 
			          "<a class='add-cart right quickCart inline'"+" href="+"proddetail?product.id="+value.id+">��Ʒ����</a>"+
			      "</div>"+
			      "<div class='pro-link-block'"+">"+  
			      	  "<a class='add-wishlist left'"+" href="+""+">�����ղ�</a>"+
			          "<a class='add-compare right'"+" href="+""+">��ӱȽ�</a>"+
			          "<div class='clearfix'"+"></div>"+
			      "</div>"+
			    "</li>";

				$("#isnew").append(opo);


			});
		}
	});
}

//��ȡ�Ƽ���Ʒ
function getisspecial(){
	$.ajax({
		type:"post",
		url:"getprodisspecial",
		success:function(result){
			var jsonobj = JSON.parse(result);
			$("#isspecial").html("");
			var picpath = "${pageScope.realpath }";
			$.each(jsonobj,function(i,value){
				var opo = "<li>"+
			      "<div class='pro-img'"+">"+
			        "<img width='175'"+" height='175'"+" src='"+picpath+value.picture+"'/>"+
			      "</div>"+
			      "<div class='pro-content'"+">"+
			        "<p>"+value.productname+"</p>"+
			      "</div>"+
			      "<div class='pro-price'"+">��"+value.nowprice+"</div>"+
			      "<div class='pro-btn-block'"+">"+ 
			          "<a class='add-cart left'"+" href="+"addcart?product.id="+value.id+"&prodcount=1"+">���빺�ﳵ</a>"+ 
			          "<a class='add-cart right quickCart inline'"+" href="+"proddetail?product.id="+value.id+">��Ʒ����</a>"+
			      "</div>"+
			      "<div class='pro-link-block'"+">"+  
			      	  "<a class='add-wishlist left'"+" href="+""+">�����ղ�</a>"+
			          "<a class='add-compare right'"+" href="+""+">��ӱȽ�</a>"+
			          "<div class='clearfix'"+"></div>"+
			      "</div>"+
			    "</li>";

				$("#isspecial").append(opo);

			});
		}
	});
}

</script>
</head>
<body>
	<font style="font-weight: bold;"></font>
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
	                <li class="">
	                	<a href="getprodbysupertypepage?superType.id=6">���õ���</a>
	                		<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 6 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtypepage?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	                			</c:forEach>
	                			</c:if>
                			</c:forEach>
               				</c:if>
	                		</ul>
	                	
	                </li>
	                <li class="">
	                	<a href="getprodbysupertypepage?superType.id=204">�˶�&����</a>
	                	<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 204 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtypepage?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	                			</c:forEach>
	                			</c:if>
                			</c:forEach>
               				</c:if>
	                		</ul>
	                </li>
	                <li class="">
	                	<a href="getprodbysupertypepage?superType.id=29">�칫��Ʒ&����</a>
	                	<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 29 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtypepage?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	                			</c:forEach>
	                			</c:if>
                			</c:forEach>
               				</c:if>
	                		</ul>
	                </li>
	                <li class="">
	                	<a href="getprodbysupertypepage?superType.id=61">����Ʒ&��ױƷ</a>
	                	<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 61 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtypepage?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	                			</c:forEach>
	                			</c:if>
                			</c:forEach>
               				</c:if>
	                		</ul>
	                </li>
	                <li class="">
	                	<a href="getprodbysupertypepage?superType.id=30">��װ&Ůװ</a>
	                	<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 30 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtypepage?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
	                			</c:forEach>
	                			</c:if>
                			</c:forEach>
               				</c:if>
	                		</ul>
	                </li>
	                <li class="">
	                	<a href="getprodbysupertypepage?superType.id=202">Ь��&���</a>
	                	<ul>
	                		<c:if test="${fn:length(sessionScope.supertypes) > 0}">
	                		<c:forEach items="${sessionScope.supertypes}" var="supertype">
	                			<c:if test="${supertype.id == 202 and fn:length(supertype.subtypes) > 0 }">
	                			<c:forEach items="${supertype.subtypes}" var="subtype">
	                			<li><a href="getprodbysubtypepage?subType.id=${subtype.id}">${subtype.subtypename}</a></li>
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
        <!-- ��� ����-->
        <section class="banner-wrapper">
          <div class="banner-block container">
            <div class="flexslider">
              <ul class="slides" id="adlist">
                <li ><img id="adlist0"  src="" style="height:400px"/></li>
                <li ><img id="adlist1"  src="" style="height:400px"/></li>
                <li ><img id="adlist2"  src="" style="height:400px"/></li>
                <li ><img id="adlist3"  src="" style="height:400px"/></li>
              </ul>
            </div>
            <ul class="banner-add">
              <li class="add1"><a href="#"><img src="resources/img/banner_add1.png" /></a></li>
              <div id="notice">
                	<img src="resources/img/3.jpg" style="padding-left: 6px;" />&nbsp;&nbsp;<a href="" style="text-decoration:underline; cursor:pointer;"><label id="word1"></label></a><br>
              </div>
            </ul>
          </div>
        </section>
        <!--��������-->
        <div class="plist">
    	<div id="jdtx_arrow" class="tab_arrow"><b></b></div>
        <div id="jdtx_tjsp">
        	<div id="jdtx1" class="smt t1" style="left:0px;" onmouseover="jdtxArrowMove(this);jdtxSel(['jdtx1','jdtx2','jdtx3','jdtx4','jdtx5','jdtx6'])">�ؼ���Ʒ</div>
            <div class="smc">
                <ul>
					<li class="i5">
                    	<div class="p_img"><a href="#"><img src="resources/img/2.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">����������Ż�</a></div>
                    	<div class="p_price">��8199.<span>00</span></div>
                    </li>
                    <li class="i6">
                    	<div class="p_img"><a href="#"><img src="resources/img/577b554bN0f417f78.png" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">vivo�����ֻ�</a></div>
                    	<div class="p_price">��8199.<span>00</span></div>
                    </li>
                    <li class="lc">
                    	<div class="p_img"><a href="#"><img src="resources/img/56e99296N7bcaf336.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">����(SAMSUNG)SCH-I829</a></div>
                    	<div class="p_price">��1999.<span>00</span></div>
                    </li>
                    <li class="lc">
                    	<div class="p_img"><a href="#"><img src="resources/img/1133---.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��ˮ�������̳��׷���</a></div>
                    	<div class="p_price">��268.<span>00</span></div>
                    </li>
                    <li class="lc">
                    	<div class="p_img"><a href="#"><img src="resources/img/1127.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">ʱ�����</a></div>
                    	<div class="p_price">��3298.<span>00</span></div>
                    </li>
                    <li class="lc">
                    	<div class="p_img"><a href="#"><img src="resources/img/578f2257N34d9da25.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��T����</a></div>
                    	<div class="p_price">��ֵ�ͼ۽���һ�죡</div>
                    </li>
                </ul>
            </div></div>
        <div id="jdtx_djd">
        	<div id="jdtx2" class="smt t2" style="left:158px;" onmouseover="jdtxArrowMove(this);jdtxSel(['jdtx2','jdtx1','jdtx3','jdtx4','jdtx5','jdtx6'])">��װ</div>
            <div class="smc dn">
            	<ul>
					<li class="i5">
                    	<div class="p_img"><a href="#"><img src="resources/img/tshir_img.png" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��T</a></div>
                    	<div class="p_price">��333.<span>00</span></div>
                    </li>
                	<li class="i6">
                    	<div class="p_img"><a href="#"><img src="resources/img/5770e54bN78536cc4.png" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��ɫT��</a></div>
                    	<div class="p_price">��199.<span>00</span></div>
                    </li>
                	<li class="i7">
                    	<div class="p_img"><a href="#"><img src="resources/img/view_right_img03.png" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">ţ�п�</a></div>
                    	<div class="p_price">��899.<span>00</span></div>
                    </li>
                	<li class="i8">
                    	<div class="p_img"><a href="#"><img src="resources/img/view_right_img01.png" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">С��Ь</a></div>
                    	<div class="p_price">��499.<span>00</span></div>
                    </li>
                	<li class="i9">
                    	<div class="p_img"><a href="#"><img src="resources/img/578f2257N34d9da25.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">ŮT</a></div>
                    	<div class="p_price">��99.<span>00</span></div>
                    </li>
                	<li class="i10">
                    	<div class="p_img"><a href="#"><img src="resources/img/1132.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">�߸�Ь</a></div>
                    	<div class="p_price">��8199.<span>00</span></div>
                    </li>
                </ul>
            </div></div>
		<div id="jdtx_xjd">
        	<div id="jdtx3" class="smt t3" style="left:316px;" onmouseover="jdtxArrowMove(this);jdtxSel(['jdtx3','jdtx1','jdtx2','jdtx4','jdtx5','jdtx6'])">��ױƷ</div>
            <div class="smc dn">
            	<ul> 
					<li class="i5">
                    	<div class="p_img"><a href="#"><img src="resources/img/1129.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">ˬ��ˮ</a></div>
                    	<div class="p_price">��899.<span>00</span></div>
                    </li>
                	<li class="i6">
                    	<div class="p_img"><a href="#"><img src="resources/img/1129.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">�۵�</a></div>
                    	<div class="p_price">��555.<span>00</span></div>
                    </li>
                	<li class="i7">
                    	<div class="p_img"><a href="#"><img src="resources/img/1133---.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��ˮ</a></div>
                    	<div class="p_price">��1199.<span>00</span></div>
                    </li>
                	<li class="i8">
                    	<div class="p_img"><a href="#"><img src="resources/img/1134.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��ʿ��ˮ</a></div>
                    	<div class="p_price">��1009.<span>00</span></div>
                    </li>
                	<li class="i9">
                    	<div class="p_img"><a href="#"><img src="resources/img/T1aY2WFLhaXXX7TDgT_012851.jpg_b.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��ˮ</a></div>
                    	<div class="p_price">��899.<span>00</span></div>
                    </li>
                	<li class="i10">
                    	<div class="p_img"><a href="#"><img src="resources/img/1129.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">�۵�</a></div>
                    	<div class="p_price">��555.<span>00</span></div>
                    </li>
                </ul>
            </div></div>
		<div id="jdtx_sjtx">
        	<div id="jdtx4" class="smt t4" style="left:474px;" onmouseover="jdtxArrowMove(this);jdtxSel(['jdtx4','jdtx1','jdtx2','jdtx3','jdtx5','jdtx6'])">�ֻ�ͨѶ</div>
            <div class="smc dn">
            	<ul>  
					<li class="i5">
                    	<div class="p_img"><a href="#"><img src="resources/img/55f0e80aN532efcae.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">iphone6s</a></div>
                    	<div class="p_price">��8199.<span>00</span></div>
                    </li>             	
                	<li class="i6">
                    	<div class="p_img"><a href="#"><img src="resources/img/56e99296N7bcaf336.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">OPPOR9</a></div>
                    	<div class="p_price">��2199.<span>00</span></div>
                    </li>
                	<li class="i7">
                    	<div class="p_img"><a href="#"><img src="resources/img/123.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��ݮ</a></div>
                    	<div class="p_price">��1199.<span>00</span></div>
                    </li>
                	<li class="i8">
                    	<div class="p_img"><a href="#"><img src="resources/img/p9.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��ΪP9</a></div>
                    	<div class="p_price">��1229.<span>00</span></div>
                    </li>
                	<li class="i9">
                    	<div class="p_img"><a href="#"><img src="resources/img/577b554bN0f417f78.png" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">VIVO�����ֻ�</a></div>
                    	<div class="p_price">��8199.<span>00</span></div>
                    </li>
                	<li class="i10">
                    	<div class="p_img"><a href="#"><img src="resources/img/5782fa11Nf6e0ea53.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">Honor</a></div>
                    	<div class="p_price">��1234.<span>00</span></div>
                    </li>
                </ul>
            </div></div>
			<div id="jdtx_qcwj">
        	<div id="jdtx5" class="smt t5" style="left:632px;" onmouseover="jdtxArrowMove(this);jdtxSel(['jdtx5','jdtx1','jdtx2','jdtx3','jdtx4','jdtx6'])">���Ӳ�Ʒ</div>
            <div class="smc dn">
            	<ul>
				<li class="i5">
                    	<div class="p_img"><a href="#"><img src="resources/img/564c22beN59bd795c.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��ɫU��</a></div>
                    	<div class="p_price">��199.<span>00</span></div>
                    </li>
                	<li class="i6">
                    	<div class="p_img"><a href="#"><img src="resources/img/578c4019N8410ca3d.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��Ϸ����</a></div>
                    	<div class="p_price">��10099.<span>00</span></div>
                    </li>
                	<li class="i7">
                    	<div class="p_img"><a href="#"><img src="resources/img/5767d6b0N4fbbf796.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��������</a></div>
                    	<div class="p_price">��8199.<span>00</span></div>
                    </li>
                	<li class="i8">
                    	<div class="p_img"><a href="#"><img src="resources/img/55715cdeNbb5fab51.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��籦</a></div>
                    	<div class="p_price">��666.<span>00</span></div>
                    </li>
                	<li class="i9">
                    	<div class="p_img"><a href="#"><img src="resources/img/TB12RjEGXXXXXXbXVXXpcPWFXXX_115737.jpg_b.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">���1</a></div>
                    	<div class="p_price">��2199.<span>00</span></div>
                    </li>
                	<li class="i10">
                    	<div class="p_img"><a href="#"><img src="resources/img/T1rXjAFPtXXXciO8U3_050819.jpg_b.jpg" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">���2</a></div>
                    	<div class="p_price">��3199.<span>00</span></div>
                    </li>
                </ul>
            </div></div>
			<div id="jjdtx_s6">
        	<div id="jdtx6" class="smt t6" style="left:790px;" onmouseover="jdtxArrowMove(this);jdtxSel(['jdtx6','jdtx1','jdtx2','jdtx3','jdtx4','jdtx5'])">��Ʒ����</div>
            <div class="smc dn">
            	<ul>
				<li class="i5">
                    	<div class="p_img"><a href="#"><img src="resources/img/view_right_img02.png" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">ʱ�������</a></div>
                    	<div class="p_price">��9999.<span>00</span></div>
                    </li>
                	<li class="i6">
                    	<div class="p_img"><a href="#"><img src="resources/img/quick_thum_img.png" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">��ɫ̫����</a></div>
                    	<div class="p_price">��899.<span>00</span></div>
                    </li>
                	<li class="i7">
                    	<div class="p_img"><a href="#"><img src="resources/img/1138.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">���</a></div>
                    	<div class="p_price">��8199.<span>00</span></div>
                    </li>
                	<li class="i8">
                    	<div class="p_img"><a href="#"><img src="resources/img/1144.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">ī��</a></div>
                    	<div class="p_price">��321.<span>00</span></div>
                    </li>
                	<li class="i9">
                    	<div class="p_img"><a href="#"><img src="resources/img/1130.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">����</a></div>
                    	<div class="p_price">��777.<span>00</span></div>
                    </li>
                	<li class="i10">
                    	<div class="p_img"><a href="#"><img src="resources/img/1128.gif" style=" width:100px; height:100px " /></a></div>
                    	<div class="p_name"><a href="#">ǧ�����</a></div>
                    	<div class="p_price">��8199.<span>00</span></div>
                    </li>
                </ul>
            </div></div></div>
        <section class="content-wrapper">
          <div class="content-container container">
            <div class="heading-block">
              <h1>�ؼ���Ʒ</h1>
              <ul class="pagination">
                <li class="grid"><a href="#">Grid</a></li>
              </ul>
            </div>
            <div class="feature-block">
              <ul id="mix" class="product-grid">
              </ul>
            </div>
            <div class="heading-block">
              <h1>������Ʒ</h1>
            </div>
            <div class="new-product-block">
              <ul class="product-grid" id="isnew">
              </ul>
              </div>
             <div class="heading-block">
              <h1>�Ƽ���Ʒ</h1>
            </div>
            <div class="new-product-block">
              <ul class="product-grid" id="isspecial">
              	<%-- <c:if test="${fn:length(sessionScope.products) > 0}">
              		<c:forEach items="${sessionScope.products}" var="prod">
              		<li>
	                  <div class="pro-img">
	                    <img width="175" height="175" src="upfile/${prod.picture}" />
	                  </div>
	                  <div class="pro-content">
	                    <p>${prod.productname}</p>
	                  </div>
	                  <div class="pro-price">${prod.nowprice}</div>
	                  <div class="pro-btn-block"> <a class="add-cart left" href="addcart?product.id=${prod.id}&prodcount=1" title="Add to Cart">���빺�ﳵ</a> <a class="add-cart right quickCart inline" href="proddetail?product.id=${prod.id}" title="Quick View">��Ʒ����</a> </div>
	                  <div class="pro-link-block"> <a class="add-wishlist left" href="" title="Add to wishlist">�����ղ�</a> <a class="add-compare right" href="#" title="Add to Compare">��ӱȽ�</a>
	                    <div class="clearfix"></div>
	                  </div>
                    </li>
              		</c:forEach>
              	</c:if> --%>
              </ul>
            </div>
            
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
             
		<a href="" class="cd-top">Top</a>                         
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

