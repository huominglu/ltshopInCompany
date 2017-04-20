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
<!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
<script type="text/javascript">
$(function(){
		$.ajax({
			type:"post",
			url:"getallsupertype",
			dataType:"json",
			success:function(result){
				var supertypeid = "${subtype.superType.id}";
				var jsonobj = JSON.parse(result);
				$("#superType").html("");
				$.each(jsonobj,function(i,value){
					if (value.id == supertypeid) {
						var opo = "<option selected='selected' value='"+value.id+"'>"+value.superTypeName+"</option>";
					}else{
						var opo = "<option value='"+value.id+"'>"+value.superTypeName+"</option>";
					}
					$("#superType").append(opo);
			});
			}
		});
	}); 
</script>
</head>

<body>
<div id="container">
	<h2>小类修改</h2>
    <div id="uboxstyle" align="center">	
        <form action="modifysubtype" method="post">
            <table cellspacing="0" cellpadding="0">
            <tr>
                <td>商品小类ID</td>
                <td><input type="text" name="subType.id" value="${subtype.id}" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>商品大类</td>
                <td>
                <select name="superType.id" id="superType">
                     
                 </select>     
                </td>
            </tr>
             <tr>
                <td>商品小类名</td>
                <td><input type="text" name="subType.subtypename" value="${subtype.subtypename}"/></td>
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" value="修改" style="width:90px;height:30px;color:#79A2BD;font-size:16px">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
