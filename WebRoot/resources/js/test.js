// JavaScript Document
// 用户登录检查 
function checkLogin(){
	var loginid=document.getElementById("login").value;
	var password=document.getElementById("password").value;
	if(loginid==""){
		document.getElementById("info").innerHTML = "<font color='red'>&nbsp&nbsp请输入用户名</font>";
		return false;
	}else if(loginid!=""){
		var username = /^[a-zA-Z]\w{3,9}$/;
		if(!username.test(loginid)){
			document.getElementById("info").innerHTML = "<font color='red'>&nbsp&nbsp用户名以字母开头的4到10个字符</font>";
			return false;
		}else{
			document.getElementById("info").innerHTML = "<font color='green'>&nbsp&nbsp用户名输入通过</font>";			
		}
	}
	if(password==""){
		document.getElementById("info1").innerHTML = "<font color='red'>&nbsp&nbsp请输入密码</font>";
		return false;
	}else if(password!=""){
		var psw =  /[a-zA-Z0-9]{5,14}/;
		if(!psw.test(password)){
			document.getElementById("info1").innerHTML = "<font color='red'>&nbsp&nbsp密码必须是长度6到15并且含字符</font>";
			return false;
		}else{
			document.getElementById("info1").innerHTML = "<font color='green'>&nbsp&nbsp密码输入通过</font>";			
		}		
	}
	return true;	
}
// 用户注册 
function checkRegister(){
	var tel=document.getElementById("phone").value;
	var email=document.getElementById("email").value;
	var loginid=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	var psw1=document.getElementById("psw").value;
	
	if(tel==""){
		document.getElementById("info").innerHTML = "<font color='red'>请输入手机号</font>";
		return false;
	}else if(tel!=""){
		if(!(/^1[3|4|5|7|8]\d{9}$/.test(tel))){ 
			document.getElementById("info").innerHTML = "<font color='red'>手机号输入错误</font>";
			return false;
		}else{
			document.getElementById("info").innerHTML = "<font color='green'>手机号输入通过</font>";
		}
	}
	
	if(email==""){
		document.getElementById("info1").innerHTML = "<font color='red'>请输入邮箱</font>";
		return false;
	}else if(email!=""){
		if(!(/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/.test(email))){ 
			document.getElementById("info1").innerHTML = "<font color='red'>邮箱格式错误</font>";
			return false;
		}else{
			document.getElementById("info1").innerHTML = "<font color='green'>邮箱输入通过</font>";
		}
	}
	
	if(loginid==""){
		document.getElementById("info2").innerHTML = "<font color='red'>请输入用户名</font>";
		return false;
	}else if(loginid!=""){
		var username = /^[a-zA-Z]\w{3,9}$/;
		if(!username.test(loginid)){
			document.getElementById("info2").innerHTML = "<font color='red'>用户名以字母开头的4到10个字符</font>";
			return false;
		}else{
			document.getElementById("info2").innerHTML = "<font color='green'>用户名输入通过</font>";			
		}
	}
	
	if(password==""){
		document.getElementById("info3").innerHTML = "<font color='red'>请输入密码</font>";
		return false;
	}else if(password!=""){
		var psw =  /[a-zA-Z0-9]{5,14}/;
		if(!psw.test(password)){
			document.getElementById("info3").innerHTML = "<font color='red'>密码必须是长度6到15并且含字符</font>";
			return false;
		}else{
			document.getElementById("info3").innerHTML = "<font color='green'>密码输入通过</font>";			
		}		
	}
	
	if(psw1==""){
		document.getElementById("info4").innerHTML = "<font color='red'>请再次输入密码</font>";
		return false;
	}else if(psw1!=""){
		if(psw1 != password){
			document.getElementById("info4").innerHTML = "<font color='red'>密码输入不一致</font>";
			return false;
		}else{
			document.getElementById("info4").innerHTML = "<font color='green'>密码输入通过</font>";			
		}		
	}
	return true;	
}
// 完善用户信息 
function checkUserinfo(){

	var password=document.getElementById("password").value;
	var rname=document.getElementById("realname").value;	
	var tel=document.getElementById("mobil").value;
	var ph=document.getElementById("phone").value;
	var email=document.getElementById("email").value;
	var pc=document.getElementById("postcode").value;
	
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
	
	if(rname==""){
		document.getElementById("info2").innerHTML = "<font color='red'>请输入真实姓名</font>";
		return false;
	}else if(rname!=""){
		if(!(/^[\u4e00-\u9fa5]{2,4}$/.test(rname))){
			document.getElementById("info2").innerHTML = "<font color='red'>真实姓名只能是2到4个字</font>";
			return false;
		}else{
			document.getElementById("info2").innerHTML = "<font color='green'>输入通过</font>";			
		}		
	}
	
	if(tel==""){
		document.getElementById("info4").innerHTML = "<font color='red'>请输入手机号</font>";
		return false;
	}else if(tel!=""){
		if(!(/^1[3|4|5|7|8]\d{9}$/.test(tel))){ 
			document.getElementById("info4").innerHTML = "<font color='red'>手机号输入错误</font>";
			return false;
		}else{
			document.getElementById("info4").innerHTML = "<font color='green'>手机号输入通过</font>";
		}
	}
	
	if(ph==""){
		document.getElementById("info5").innerHTML = "<font color='red'>请输入固定电话</font>";
		return false;
	}else if(ph!=""){
		if(!(/\d{3}-\d{8}|\d{4}-\d{7}/.test(ph))){ 
			document.getElementById("info5").innerHTML = "<font color='red'>输入格式xxxx-xxxxxxx</font>";
			return false;
		}else{
			document.getElementById("info5").innerHTML = "<font color='green'>输入通过</font>";
		}
	}
	
	if(email==""){
		document.getElementById("info6").innerHTML = "<font color='red'>请输入邮箱</font>";
		return false;
	}else if(email!=""){
		if(!(/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/.test(email))){ 
			document.getElementById("info6").innerHTML = "<font color='red'>邮箱格式错误</font>";
			return false;
		}else{
			document.getElementById("info6").innerHTML = "<font color='green'>邮箱输入通过</font>";
		}
	}
	
	if(pc==""){
		document.getElementById("info7").innerHTML = "<font color='red'>请输入邮编</font>";
		return false;
	}else if(pc!=""){
		if(!(/^[1-9]\d{5}$/.test(pc))){ 
			document.getElementById("info7").innerHTML = "<font color='red'>邮编6位数</font>";
			return false;
		}else{
			document.getElementById("info7").innerHTML = "<font color='green'>输入通过</font>";
		}
	}
	
	return true;	
}