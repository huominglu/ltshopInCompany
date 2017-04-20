<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台登录</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入index样式 -->
<link rel="stylesheet" type="text/css" href="resources/css/index.css">
<!-- 导入js -->
<script type="text/javascript" src="resources/js/index.js"></script>
<script type="text/javascript">
		function getcode(){
			document.getElementById("codes").src = "securitycode?"+ Math.random().toString();
		}
 </script>
</head>

<body>
    <div>
        <form method="post" action="adminLogin" class="login" onSubmit="return check()">
        <p>
          <label for="login">用户名:</label>
          <input type="text" name="admin.name" id="login" value=""><ul id="info"></ul>
          
        </p>
    
        <p>
          <label for="password">密码:</label>
          <input type="password" name="admin.password" id="password" value=""/><ul id="info1"></ul>
          <ul id="info3">${requestScope.infoname }</ul>
        </p>
        
        <p>
          <label for="code">验证码:</label>
          <input type="text" name="code" id="code" value="">
          <img  id="codes" src="securitycode"><a onclick="getcode()">看不清？</a>
          <ul id="info4">${requestScope.infocode }</ul>
        </p>
    
        <p class="login-submit">
          <button type="submit" class="login-button">Login</button>
        </p>
    
        <p class="forgot-password"><a href="">忘记密码？</a></p>
      </form>
    </div>
</body>
</html>
