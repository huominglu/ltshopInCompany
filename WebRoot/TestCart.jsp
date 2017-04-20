<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TestCart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="addCart" method="post">
    	id:<input type="text" name="productInCart.productid"><br>
    	productname:<input type="text" name="productInCart.productname"><br>
    	picture:<input type="text" name="productInCart.picture" value="7504b1f2-1748-4d6b-a994-442411841396.jpg"><br>
    	num:<input type="text" name="productInCart.num"><br>
    	price:<input type="text" name="productInCart.price"><br>
    	<input type="submit" value="Ìá½»">
    </form>
  </body>
</html>
