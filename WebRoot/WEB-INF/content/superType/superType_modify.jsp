<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>商品管理</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入样式 -->
<link type="text/css" rel="stylesheet" href="resources/css/modify.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />

<!-- 导入js -->
<script type="text/javascript" src="resources/js/select.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#superTypeName").blur(function(){
		var stname = $("#superTypeName").val();
		$.ajax({
			type:"post",
			url:"modifychecksupertypename?supertypename="+stname,
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				if (stname == "") {
					jsonobj .retjson = "请输入商品大类名称";
				}
				if (jsonobj.retjson != "") {
					$("#stnameinfo").html(jsonobj.retjson);
					$("#superTypeName").val("");
				}else{
					$("#stnameinfo").html(jsonobj.retjson);
				}
				
			}
		});
	});
});
	
function loadfocus(){
	$("#superTypeName").focus();
}
function check(){
	if ($("#superTypeName").val() == "") {
		$("#superTypeName").focus();
		return false;
	}
}
</script>
</head>

<body onload="loadfocus()">
<div id="container">
	<h2>大类修改</h2>
    <div id="uboxstyle" align="center">	
        <form action="modifysupertype" method="post">
            <table cellspacing="0" cellpadding="0">
            <tr>
                <td>大类ID</td>
                <td><input type="text" name="superType.id" value="${suptype.id}" readonly="readonly"/></td>
            </tr>
             <tr>
                <td>大类名称</td>
                <td><input type="text" name="superType.superTypeName" id="superTypeName" value="${suptype.superTypeName} "/>
                	<label id="stnameinfo" style="color:red"></label></td>
                
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" value="修改" onclick="return check()" style="width:90px;height:30px;color:#79A2BD;font-size:16px">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>


