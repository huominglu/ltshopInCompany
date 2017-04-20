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
			url:"checksupertypename?supertypename="+stname,
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				if (stname == "") {
					jsonobj .retjson = "请输入商品大类名称";
				}
				if (jsonobj.retjson != "") {
					$("#stnameinfo").html(jsonobj.retjson);
					$("#superTypeName").val("");
					$("#mysptadd").submit(function(){
						return false;
					});
				}else{
					$("#stnameinfo").html(jsonobj.retjson);
					
				}
				
			}
		});
	});
});
function check(){
	if ($("#superTypeName").val() == "") {
		$("#superTypeName").focus();
		return false;
	}
}
function loadfocus(){
	$("#superTypeName").focus();
}
</script>
</head>

<body onload="loadfocus()">
<div id="container">
	<h2>大类添加</h2>
    <div id="uboxstyle" align="center">	
        <form action="addsupertype" method="post" id="mysptadd" onsubmit="return check()">
            <table cellspacing="0" cellpadding="0">
             <tr>
                <td>大类名称</td>
                <td><input type="text" name="superType.superTypeName" id="superTypeName" onblur="checkname()"/>
                	<label id="stnameinfo" style="color:red"></label></td>
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" value="添加"  style="width:90px;height:30px;color:#79A2BD;font-size:16px">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>


