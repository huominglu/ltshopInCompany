// JavaScript Document
// 用户登录检查 
function check(){
	var loginid=document.getElementById("login").value;
	var password=document.getElementById("password").value;
	if(loginid==""){
		document.getElementById("info").innerHTML = "请输入用户名!";
		return false;
	}else if(password==""){
		document.getElementById("info1").innerHTML = "请输入密码!";
		return false;
	}else{
		return true;
	}
}
//用户检查
function check1(){
	var loginid=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	if(loginid==""){
		document.getElementById("info").innerHTML = "<font color='red'>请输入用户名</font>";
		return false;
	}else if(loginid!=""){
		var username = /^[a-zA-Z]\w{3,9}$/;
		if(!username.test(loginid)){
			document.getElementById("info").innerHTML = "<font color='red'>用户名以字母开头的4到10个字符</font>";
			return false;
		}else{
			document.getElementById("info").innerHTML = "<font color='green'>用户名输入通过</font>";			
		}
	}
	if(password==""){
		document.getElementById("info1").innerHTML = "<font color='red'>请输入密码</font>";
		return false;
	}else if(password!=""){
		var psw =  /[a-zA-Z0-9]{5,14}/;
		if(!psw.test(password)){
			document.getElementById("info1").innerHTML = "<font color='red'>密码必须是长度6到15并且含字符</font>";
			return false;
		}else{
			document.getElementById("info1").innerHTML = "<font color='green'>密码输入通过</font>";			
		}		
	}
	return true;	
}
//商品检查
function checkPro(){
	var productName=document.getElementById("productName").value;
	var introduce=document.getElementById("introduce").value;
	var price=document.getElementById("price").value;
	var nowPrice=document.getElementById("nowPrice").value;
	var productNum=document.getElementById("productNum").value;
	var origin=document.getElementById("origin").value;
	
	if(productName==""){
		document.getElementById("info3").innerHTML = "<font color='red'>请输入商品名</font>";
		return false;
	}else if(productName!=""){
		document.getElementById("info3").innerHTML = "<font color='green'>输入通过</font>";			
	}
	if(introduce==""){
		document.getElementById("info").innerHTML = "<font color='red'>请输入商品介绍</font>";
		return false;
	}else if(introduce!=""){
		var intro = /^.{0,100}$/;
		if(!intro.test(introduce)){
			document.getElementById("info").innerHTML = "<font color='red'>只能输入一百个字</font>";
			return false;
		}else{
			document.getElementById("info").innerHTML = "<font color='green'>输入通过</font>";			
		}
	}
	if(price==""){
		document.getElementById("info1").innerHTML = "<font color='red'>请输入价格</font>";
		return false;
	}else if(price!=""){
		var pri =  /^\d+(\.\d+)?$/;
		if(!pri.test(price)){
			document.getElementById("info1").innerHTML = "<font color='red'>只能输入数字</font>";
			return false;
		}else{
			document.getElementById("info1").innerHTML = "<font color='green'>输入通过</font>";			
		}		
	}
	if(nowPrice==""){
		document.getElementById("info2").innerHTML = "<font color='red'>请输入价格</font>";
		return false;
	}else if(nowPrice!=""){
		var nowP =  /^\d+(\.\d+)?$/;
		if(!nowP.test(nowPrice)){
			document.getElementById("info2").innerHTML = "<font color='red'>只能输入数字</font>";
			return false;
		}else{
			document.getElementById("info2").innerHTML = "<font color='green'>输入通过</font>";			
		}		
	}
	if(productNum==""){
		document.getElementById("info4").innerHTML = "<font color='red'>请输入价格</font>";
		return false;
	}else if(productNum!=""){
		var pd =  /^\d$/;
		if(!pd.test(productNum)){
			document.getElementById("info4").innerHTML = "<font color='red'>只能输入数字</font>";
			return false;
		}else{
			document.getElementById("info4").innerHTML = "<font color='green'>输入通过</font>";			
		}		
	}
	if(origin==""){
		document.getElementById("info5").innerHTML = "<font color='red'>请输入来源</font>";
		return false;
	}else if(origin!=""){
		document.getElementById("info5").innerHTML = "<font color='green'>输入通过</font>";				
	}
	return true;	
}
//大类检查
function checkSuperType(){
	var typeName=document.getElementById("typeName").value;
	
	if(typeName==""){
		document.getElementById("info").innerHTML = "<font color='red'>请输入大类名称</font>";
		return false;
	}else if(typeName!=""){
		document.getElementById("info").innerHTML = "<font color='green'>输入通过</font>";				
	}
	return true;	
}
//小类检查
function checkSubType(){
	var subTypeName=document.getElementById("subTypeName").value;
	
	if(subTypeName==""){
		document.getElementById("info").innerHTML = "<font color='red'>请输入小类名称</font>";
		return false;
	}else if(subTypeName!=""){
		document.getElementById("info").innerHTML = "<font color='green'>输入通过</font>";				
	}
	return true;	
}
//属性检查
function checkattr(){
	var attrName=document.getElementById("attrName").value;
	var attrValue=document.getElementById("attrValue").value;
	
	if(attrName==""){
		document.getElementById("info").innerHTML = "<font color='red'>请输入属性名称</font>";
		return false;
	}else if(attrName!=""){
		document.getElementById("info").innerHTML = "<font color='green'>输入通过</font>";				
	}
	return true;
	
	if(attrValue==""){
		document.getElementById("info2").innerHTML = "<font color='red'>请输入属性值</font>";
		return false;
	}else if(attrValue!=""){
		document.getElementById("info2").innerHTML = "<font color='green'>输入通过</font>";				
	}
	return true;		
}
//公告检查
function checkNotice(){
	var notice=document.getElementById("notice").value;
	
	if(notice==""){
		document.getElementById("info").innerHTML = "<font color='red'>请输入公告内容</font>";
		return false;
	}else if(notice!=""){
		document.getElementById("info").innerHTML = "<font color='green'>输入通过</font>";				
	}
	return true;	
}
//广告检查
function checkAd(){
	var description=document.getElementById("description").value;
	
	if(description==""){
		document.getElementById("info").innerHTML = "<font color='red'>请输入广告描述</font>";
		return false;
	}else if(description!=""){
		document.getElementById("info").innerHTML = "<font color='green'>输入通过</font>";				
	}
	return true;	
}